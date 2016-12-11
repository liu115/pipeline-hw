module IDEX 
(
    clk_i, //required
    start_i, 	    
    RegWrite_i, //WB  
    RegWrite_o, 
    MemtoReg_i, 
    MemtoReg_o,
    Branch_i, //M
    Branch_o, 
    MemRead_i, 
    MemRead_o, 
    MemWrite_i, 
    MemWrite_o, 
    RegDst_i, //EX
    RegDst_o, 
    ALUOp_i, 
    ALUOp_o, 
    ALUSrc_i, 
    ALUSrc_o, 
    Adder_i, //Adder
    Adder_o,  
    RSdata_i, //Registers
    RSdata_o, 
    RTdata_i, 
    RTdata_o, 
    Sign_Extend_i, //Sign_Extend
    Sign_Extend_o, 
    data1_i, //MUX5  //instr[20:16]
    data1_o,         
    data2_i,         //instr[15:11]
    data2_o
);

input clk_i, start_i;
input RegWrite_i, //WB 
      MemtoReg_i, 
      Branch_i,	  //M
      MemRead_i,
      MemWrite_i, 
      RegDst_i, //EX
      //ALUOp
      ALUSrc_i;
input [1:0] ALUOp_i;
input [4:0] data1_i, 
	    data2_i;
input [31:0] Adder_i, 
	     Sign_Extend_i,
	     RSdata_i, 
	     RTdata_i;
output RegWrite_o, //WB 
       MemtoReg_o, 
       Branch_o,   //M
       MemRead_o,
       MemWrite_o, 
       RegDst_o, //EX
       //ALUOp
       ALUSrc_o;

output [1:0] ALUOp_o;
output [4:0] data1_o, 
	     data2_o;
output [31:0] Adder_o, 
	      Sign_Extend_o, 
	      RSdata_o, 
	      RTdata_o;
reg RegWrite_o, //  output
    MemtoReg_o, 
    Branch_o, 
    MemRead_o, 
    MemWrite_o, 
    RegDst_o, 
    ALUSrc_o, 
    ALUOp_o, // output 2
    data1_o, //output 5
    data2_o, 
    Adder_o, //output 32
    Sign_Extend_o, 
    RSdata_o, 
    RTdata_o;


always @ ( posedge clk_i or negedge start_i) begin
    if (~start_i) begin
	RegWrite_o <= 0;
	MemtoReg_o <= 0;
	Branch_o <= 0;
	MemRead_o <= 0;
	MemWrite_o <= 0;
	RegDst_o <= 0;
	ALUSrc_o <= 0;
	ALUOp_o <= 0;
	data1_o <= 0;
	data2_o <= 0;
	Adder_o <= 0;
	Sign_Extend_o <= 0;
	RSdata_o <= 0;
	RTdata_o <= 0;
    end
    else begin
	RegWrite_o <= RegWrite_i;
	MemtoReg_o <= MemtoReg_i;
	Branch_o <= Branch_i;
	MemRead_o <= MemRead_i;
	MemWrite_o <= MemWrite_i;
	RegDst_o <= RegDst_i;
	ALUSrc_o <= ALUSrc_i;
	ALUOp_o <= ALUOp_i;
	data1_o <= data1_i;
	data2_o <= data2_i;
	Adder_o <= Adder_i;
	Sign_Extend_o <= Sign_Extend_i;
	RSdata_o <= RSdata_i;
	RTdata_o <= RTdata_i;
    end
end
endmodule
