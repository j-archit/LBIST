// Memory Module Testbench

`timescale 1ns/1ns

module mem_tb;

    parameter word_size = 8;
    parameter add_bits = 4;
    reg clk;
    wire [0:word_size-1] r_word; 
    reg [0:word_size-1] w_word; 
    reg [0:add_bits-1] add;
    reg RW;
    reg enable;
    
    initial begin
        clk <= 0;
        enable <= 0;
    end
    always #5 clk <= ~clk;

    mem #(.word_size(word_size), .address_bits(add_bits)) mem0(.clk(clk), .enable(enable), .RW(RW), .add(add), .data_w(w_word), .data_r(r_word));

    always begin
        $monitor("Time = %f, clk = %b, RW = %b, EN = %b, \n\t add = %h, \n\t write = %h,\n\t read = %h", $time, clk, RW, enable, add, w_word, r_word);
        
        #20 $finish;
    end

endmodule