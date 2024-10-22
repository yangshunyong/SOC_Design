module top_module (
    input wire clk,
    input wire rst,
    input wire en,
    output wire [7:0] decoded_out
);

    wire [3:0] count;
    wire [2:0] decoder_in;

    assign decoder_in = count[3:1];  // Connect upper three bits of the counter to the decoder

    counter u_counter (
        .clk(clk),
        .rst(rst),
        .en(en),
        .count(count)
    );

    decoder u_decoder (
        .in(decoder_in),
        .out(decoded_out)
    );

  initial begin
    $monitor("Time: %0t | Reset: %b | Enable: %b | count:%d |Decoded Output: %b", $time, rst, en, count, decoded_out);
  end

endmodule