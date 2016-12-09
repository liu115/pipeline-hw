module EXMEM
(
	clk_i,
	start_i,
	RegWrite_i,
	MemtoReg_i,
	Branch_i,
	MemRead_i,
	MemWrite_i,
	Adderdata_i,
	ALUzero_i,
	ALUdata_i,
	RTaddr_i,
	RDaddr_i,
	RegWrite_o,
	MemtoReg_o,
	Branch_o,
	MemRead_o,
	MemWrite_o,
	Adderdata_o,
	ALUzero_o,
	ALUdata_o,
	RTaddr_o,
	RDaddr_o
);

input clk_i, start_i;
input RegWrite_i, MemtoReg_i, Branch_i, MemRead_i, MemWrite_i, ALUzero_i;
input [31:0] Adderdata_i, ALUdata_i;
input [4:0]  RTaddr_i, RDaddr_i;
output RegWrite_o, MemtoReg_o, Branch_o, MemRead_o, MemWrite_o, ALUzero_o;
output [31:0] Adderdata_o, ALUdata_o;
output [4:0]  RTaddr_o, RDaddr_o;
reg RegWrite_o, MemtoReg_o, Branch_o, MemRead_o, MemWrite_o, ALUzero_o;
reg [31:0] Adderdata_o, ALUdata_o;
reg [4:0]  RTaddr_o, RDaddr_o;

always @ ( posedge clk_i or negedge start_i) begin
  if (~start_i) begin 
	RegWrite_o <= 0;
	MemtoReg_o <= 0;
	Branch_o <= 0;
	MemRead_o <= 0;
	MemWrite_o <= 0;
	Adderdata_o <= 0;
	ALUzero_o <= 0;
	ALUdata_o <= 0;
	RTaddr_o <= 0;
	RDaddr_o <= 0;
  end
  else begin    
	RegWrite_o <= RegWrite_i;
	MemtoReg_o <= MemtoReg_i;
	Branch_o <= Branch_i;
	MemRead_o <= MemRead_i;
	MemWrite_o <= MemWrite_i;
	Adderdata_o <= Adderdata_i;
	ALUzero_o <= ALUzero_i;
	ALUdata_o <= ALUdata_i;
	RTaddr_o <= RTaddr_i;
	RDaddr_o <= RDaddr_i;
  end
end
endmodule
