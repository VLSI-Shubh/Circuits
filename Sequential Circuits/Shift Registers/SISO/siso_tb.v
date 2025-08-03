`timescale 1ns/1ns
`include "siso.v"

module siso_tb;
    parameter bits = 8;

    reg clk, rst;
    reg s_in;
    wire s_out;

    // Instantiate DUT
    siso #(.bits(bits)) uut (
        .s_in(s_in),
        .clk(clk),
        .rst(rst),
        .s_out(s_out)
    );

    // Clock generation: 10ns period
    initial clk = 0;
    always #5 clk = ~clk;

    // Test stimulus
    initial begin
        $dumpfile("siso_tb.vcd");
        $dumpvars(0, siso_tb);

        // Reset pulse
        rst = 1;
        s_in = 0;
        #20;
        rst = 0;

        // Input data: 8'b11001011, MSB first (for right-shift SISO)
        // So input bits go: 1,1,0,0,1,0,1,1
        s_in = 1; #10;
        s_in = 1; #10;
        s_in = 0; #10;
        s_in = 0; #10;
        s_in = 1; #10;
        s_in = 0; #10;
        s_in = 1; #10;
        s_in = 1; #10;

        // Wait a few clocks to shift data out
        repeat (bits) begin
            s_in = 0;  // can keep zero or any value now
            #10;
        end

        $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t | rst=%b | clk=%b | s_in=%b | s_out=%b", $time, rst, clk, s_in, s_out);
    end
endmodule
