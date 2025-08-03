`timescale 1ns/1ns
`include "comparator.v" 

module comp_tb;
    parameter bits = 4;
    reg  [bits-1:0] a, b;
    wire Lt, Gt, Et;

    // Instantiate the comparator
    comp #(.bits(bits)) uut (
        .in1(a),
        .in2(b),
        .Lt(Lt),
        .Gt(Gt),
        .Et(Et)
    );

    initial begin

        $dumpfile("comp_tb.vcd");
        $dumpvars(0, comp_tb);          
        $display("Time\t a\t b\t Lt\t Gt\t Et");
        $monitor("%g\t %d\t %d\t %b\t %b\t %b", $time, a, b, Lt, Gt, Et);

        // Test case 1: a < b
        a = 4'd3; b = 4'd7;  #5;

        // Test case 2: a == b
        a = 4'd7; b = 4'd7;  #5;

        // Test case 3: a > b
        a = 4'd8; b = 4'd2;  #5;

        // Test case 4: edge case (min values)
        a = 4'd0; b = 4'd0;  #5;

        // Test case 5: edge case (max values)
        a = 4'd15; b = 4'd14; #5;

        // Test case 6: another random test
        a = 4'd5; b = 4'd10; #5;

        #10 $finish;
    end
endmodule
