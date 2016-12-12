`define CYCLE_TIME 20
module reg_tb;
reg Clk;
reg Start;
reg i0, i1, i2, i3, i4, i6;
reg [31:0] i5, i7;
reg [4:0] i8;
reg [31:0] i9;
wire o0, o1, o2, o3, o4, o6;
wire [31:0] o5, o7;
wire [4:0] o8;
wire [31:0] o9;
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
  i0 = 1'b0;
  i1 = 1'b1;
  i2 = 1'b0;
  i3 = 1'b1;
  i4 = 1'b0;
  i5 = 32'd5;
  i6 = 1'b0;
  i7 = 32'd7;
  i8 = 5'd8;
  i9 = 32'd9;

  #(`CYCLE_TIME/4)
  Start = 1;

end
always@(posedge Clk) begin
  //change the input and output you want to show
    i0 <= i0 + 1;
    i1 <= i1 + 1;
    i2 <= i2 + 1;
    i3 <= i3 + 1;
    i4 <= i4 + 1;
    i5 <= i5 + 1;
    i6 <= i6 + 1;
    i7 <= i7 + 1;
    i8 <= i8 + 1;
    i9 <= i9 + 1;
end
always@(posedge Clk) begin
  if (counter == 5)
    $finish;
  //change the input and output you want to show
  $display("%dns %d %d %d %d %d %d %d %d %d %d\n %d %d %d %d %d %d %d %d %d %d", $stime, i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, o0, o1, o2, o3, o4, o5, o6, o7, o8, o9);

  
  counter = counter + 1;

end
    //change the module you want
    EXMEM EXMEM(Clk, Start, i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, o0, o1, o2, o3, o4, o5, o6, o7, o8, o9);

endmodule
