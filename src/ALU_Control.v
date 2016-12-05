module ALU_Control (funct_i, ALUOp_i, ALUCtrl_o);

input [5:0] funct_i;
input ALUOp_i;
output [2:0] ALUCtrl_o;
reg [2:0] ALUCtrl_o;

always @ ( * ) begin
  if (ALUOp_i == 1'b1) begin
    ALUCtrl_o = 3'b000;
  end
  else begin
    case (funct_i)
      6'b100000: ALUCtrl_o = 3'b000;  //add 000
      6'b100010: ALUCtrl_o = 3'b001;  //sub 001
      6'b011000: ALUCtrl_o = 3'b010;  //mul 010
      6'b100100: ALUCtrl_o = 3'b011;  //add 011
      6'b100101: ALUCtrl_o = 3'b100;  //or 100
      default:   ALUCtrl_o = 3'b000;  //don't care
    endcase
  end

end


endmodule
