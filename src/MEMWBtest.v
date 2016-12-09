`define CYCLE_TIME 20
module reg_tb;
reg Clk;
reg Start;
reg  a1, b1;
reg [31:0] c1, d1;
reg [4:0] e1;
wire  a2, b2;
wire [31:0] c2, d2;
wire [4:0] e2;
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
  a1 = 1'b0;
  b1 = 1'b1;
  c1 = 32'b01111111111111111111111111111111;
  d1 = 32'b00000000000000000000000000000001;
  e1 = 5'b10000;
  //IFID.addr_o = 0;
  //IFID.inst_o = 0;

  #(`CYCLE_TIME/4)
  Start = 1;
  //$display("%dns %d %d %d %d", $stime, a, b, c, d);


  //$display("%dns %d %d %d %d", $stime, a, b, c, d);

  //$display("%dns %d %d %d %d", $stime, a, b, c, d);


  //$display("%dns %d %d %d %d", $stime, a, b, c, d);
  //$display("%dns %d %d %d %d", $stime, a, b, c, d);

end
always@(posedge Clk) begin
    a1 <= a1 + 1;
    b1 <= b1 + 1;
    c1 <= c1 + 1;
    d1 <= d1 + 1;
    e1 <= e1 + 1;
end
always@(posedge Clk) begin
  if (counter == 5)
    $finish;
  $display("%dns %d %d %d %d %d %d %d %d %d %d", $stime, a1, b1, c1, d1, e1, a2, b2, c2, d2, e2);


  counter = counter + 1;
  //$display("%dns %d %d %d %d", $stime, a, b, c, d);

end

    MEMWB MEMWB(Clk, Start, a1, b1, c1, d1, e1, a2, b2, c2, d2, e2);

endmodule
