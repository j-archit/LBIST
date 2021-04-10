module tb;

    reg fault, net;
    reg FEN;
    wire op;

    fim A(faultt, net, FEN, op);

    always begin
        $monitor("x=%b,net=%b,TEN=%b,op=%b", fault, net, FEN, op);
        #5 
        fault <= 0;
        net <=1;
        FEN <= 0;

        #5
        fault <= 1;
        net <= 0;
        FEN <= 1;

        #5
        $finish;
    end 

endmodule