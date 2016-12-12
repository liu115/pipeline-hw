`define CYCLE_TIME 20
module reg_tb;
reg Clk;
reg Start;
reg i1, i2, i3, i4, i5, i6, i8;
reg [1:0] i7;
reg [31:0] i9, i10, i11, i12;
reg [4:0] i13, i14;
wire o1, o2, o3, o4, o5, o6, o8;
wire [1:0] o7;
wire [31:0] o9, o10, o11, o12;
wire [4:0] o13, o14;

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
    i1 = 1'b0;
    i2 = 1'b1;
    i3 = 1'b0;
    i4 = 1'b1;
    i5 = 1'b0;
    i6 = 1'b1;
    i8 = 1'b0;
    i7 = 2'd3;
    i9 = 32'd6;
    i10 = 32'd7;
    i11 = 32'd8;
    i12 = 32'd9;
    i13 = 5'd4;
    i14 = 5'd5;
    /*
    reg  a1, b1;
    reg [31:0] c1, d1;
    reg [4:0] e1;
    wire  a2, b2;
    wire [31:0] c2, d2;
    wire [4:0] e2;

    //IFID.addr_o = 0;
    //IFID.inst_o = 0;
    */
    #(`CYCLE_TIME/4)
    Start = 1;
    //$display("%dns %d %d %d %d", $stime, a, b, c, d);


    //$display("%dns %d %d %d %d", $stime, a, b, c, d);

    //$display("%dns %d %d %d %d", $stime, a, b, c, d);


    //$display("%dns %d %d %d %d", $stime, a, b, c, d);
    //$display("%dns %d %d %d %d", $stime, a, b, c, d);

end
always@(posedge Clk) begin
    i1 <= i1 + 1;
    i2 <= i2 + 1;
    i3 <= i3 + 1;
    i4 <= i4 + 1;
    i5 <= i5 + 1;
    i6 <= i6 + 1;
    i7 <= i7 + 1;
    i8 <= i8 + 1;
    i9 <= i9 + 1;
    i10 <= i10 + 1;
    i11 <= i11 + 1;
    i12 <= i12 + 1;
    i13 <= i13 + 1;
    i14 <= i14 + 1;
end
always@(posedge Clk) begin
    if (counter == 5)
	$finish;
    //$display("%dns %d %d %d %d %d %d %d %d %d %d", $stime, a1, b1, c1, d1, e1, a2, b2, c2, d2, e2);

    $display("#####\n");
    $display("%dns %d %d %d %d %d %d %d %d %d %d %d %d %d %d\n", $stime, i1, i2, i3, i4, i5, i6, i8, i7, i13, i14, i9, i10, i11, i12);
    $display("%dns %d %d %d %d %d %d %d %d %d %d %d %d %d %d\n", $stime, o1, o2, o3, o4, o5, o6, o8, o7, o13, o14, o9, o10, o11, o12);
    counter = counter + 1;
    //$display("%dns %d %d %d %d", $stime, a, b, c, d);

end

IDEX IDEX(Clk, Start, i1, o1, i2, o2, i3, o3, i4, o4, i5, o5, i6, o6, i7, o7, i8, o8, i9, o9, i10, o10, i11, o11, i12, o12, i13, o13, i14, o14);

endmodule
