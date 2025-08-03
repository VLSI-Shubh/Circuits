`timescale 1ns / 1ns

module mux_Nx1_tb;

  // Parameters matching DUT
  parameter N = 8;
  parameter WIDTH = 8;

  // Calculate select width (number of bits needed to select N inputs)
  localparam SEL_WIDTH = $clog2(N);

  // Concatenated inputs: N inputs each WIDTH bits wide, total N*WIDTH bits
  reg [N*WIDTH-1:0] in;

  // Select line to choose which input to output
  reg [SEL_WIDTH-1:0] sel;

  // Output from mux
  wire [WIDTH-1:0] out;

  // Instantiate the mux_Nx1 module
  mux_Nx1 #(
    .N(N),
    .WIDTH(WIDTH)
  ) uut (
    .in(in),
    .sel(sel),
    .out(out)
  );

  integer i;
  initial begin
    $dumpfile("mux_Nx1_tb.vcd");
    $dumpvars(0, mux_Nx1_tb);

    // Initialize inputs
    in = 0;
    sel = 0;

    #5;
    
    // Test each input by setting that input slice to a unique value,
    // others zero, select corresponding input, and check output
    for (i = 0; i < N; i = i + 1) begin
      // Clear all inputs
      in = 0;

      // Set input i slice to a pattern: e.g., input_i = {WIDTH{1'b1}} reversed with index to be unique
      // For a simple test, set each input slice to a value equal to i repeated or shifted
      in[i*WIDTH +: WIDTH] = {WIDTH{1'b0}} + i; // Just assign integer i in that slice
      
      sel = i;
      #10;
      $display("Time %0t | sel=%0d | in[%0d]=%0h | out=%0h",
                $time, sel, sel, in[sel*WIDTH +: WIDTH], out);
    end

    // Additional random test
    in = {8'hAA, 8'hBB, 8'hCC, 8'hDD, 8'h11, 8'h22, 8'h33, 8'h44};
    sel = 4;
    #10;
    $display("Time %0t | sel=%0d | in[4]=%0h | out=%0h", $time, sel, in[sel*WIDTH +: WIDTH], out);

    // Finish simulation
    #10 $finish;
  end

  initial begin
    $monitor("Monitor at time %0t: sel=%0d, out=%0h", $time, sel, out);
  end

endmodule
