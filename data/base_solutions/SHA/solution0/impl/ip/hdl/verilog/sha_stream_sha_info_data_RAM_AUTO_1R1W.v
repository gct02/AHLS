// ==============================================================
// Generated by Vitis HLS v2023.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================
`timescale 1 ns / 1 ps
module sha_stream_sha_info_data_RAM_AUTO_1R1W (
     
    address0, ce0,
    d0, we0, 
    q0, 
      
    address1, ce1,
    d1, we1, 
    
     
    reset, clk);

parameter DataWidth = 32;
parameter AddressWidth = 4;
parameter AddressRange = 16;
 
input[AddressWidth-1:0] address0;
input ce0;
input[DataWidth-1:0] d0;
input we0; 
output reg[DataWidth-1:0] q0; 
 
input[AddressWidth-1:0] address1;
input ce1;
input[DataWidth-1:0] d1;
input we1; 


input reset;
input clk;

(* ram_style = "auto"  *)reg [DataWidth-1:0] ram[0:AddressRange-1];

initial begin
    $readmemh("./sha_stream_sha_info_data_RAM_AUTO_1R1W.dat", ram);
end 

 





//read first
always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0) 
            ram[address0] <= d0; 
        q0 <= ram[address0];

    end
end 
 
  

always @(posedge clk)  
begin 
    if (ce1) begin
        if (we1) 
            ram[address1] <= d1; 
    end
end 



 
 

endmodule

