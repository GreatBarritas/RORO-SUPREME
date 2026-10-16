`timescale 100ns/100ns

module RORO_tb();

reg [11:0]instruccion_tb;
wire [31:0]resultado_tb;
wire ZF_tb;


RORO DUV (
    .instruccion(instruccion_tb),
    .resultado(resultado_tb),
    .ZF(ZF_tb)
);


initial
begin
    // SUMA EN LA DIRECCION 0 - 5 DE ROMA Y DE ROMINA
    instruccion_tb = 12'b0010_0000_0000; // SUMA: 12 + 5 = 17
    #100;

    instruccion_tb = 12'b0010_0001_0001; // SUMA: 7 + 14 = 21
    #100;

    instruccion_tb = 12'b0010_0010_0010; // SUMA: 25 + 10 = 35
    #100;

    instruccion_tb = 12'b0010_0011_0011; // SUMA: 3 + 9 = 12
    #100;

    instruccion_tb = 12'b0010_0100_0100; // SUMA: 40 + 20 = 60
    #100;

    instruccion_tb = 12'b0010_0101_0101; // SUMA: 18 + 30 = 48
    #100;

    // RESTA EN LA DIRECCION 6 - 11 DE ROMA Y DE ROMINA

    instruccion_tb = 12'b0110_0110_0110; // RESTA: 0 - 0 = 0
    #100;

    instruccion_tb = 12'b0110_0111_0111; // RESTA: 15 - 6 = 9
    #100;

    instruccion_tb = 12'b0110_1000_1000; // RESTA: 63 - 12 = 51
    #100;

    instruccion_tb = 12'b0110_1001_1001; // RESTA: 9 - 50 = 4294967255
    #100;

    instruccion_tb = 12'b0110_1010_1010; // RESTA: 100 - 3 = 97
    #100;

    instruccion_tb = 12'b0110_1011_1011; // RESTA: 2 - 2 = 0
    #100;

    // STL EN LA DIRECCION 12 - 15 DE ROMA Y DE ROMINA

    instruccion_tb = 12'b0111_1100_1100; // STL: 31 < 31 = 0
    #100;

    instruccion_tb = 12'b0111_1101_1101; // STL: 55 < 11 = 0
    #100;

    instruccion_tb = 12'b0111_1110_1110; // STL: 8 < 16 = 1
    #100;

    instruccion_tb = 12'b0111_1111_1111; // STL: 20 < 4 = 0
    #100;

    $finish;

end

endmodule