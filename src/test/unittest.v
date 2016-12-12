`timescale 1ns/100ps

module mux_tb;
reg [31:0] a, b;
reg [2:0] c;
wire [31:0] out;
wire zero;

initial begin
    $dumpfile("mux.vcd");
    $dumpvars;
end

initial begin
  a = 32'd200; b = 32'd100; c = 3'b000;
  $display("%dns %d %d %d %d %d", $stime, a, b, c, out, zero);
  # 100
  a = 32'd200; b = 32'd100; c = 3'b001;
  $display("%dns %d %d %d %d %d", $stime, a, b, c, out, zero);
  # 100
  a = 32'd200; b = 32'd100; c = 3'b010;
  $display("%dns %d %d %d %d %d", $stime, a, b, c, out, zero);
  # 100
  a = 32'd200; b = 32'd100; c = 3'b011;
  $display("%dns %d %d %d %d %d", $stime, a, b, c, out, zero);
  # 100
  a = 32'd200; b = 32'd100; c = 3'b100;
  $display("%dns %d %d %d %d %d", $stime, a, b, c, out, zero);
  # 100
  $finish;
end

    ALU ALU(a, b, c, out, zero);

endmodule
