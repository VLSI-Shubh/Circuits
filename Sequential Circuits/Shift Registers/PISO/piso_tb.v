`timescale 1ns/1ns
`include "piso.v"

module piso_tb;
    parameter bits = 8;

    reg clk, rst, load;
    reg [bits-1:0] d_in;
    wire s_out;


    piso #(.bits(bits)) uut (
        .d_in(d_in),
        .clk(clk),
        .rst(rst),
        .load(load),
        .s_out(s_out)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    // Test stimulus
    initial begin

        $dumpfile("piso_tb.vcd");
        $dumpvars(0);

        // Initialize inputs
        rst = 1; load = 0; d_in = 0;
        #10 rst = 0;

        // Load value
        #10 d_in = 8'b11001011; load = 1;
        #10 load = 0; // start shifting

        // Wait enough cycles to shift all bits
        #100;

        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t | rst=%b | clk=%b | load=%b | d_in=%b | s_out=%b", 
            $time, rst, clk, load, d_in, s_out);
    end
endmodule
