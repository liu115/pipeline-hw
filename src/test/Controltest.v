`define CYCLE_TIME 20
module reg_tb;
reg Clk;
reg Start;
reg [5:0] op; //input
wire  a, b, c, d, e, f, h; //output
wire [1:0] g;
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
  op = 6'b000100;
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
  $display("%dns %d %d %d %d %d %d %d %d", $stime, a, b, c, d, e, f, g, h);

  
  counter = counter + 1;

end
    //change the module you want
    Control Control(op, a, b, c, d, e, f ,g, h);

endmodule
