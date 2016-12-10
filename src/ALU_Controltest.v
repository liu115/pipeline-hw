`define CYCLE_TIME 20
module reg_tb;
reg Clk;
reg Start;
reg [5:0] func; //input
reg [1:0] op;
wire [2:0] ctrl_op;
integer counter;
always #(`CYCLE_TIME/2) Clk = ~Clk;

initial begin
    $dumpfile("test.vcd");
    $dumpvars;
end

initial begin
  counter = 0;
  Clk = 0;
  Start = 0;
  func = 6'b100101;
  op = 2'b11;
  //IFID.addr_o = 0;
  //IFID.inst_o = 0;

  #(`CYCLE_TIME/4)
  Start = 1;

end
always@(posedge Clk) begin
  //change the input and output you want to show
end
always@(posedge Clk) begin
  if (counter == 1)
    $finish;
  //change the input and output you want to show
  $display("%dns %d %d %d", $stime, func, op, ctrl_op);

  
  counter = counter + 1;

end
    //change the module you want
   ALU_Control ALU_Control(func, op, ctrl_op);

endmodule
