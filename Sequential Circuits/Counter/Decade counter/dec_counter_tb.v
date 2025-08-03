`timescale 1ns / 1ns
`include "dec_counter.v"

module dec_counter_tb;

  reg clk, reset;
  wire [3:0] q;

  dec_counter uut (
    .clk(clk),
    .reset(reset),
    .q(q)
  );

  initial begin
    $dumpfile("dec_counter_tb.vcd");
    $dumpvars(0, dec_counter_tb);
    
    clk = 0;
    reset = 0;
    #5 reset = 1;
    #10 reset = 0;
    #15 reset =1;
    #50 reset =0;


    #200;
    $finish;
  end

  always #5 clk = ~clk;

endmodule
