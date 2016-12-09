module MEMWB
(
	clk_i,
	start_i,
	RegWrite_i,
	MemtoReg_i,
	ReadData_i,
	data_i,
	RDaddr_i,
	RegWrite_o,
	MemtoReg_o,
	ReadData_o,
	data_o,
	RDaddr_o
);

input clk_i, start_i;
input  RegWrite_i, MemtoReg_i;
input [31:0] ReadData_i, data_i;
input [4:0]  RDaddr_i;
output  RegWrite_o, MemtoReg_o;
output [31:0] ReadData_o, data_o;
output [4:0] RDaddr_o;
reg RegWrite_o, MemtoReg_o, ReadData_o, data_o, RDaddr_o;

always @ ( posedge clk_i or negedge start_i) begin
  if (~start_i) begin
    RegWrite_o <= 0;
    MemtoReg_o <= 0;
    ReadData_o <= 0;
    data_o <= 0;
    RDaddr_o <=0;
  end
  else begin
    RegWrite_o <= RegWrite_i;
    MemtoReg_o <= MemtoReg_i;
    ReadData_o <= ReadData_i;
    data_o <= data_i;
    RDaddr_o <= RDaddr_i;
  end
end
endmodule
