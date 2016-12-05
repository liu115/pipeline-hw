`define CYCLE_TIME 20
module reg_tb;
reg Clk;
reg Start;
reg [4:0] a, b;
wire [4:0] c, d;
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
  a = 5'b111; b = 5'b0;
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
  if (counter == 5)
    $finish;
  $display("%dns %d %d %d %d", $stime, a, b, c, d);

  if (a == 5'b111) begin
    a <= 5'b000;
    b <= 5'b111;
  end
  else begin
    a <= 5'b111;
    b <= 5'b000;
  end
  counter = counter + 1;
  //$display("%dns %d %d %d %d", $stime, a, b, c, d);

end

    IFID IFID(Clk, Start, a, b, c, d);

endmodule
