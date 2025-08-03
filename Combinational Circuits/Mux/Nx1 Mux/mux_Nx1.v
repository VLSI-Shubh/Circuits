module mux_Nx1 #(
    parameter N = 8,
    parameter WIDTH = 8
) (
    input  [N*WIDTH-1:0] in,
    input  [$clog2(N)-1:0] sel,
    output reg [WIDTH-1:0] out
);

always @(*) begin
    out = in[sel*WIDTH +: WIDTH];
end

endmodule
