// counter_tb.sv
`timescale 1ns/1ps

module counter_tb;

  // Testbench signals
  logic clk;
  logic rst;
  logic en;
  logic [3:0] count;

  // Instantiate the counter module
  counter uut (
      .clk(clk),
      .rst(rst),
      .en(en),
      .count(count)
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

  // Monitor the count value
  initial begin
    $monitor("Time: %0t | Reset: %b | Enable: %b | Count: %0d", $time, rst, en, count);
  end

endmodule