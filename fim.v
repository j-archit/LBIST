// Fault Injector MUX

module fim 
(
    input fault, net, FEN,
    output op 
);
    assign op = FEN ? fault : net;
endmodule