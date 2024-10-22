// counter.v
module counter (
    input wire clk,
    input wire rst,
    input wire en,
    output reg [3:0] count
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 4'b0000;
    end else if (en) begin
        count <= count + 1;
    end
end

endmodule