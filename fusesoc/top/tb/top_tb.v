// top_module_tb.sv
`timescale 1ns/1ps

module top_tb;

  // Testbench signals
  logic clk;
  logic rst;
  logic en;
  logic [7:0] decoded_out;

  // Instantiate the top module
  top_module uut (
      .clk(clk),
      .rst(rst),
      .en(en),
      .decoded_out(decoded_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 100 MHz clock
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1;
    en = 0;
    #10;

    // Release reset
    rst = 0;
    #10;

    // Enable counter
    en = 1;
    #100;

    // Disable counter
    en = 0;
    #20;

    // Enable counter again
    en = 1;
    #50;

    // Finish simulation
    $finish;
  end

  // Monitor the decoded output
  initial begin
    $monitor("Time: %0t | Reset: %b | Enable: %b | Decoded Output: %b", $time, rst, en, decoded_out);
  end

endmodule