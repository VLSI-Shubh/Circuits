`timescale 1ns/1ns
 `include "subtractor.v" 

module subtractor_tb;
    parameter bits = 8;
    reg [bits-1:0] a, b;
    wire [bits-1:0] y;

    subtractor #(.bits(bits)) uut (
        .in1(a),
        .in2(b),
        .out(y)
    );

    initial begin
        $dumpfile("subtractor_tb.vcd");
        $dumpvars(0, subtractor_tb);
        $display("Time\t a\t b\t y");
        $monitor("%g\t %d\t %d\t %d", $time, a, b, y);

        // Initialize Input, but dont forget in1 should be greater than in2. That is the consideration of this subtractor
        a = 0; b = 0;         #5;
        a = 125; b = 0;       #10;
        a = 125; b = 100;     #10;
        a = 255; b = 1;       #10;
        a = 200; b = 200;     #10;
        a = 0;   b = 0;       #10;
        // Add more test cases as needed

        #10 $finish;
    end
endmodule
