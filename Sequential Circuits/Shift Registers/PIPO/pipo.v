module pipo #(parameter bits =4)(
    input [bits -1 : 0]d_in,
    input clk, rst,load,en
    output reg [bits -1 : 0]q
    );
    always @(posedge clk or posedge rst) begin
        if (rst) begin
        q<=0;
    end else begin
        if (load) begin
           q<=d_in; 
        end
    end
    end
endmodule