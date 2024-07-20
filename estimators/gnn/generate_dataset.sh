#!/bin/bash 

BASEDIR=$(dirname $0)
i_start=$1
i_end=$2

for ((i=$i_start; i<=$i_end; i++))
do
    dfg_nodes_file="${BASEDIR}/inputs/dfg_nodes${i}.txt"
    dfg_edges_file="${BASEDIR}/inputs/dfg_edges${i}.txt"
    output_file="${BASEDIR}/dataset/graphs/graph${i}.pickle"
    python "ir/ir_graph.py" $dfg_nodes_file $dfg_edges_file $output_file
done