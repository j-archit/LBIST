// Memory Module Testbench

`timescale 1ns/1ns

module mem_tb;

    parameter word_size = 8;
    parameter add_bits = 4;
    parameter f_name = "mem.mem";
    reg clk; 

    wire [word_size-1:0] word;
    reg [word_size-1:0] word_w;
    
    reg [add_bits-1:0] add;
    reg RW, EN;    
    
    mem #(.word_size(word_size), .address_bits(add_bits), .file_name(f_name)) mem0(.clk(clk), .EN(EN), .RW(RW), .add(add), .data(word));

    initial begin
        clk <= 0;
    end
    always #5 clk <= ~clk;

    // Next Statement only required when writing to the memory   
    //    assign word = RW ? word_w : 'hz;  

    always begin
        $monitor("Time = %.0f, clk = %b, RW = %b, EN = %b, \n\t add = %b, \n\t DataPin = %h", $time, clk, RW, EN, add, word);
        
        // Read from memory location F
        #2 
        RW <= 0; 
        EN <= 1;
        add <= 'hF;
        
        /* Trying to Write to Memory Location A
        #25 
        EN <= 0;
        RW <= 1;
        add <= 'hA;
        word_w <= 'hff;
        */

        #1 
        EN <= 1;

        // Read from location C
        #20 
        add <= 'hC;
        RW <= 0;

        #10 
        EN <= 0;

        // Read from Location A 
        #20 
        add <= 'hA; 
        EN <= 1;
        
        #30 $finish;
    end

endmodule