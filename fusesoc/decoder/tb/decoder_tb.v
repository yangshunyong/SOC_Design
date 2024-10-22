module decoder_tb;

    // Testbench signals
    logic [2:0] in;
    logic [7:0] out;

    // Instantiate the decoder
    decoder_3to8 uut (
        .in(in),
        .out(out)
    );

    // Clock generation (if needed)
    // logic clk;
    // initial clk = 0;
    // always #5 clk = ~clk;

    // Test procedure
    initial begin
        // Monitor the output
        $monitor("Time: %0t | in: %b | out: %b", $time, in, out);

        // Apply test vectors
        in = 3'b000; #10;
        in = 3'b001; #10;
        in = 3'b010; #10;
        in = 3'b011; #10;
        in = 3'b100; #10;
        in = 3'b101; #10;
        in = 3'b110; #10;
        in = 3'b111; #10;

        // Finish the simulation
        $finish;
    end

endmodule