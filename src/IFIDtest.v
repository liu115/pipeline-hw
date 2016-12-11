`define CYCLE_TIME 20
module reg_tb;
reg Clk;
reg Start;
reg [31:0] a, b; //input
reg write;
wire [31:0] c, d; //output
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
  a = 32'd5; b = 32'd0;
  write = 0;
  //IFID.addr_o = 0;
  //IFID.inst_o = 0;

  #(`CYCLE_TIME/4)
  Start = 1;

end
always@(posedge Clk) begin
  //change the input and output you want to show
    a <= a + 1;
    b <= b + 1;
end
always@(posedge Clk) begin
    if (counter == 2) write <= 1;
  if (counter == 5)
    $finish;
  //change the input and output you want to show
  $display("%dns %dc %d %d %d %d %d", $stime, counter, write, a, b, c, d);

  
  counter = counter + 1;

end
    //change the module you want
    IFID IFID(Clk, Start, a, b, write, c, d);

endmodule
