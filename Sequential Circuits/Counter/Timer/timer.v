// this code is for the use of counters as timer
// Seems good but it is a WIP for now

module timer #(parameter final_value = 255)(
    input clk,
    input rst,
    output reg done
);

    localparam Bits = $clog2(final_value + 1);
    reg [Bits-1:0] Q;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            Q <= 0;
            done <= 0;
        end else begin
            if (Q == final_value) begin
                done <= 1;
                Q <= 0;
            end else begin
                done <= 0;
                Q <= Q + 1;
            end
        end
    end

endmodule
