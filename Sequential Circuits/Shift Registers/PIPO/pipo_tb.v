`timescale 1ps/1ps
`include "pipo.v"

module PIPO_tb;
    parameter bits = 8;
    reg clk, rst;
    reg [bits-1:0] a;
    wire [bits-1:0] b;

    // Instantiate the DUT
    PIPO #(.bits(bits)) uut1 (.d_in(a), .clk(clk), .rst(rst), .q(b));

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Test stimulus
    initial begin
        rst = 0;
        a = 0;
        $dumpfile("pipo_tb.vcd");
        $dumpvars(0, PIPO_tb);

        #10 rst = 1;
        #10 rst = 0;
        #15 a = 8'd25;
        #20 $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t rst=%b clk=%b a=%b b=%b", $time, rst, clk, a, b);
    end
endmodule
