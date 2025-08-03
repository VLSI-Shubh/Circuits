`timescale 1ns / 1ns
`include "mux_Nx1.v"

module mux_Nx1_tb;

  parameter N = 8;
  parameter WIDTH = 8;
  localparam SEL_WIDTH = $clog2(N);

  reg [N*WIDTH-1:0] in;
  reg [SEL_WIDTH-1:0] sel;
  wire [WIDTH-1:0] out;

  // Instantiate the DUT
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
    $dumpvars(1, mux_Nx1_tb);         
    $dumpvars(1, uut);               

    // Assign distinct values to all 8 inputs for clarity in waveform
    in[7*WIDTH +: WIDTH] = 8'hAA;
    in[6*WIDTH +: WIDTH] = 8'hBB;
    in[5*WIDTH +: WIDTH] = 8'hCC;
    in[4*WIDTH +: WIDTH] = 8'hDD;
    in[3*WIDTH +: WIDTH] = 8'h11;
    in[2*WIDTH +: WIDTH] = 8'h22;
    in[1*WIDTH +: WIDTH] = 8'h33;
    in[0*WIDTH +: WIDTH] = 8'h44;

    // Wait for GTKWave to load initial values
    #10;


    for (i = 0; i < N; i = i + 1) begin
      sel = i;
      #20; 
    end


    #20;

    $finish;
  end

endmodule
