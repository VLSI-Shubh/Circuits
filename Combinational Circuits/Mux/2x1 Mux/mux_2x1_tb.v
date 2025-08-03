`timescale 1ns / 1ns
`include "mux_2x1.v"

module mux_2x1_tb;

  parameter WIDTH = 16;

  reg  [WIDTH-1:0] a, b;
  reg  sel, en;

  wire [WIDTH-1:0] output_mux;

  mux_2x1 #(.width(WIDTH)) uut (
    .in1(a),
    .in2(b),
    .sel(sel),
    .enable(en),
    .out(output_mux)
  );

  initial begin
    $dumpfile("mux_2x1_tb.vcd");
    $dumpvars(0, mux_2x1_tb);
  end

  initial begin

    a = 0;
    b = 0;
    sel = 0;
    en = 0;

    #5;
    a = 16'hFFF0; b = 16'h0AAA; sel = 0; en = 1;   
    #10;
    sel = 1;                               
    #10;
    en = 0;                               
    #10;

    $finish;
  end

  initial begin
    $monitor("time=%0t | a=%h | b=%h | sel=%b | en=%b | out=%h", 
             $time, a, b, sel, en, output_mux);
  end

endmodule
