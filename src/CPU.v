module CPU
(
    clk_i,
    rst_i,
    start_i
);

// Ports
input               clk_i;
input               rst_i;
input               start_i;

wire [31:0] inst_addr, inst;
wire zero;
// write only the in-port =, left out-port blank
// eg: *_i(X.*_o)
wire [31:0] addpc_out;
wire [31:0] ALUresult;
Control Control(
    .Op_i       (inst[31:26]),
    .RegDst_o   (MUX_RegDst.select_i),
    .ALUOp_o    (ALU_Control.ALUOp_i),
    .ALUSrc_o   (MUX_ALUSrc.select_i),
    .RegWrite_o (Registers.RegWrite_i)
);



Adder Add_PC(
    .data1_in   (inst_addr),
    .data2_in   (32'd4),
    .data_o     (addpc_out)
);


PC PC(
    .clk_i      (clk_i),
    .rst_i      (rst_i),
    .start_i    (start_i),
    .pc_i       (MUX_PCSrc.data_o),
    .pc_o       (inst_addr)
);

Instruction_Memory Instruction_Memory(
    .addr_i     (inst_addr),
    .instr_o    ()
);

Registers Registers(
    .clk_i      (clk_i),
    .RSaddr_i   (inst[25:21]),
    .RTaddr_i   (inst[20:16]),
    .RDaddr_i   (MUX_RegDst.data_o),
    .RDdata_i   (ALU.data_o), //ALU Result
    .RegWrite_i (Control.RegWrite_o),
    .RSdata_o   (ALU.data1_i),
    .RTdata_o   (MUX_ALUSrc.data1_i)
);

Data_Memory Data_Memory(
    .addr_i (ALUresult),
    .data_i (EXMEM.MemWdata_o),
    .MemWrite_i (EXMEM.MemWrite_o),
    .MemRead_i (EXMEM.MemRead_o),
    .data_o ()
);

// 0: PC = PC+4, 1: EXMEM Add result
wire PCSrc_select;
assign PCSrc_select = EXMEM.Branch_o & EXMEM.ALUzero_o;
MUX32 MUX_PCSrc(
    .data1_i (addpc_out),
    .data2_i (EXMEM.Adderdata_o),    //EXMEM add result
    .select_i (PCSrc_select),   //PCsrc control signal
    .data_o ()
);

// 1: Mem to Reg, 0: ALU result to Reg (from EXMEM)
MUX32 MUX_RegSrc(
    .data1_i (),
    .data2_i (),
    .select_i (),
    .data_o ()
);

MUX5 MUX_RegDst(
    .data1_i    (inst[20:16]),
    .data2_i    (inst[15:11]),
    .select_i   (Control.RegDst_o),
    .data_o     (Registers.RDaddr_i)
);



MUX32 MUX_ALUSrc(
    .data1_i    (Registers.RTdata_o),
    .data2_i    (Sign_Extend.data_o),
    .select_i   (Control.ALUSrc_o),
    .data_o     (ALU.data2_i)
);



Sign_Extend Sign_Extend(
    .data_i     (inst[15:0]),
    .data_o     (MUX_ALUSrc.data2_i)
);



ALU ALU(
    .data1_i    (Registers.RSdata_o),
    .data2_i    (MUX_ALUSrc.data_o),
    .ALUCtrl_i  (ALU_Control.ALUCtrl_o),
    .data_o     (Registers.RDdata_i),
    .Zero_o     (zero)
);



ALU_Control ALU_Control(
    .funct_i    (inst[5:0]),
    .ALUOp_i    (Control.ALUOp_o),
    .ALUCtrl_o  (ALU.ALUCtrl_i)
);

IFID IFID(
    .clk_i (clk_i),
    .start_i (start_i),
    .addr_i (addpc_out),
    .inst_i (Instruction_Memory.instr_o),
    .addr_o (),
    .inst_o (inst)
);

EXMEM EXMEM (
    .clk_i (clk_i),
    .start_i (start_i),
    .RegWrite_i (IDEX.RegWrite_o),
    .MemtoReg_i (IDEX.MemtoReg_o),
    .Branch_i (IDEX.Branch_o),
    .MemRead_i (IDEX.MemRead_o),
    .MemWrite_i (IDEX.MemWrite_o),
    .Adderdata_i (), // adder result
    .ALUzero_i (ALU.zero), //need to 
    .ALUdata_i (ALU.data_o), //
    .RegWaddr_i (), 
    .MemWdata_i (),
    .RegWrite_o (),
    .MemtoReg_o (),
    .Branch_o (),
    .MemRead_o (),
    .MemWrite_o (),
    .Adderdata_o (),
    .ALUzero_o (),
    .ALUdata_o (ALUresult),
    .RegWaddr_o (),
    .MemWdata_o ()
);
MEMWB MEMWB(
	clk_i (clk_i),
	start_i (start_i),
	RegWrite_i (EXMEM.RegWrite_o),
	MemtoReg_i (EXMEM.MemtoReg_o),
	ReadData_i (Data_Memory.data_o),
	ALUdata_i (ALUresult),
    RegWaddr_i (EXMEM.RegWaddr_i),
	RegWrite_o (),
	MemtoReg_o (),
	ReadData_o (),
	ALUdata_o (),
	RegWaddr_o ()
);

endmodule
