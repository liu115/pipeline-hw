`define CYCLE_TIME 20
module reg_tb;
reg Clk;
reg Start;
reg [31:0] a, b; //input
reg w, r;
wire [31:0] c; //output
integer counter;

integer i;
always #(`CYCLE_TIME/2) Clk = ~Clk;

initial begin
    $dumpfile("test.vcd");
    $dumpvars;
end

initial begin
  counter = 0;
  Clk = 0;
  Start = 0;
  a = 32'd0; b = 32'd2147483647;
  r = 0; w = 1;
  //IFID.addr_o = 0;
  //IFID.inst_o = 0;
  for (i = 0; i < 32; i = i+1) begin
    Data_Memory.memory[i] = 8'd0;
  end
    Data_Memory.memory[0] = 8'b11;
    Data_Memory.memory[1] = 8'b101;
    Data_Memory.memory[2] = 8'b0;
    Data_Memory.memory[3] = 8'b111;
    Data_Memory.memory[4] = 8'b10101;
  #(`CYCLE_TIME/4)
  Start = 1;

end
always@(posedge Clk) begin
  //change the input and output you want to show
    a <= a + 4;
    //w <= 1'b0;
    //r <= 1'b1;
    //b <= b + 1;
end
always@(posedge Clk) begin
  if (counter == 5)
    $finish;
  //change the input and output you want to show
  $display("%dns %d %b %b", $stime, a, b, c);

  for (i = 0; i < 32; i = i+1) begin
   $display("%d %b", i, Data_Memory.memory[i]);
  end
  
  counter = counter + 1;

end
    //change the module you want
    Data_Memory Data_Memory(a, b, w, r, c);

endmodule
