import torch
import torch.nn as nn
import torch.nn.functional as F
import math
from torch_geometric.nn.conv import MessagePassing
from torch_geometric.nn.inits import glorot, uniform

class HGTLayer(MessagePassing):
    def __init__(self, in_dim, out_dim, n_heads, use_norm:bool=False, dropout:float=0.5, **kwargs):
        super(HGTLayer, self).__init__(node_dim=0, aggr='add', **kwargs)

        self.in_dim = in_dim
        self.n_heads = n_heads

        assert out_dim % n_heads == 0

        self.hid_dim = out_dim // n_heads
        self.sqrt_hid_dim = math.sqrt(self.hid_dim)

        self.n_types = 3 # Inst, Var, Const
        self.n_nelations = 3 # Control, Data, Call
        self.n_meta_relations = 5 # <Inst,Control,Inst>, <Inst,Data,Var>, <Inst,Call,Inst>, <Var,Data,Inst>, <Const,Data,Inst>

        self.use_norm = use_norm

        self.k_linears_inst = nn.ModuleList([nn.Linear(in_dim, self.hid_dim, bias=True) for _ in range(n_heads)])
        self.k_linears_var = nn.ModuleList([nn.Linear(in_dim, self.hid_dim, bias=True) for _ in range(n_heads)])
        self.k_linears_const = nn.ModuleList([nn.Linear(in_dim, self.hid_dim, bias=True) for _ in range(n_heads)])

        # Const nodes are never the target node
        self.q_linears_inst = nn.ModuleList([nn.Linear(in_dim, self.hid_dim, bias=True) for _ in range(n_heads)])
        self.q_linears_var = nn.ModuleList([nn.Linear(in_dim, self.hid_dim, bias=True) for _ in range(n_heads)])

        self.m_linears_inst = nn.ModuleList([nn.Linear(in_dim, self.hid_dim, bias=True) for _ in range(n_heads)])
        self.m_linears_var = nn.ModuleList([nn.Linear(in_dim, self.hid_dim, bias=True) for _ in range(n_heads)])
        self.m_linears_const = nn.ModuleList([nn.Linear(in_dim, self.hid_dim, bias=True) for _ in range(n_heads)])

        self.a_linears_inst = nn.Linear(out_dim, out_dim, bias=False)
        self.a_linears_var = nn.Linear(out_dim, out_dim, bias=False)
    
        if use_norm:
            self.norm_inst = nn.LayerNorm(out_dim)
            self.norm_var = nn.LayerNorm(out_dim)
            self.norm_const = nn.LayerNorm(out_dim)

        self.relation_prior = nn.Parameter(torch.ones(self.n_meta_relations, 1))

        self.W_att_control = nn.Parameter(torch.Tensor(self.hid_dim, self.hid_dim))
        self.W_att_data = nn.Parameter(torch.Tensor(self.hid_dim, self.hid_dim))
        self.W_att_call = nn.Parameter(torch.Tensor(self.hid_dim, self.hid_dim))
        
        self.W_msg_control = nn.Parameter(torch.Tensor(self.hid_dim, self.hid_dim))
        self.W_msg_data = nn.Parameter(torch.Tensor(self.hid_dim, self.hid_dim))
        self.W_msg_call = nn.Parameter(torch.Tensor(self.hid_dim, self.hid_dim))

        self.dropout = nn.Dropout(dropout)

        self.reset_parameters()

    def reset_parameters(self):
        glorot(self.W_att_control)
        glorot(self.W_att_data)
        glorot(self.W_att_call)
        glorot(self.W_msg_control)
        glorot(self.W_msg_data)
        glorot(self.W_msg_call)

    def forward(self, h_inst, h_var, h_const, adj_mat_control, adj_mat_data, adj_mat_call):
        att_inst, att_var = self.attention(h_inst, h_var, h_const, adj_mat_control, adj_mat_data, adj_mat_call)
        m_targeting_inst, m_targeting_var = self.message(h_inst, h_var, h_const)
        h_updated_inst, h_updated_var = self.aggregate(m_targeting_inst, m_targeting_var, att_inst, att_var)
        h_inst, h_var, h_const = self.update(h_inst, h_var, h_const, h_updated_inst, h_updated_var)

        return h_inst, h_var, h_const

    def attention(self, h_inst, h_var, h_const, adj_mat_control, adj_mat_data, adj_mat_call):
        inst_query = torch.stack([linear(h_inst) for linear in self.q_linears_inst])
        inst_key = torch.stack([linear(h_inst) for linear in self.k_linears_inst])
        var_query = torch.stack([linear(h_var) for linear in self.q_linears_var])
        var_key = torch.stack([linear(h_var) for linear in self.k_linears_var])
        const_key = torch.stack([linear(h_const) for linear in self.k_linears_const])

        # Attention for Inst target nodes
        att_inst_control_inst = torch.stack([torch.mm(inst_key[i], torch.mm(self.W_att_control, inst_query[i])) * (self.relation_prior[0] / self.sqrt_hid_dim) for i in range(self.n_heads)])
        att_inst_call_inst = torch.stack([torch.mm(inst_key[i], torch.mm(self.W_att_call, inst_query[i])) * (self.relation_prior[1] / self.sqrt_hid_dim) for i in range(self.n_heads)])
        att_var_data_inst = torch.stack([torch.mm(var_key[i], torch.mm(self.W_att_data, var_query[i])) * (self.relation_prior[3] / self.sqrt_hid_dim) for i in range(self.n_heads)])
        att_const_data_inst = torch.stack([torch.mm(const_key[i], torch.mm(self.W_att_data, var_query[i])) * (self.relation_prior[4] / self.sqrt_hid_dim)  for i in range(self.n_heads)])

        n_inst = h_inst.shape[0]
        n_var = h_var.shape[0]

        att_inst_control_inst[:, adj_mat_control == 0] = -9e15
        att_inst_call_inst[:, adj_mat_call == 0] = -9e15
        att_var_data_inst[:, adj_mat_data[n_inst:n_inst + n_var, :n_inst] == 0] = -9e15
        att_const_data_inst[:, adj_mat_data[n_inst + n_var:, :n_inst] == 0] = -9e15

        att_inst = torch.cat([att_inst_control_inst, att_inst_call_inst, att_var_data_inst, att_const_data_inst], dim=1)
        att_inst = F.softmax(att_inst, dim=1)
        
        # Attention for Var target nodes
        att_inst_data_var = torch.stack([torch.mm(inst_key[i], torch.mm(self.W_att_data, var_query[i])) * (self.relation_prior[2] / self.sqrt_hid_dim) for i in range(self.n_heads)])

        att_inst_data_var[:, adj_mat_data[:n_inst, n_inst:n_inst + n_var] == 0] = -9e15

        att_var = F.softmax(att_inst_data_var, dim=1)

        return att_inst, att_var

    def message(self, h_inst, h_var, h_const):
        m_inst_control = torch.stack([torch.mm(linear(h_inst), self.W_msg_control) for linear in self.m_linears_inst])
        m_inst_call = torch.stack([torch.mm(linear(h_inst), self.W_msg_call) for linear in self.m_linears_inst])
        m_inst_data = torch.stack([torch.mm(linear(h_inst), self.W_msg_data) for linear in self.m_linears_inst])
        m_var_data = torch.stack([torch.mm(linear(h_var), self.W_msg_data) for linear in self.m_linears_var])
        m_const_data = torch.stack([torch.mm(linear(h_const), self.W_msg_data) for linear in self.m_linears_const])

        m_targeting_inst = torch.cat([m_inst_control, m_inst_call, m_var_data, m_const_data], dim=1)
        m_targeting_var = torch.cat([m_inst_data], dim=1)

        return m_targeting_inst, m_targeting_var
    
    def aggregate(self, m_targeting_inst, m_targeting_var, att_inst, att_var):
        n_inst = att_inst.shape[1]
        n_var = att_var.shape[1]

        h_updated_inst = torch.zeros_like(m_targeting_inst)
        h_updated_var = torch.zeros_like(m_targeting_var)

        for i in range(self.n_heads):
            h_updated_inst[i] = att_inst[i].transpose(0, 1) @ m_targeting_inst[i]
            h_updated_var[i] = att_var[i].transpose(0, 1) @ m_targeting_var[i]

        h_updated_inst = h_updated_inst.view(n_inst, self.out_dim)
        h_updated_var = h_updated_var.view(n_var, self.out_dim)

        return h_updated_inst, h_updated_var
    
    def update(self, h_inst, h_var, h_const, h_updated_inst, h_updated_var):
        h_inst = self.dropout(self.a_linears_inst(F.elu(h_updated_inst))) + h_inst
        h_var = self.dropout(self.a_linears_var(F.elu(h_updated_var))) + h_var

        if self.use_norm:
            h_inst = self.norm_inst(h_inst)
            h_var = self.norm_var(h_var)
            h_const = self.norm_const(h_const)

        return h_inst, h_var, h_const



                    