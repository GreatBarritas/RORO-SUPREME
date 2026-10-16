`timescale 1ns/1ns

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

    // EVALUACION PASS/FAIL
    if (resultado_tb == 32'd17 && ZF_tb == 1'b0) begin
        $display("[0000 ns] TC-01 (SUMA 12+5)   -> PASS | Resultado: %d | ZF: %b", resultado_tb, ZF_tb);
    end else begin
        $display("[0000 ns] TC-01 (SUMA 12+5)   -> FAIL | Esperado: 17, Obt: %d | ZF: %b", resultado_tb, ZF_tb);
    end

    instruccion_tb = 12'b0010_0001_0001; // SUMA: 7 + 14 = 21
    #100;

    if (resultado_tb == 32'd21 && ZF_tb == 1'b0) begin
        $display("[0100 ns] TC-02 (SUMA 7+14)   -> PASS | Resultado: %d | ZF: %b", resultado_tb, ZF_tb);
    end else begin
        $display("[0100 ns] TC-02 (SUMA 7+14)   -> FAIL | Esperado: 21, Obt: %d | ZF: %b", resultado_tb, ZF_tb);
    end

    instruccion_tb = 12'b0010_0010_0010; // SUMA: 25 + 10 = 35
    #100;

    if (resultado_tb == 32'd35 && ZF_tb == 1'b0) begin
        $display("[0200 ns] TC-03 (SUMA 25+10)   -> PASS | Resultado: %d | ZF: %b", resultado_tb, ZF_tb);
    end else begin
        $display("[0200 ns] TC-03 (SUMA 25+10)   -> FAIL | Esperado: 35, Obt: %d | ZF: %b", resultado_tb, ZF_tb);
    end

    instruccion_tb = 12'b0010_0011_0011; // SUMA: 3 + 9 = 12
    #100;

    if (resultado_tb == 32'd12 && ZF_tb == 1'b0) begin
        $display("[0300 ns] TC-04 (SUMA 3+9)   -> PASS | Resultado: %d | ZF: %b", resultado_tb, ZF_tb);
    end else begin
        $display("[0300 ns] TC-04 (SUMA 3+9)   -> FAIL | Esperado: 12, Obt: %d | ZF: %b", resultado_tb, ZF_tb);
    end

    instruccion_tb = 12'b0010_0100_0100; // SUMA: 40 + 20 = 60
    #100;

    if (resultado_tb == 32'd60 && ZF_tb == 1'b0) begin
        $display("[0400 ns] TC-05 (SUMA 40+20)   -> PASS | Resultado: %d | ZF: %b", resultado_tb, ZF_tb);
    end else begin
        $display("[0400 ns] TC-05 (SUMA 40+20)   -> FAIL | Esperado: 60, Obt: %d | ZF: %b", resultado_tb, ZF_tb);
    end

    instruccion_tb = 12'b0010_0101_0101; // SUMA: 18 + 30 = 48
    #100;

    if (resultado_tb == 32'd48 && ZF_tb == 1'b0) begin
        $display("[0500 ns] TC-06 (SUMA 18+30)   -> PASS | Resultado: %d | ZF: %b", resultado_tb, ZF_tb);
    end else begin
        $display("[0500 ns] TC-06 (SUMA 18+30)   -> FAIL | Esperado: 48, Obt: %d | ZF: %b", resultado_tb, ZF_tb);
    end

    // RESTA EN LA DIRECCION 6 - 11 DE ROMA Y DE ROMINA

    instruccion_tb = 12'b0110_0110_0110; // RESTA: 0 - 0 = 0
    #100;

    if (resultado_tb == 32'd0 && ZF_tb == 1'b1) begin
        $display("[0600 ns] TC-01 (RESTA 0-0)   -> PASS | Resultado: %d | ZF: %b", resultado_tb, ZF_tb);
    end else begin
        $display("[0600 ns] TC-01 (RESTA 0-0)   -> FAIL | Esperado: 0, Obt: %d | ZF: %b", resultado_tb, ZF_tb);
    end

    instruccion_tb = 12'b0110_0111_0111; // RESTA: 15 - 6 = 9
    #100;

    if (resultado_tb == 32'd9 && ZF_tb == 1'b0) begin
        $display("[0700 ns] TC-02 (RESTA 15-6)   -> PASS | Resultado: %d | ZF: %b", resultado_tb, ZF_tb);
    end else begin
        $display("[0700 ns] TC-02 (RESTA 15-6)   -> FAIL | Esperado: 9, Obt: %d | ZF: %b", resultado_tb, ZF_tb);
    end

    instruccion_tb = 12'b0110_1000_1000; // RESTA: 63 - 12 = 51
    #100;

    if (resultado_tb == 32'd51 && ZF_tb == 1'b0) begin
        $display("[0800 ns] TC-03 (RESTA 63-12)   -> PASS | Resultado: %d | ZF: %b", resultado_tb, ZF_tb);
    end else begin
        $display("[0800 ns] TC-03 (RESTA 63-12)   -> FAIL | Esperado: 51, Obt: %d | ZF: %b", resultado_tb, ZF_tb);
    end

    instruccion_tb = 12'b0110_1001_1001; // RESTA: 9 - 50 = 4294967255
    #100;

    if (resultado_tb == 32'hFFFFFFD7 && ZF_tb == 1'b0) begin
        $display("[0900 ns] TC-04 (RESTA 9-50)   -> PASS | Resultado: %d (-41)| ZF: %b", resultado_tb, ZF_tb);
    end else begin
        $display("[0900 ns] TC-04 (RESTA 9-50)   -> FAIL | Esperado: 4294967255, Obt: %d | ZF: %b", resultado_tb, ZF_tb);
    end

    instruccion_tb = 12'b0110_1010_1010; // RESTA: 100 - 3 = 97
    #100;

    if (resultado_tb == 32'd97 && ZF_tb == 1'b0) begin
        $display("[1000 ns] TC-05 (RESTA 100-3)   -> PASS | Resultado: %d | ZF: %b", resultado_tb, ZF_tb);
    end else begin
        $display("[1000 ns] TC-05 (RESTA 100-3)   -> FAIL | Esperado: 97, Obt: %d | ZF: %b", resultado_tb, ZF_tb);
    end

    instruccion_tb = 12'b0110_1011_1011; // RESTA: 2 - 2 = 0
    #100;

    if (resultado_tb == 32'd0 && ZF_tb == 1'b1) begin
        $display("[1100 ns] TC-06 (RESTA 2-2)   -> PASS | Resultado: %d | ZF: %b", resultado_tb, ZF_tb);
    end else begin
        $display("[1100 ns] TC-06 (RESTA 2-2)   -> FAIL | Esperado: 0, Obt: %d | ZF: %b", resultado_tb, ZF_tb);
    end

    // STL EN LA DIRECCION 12 - 15 DE ROMA Y DE ROMINA

    instruccion_tb = 12'b0111_1100_1100; // STL: 31 < 31 = 0
    #100;

    if (resultado_tb == 32'd0 && ZF_tb == 1'b1) begin
        $display("[1200 ns] TC-01 (STL 31 < 31)   -> PASS | Resultado: %d | ZF: %b", resultado_tb, ZF_tb);
    end else begin
        $display("[1200 ns] TC-01 (STL 31 < 31)   -> FAIL | Esperado: 0, Obt: %d | ZF: %b", resultado_tb, ZF_tb);
    end

    instruccion_tb = 12'b0111_1101_1101; // STL: 55 < 11 = 0
    #100;

    if (resultado_tb == 32'd0 && ZF_tb == 1'b1) begin
        $display("[1300 ns] TC-01 (STL 55 < 11)   -> PASS | Resultado: %d | ZF: %b", resultado_tb, ZF_tb);
    end else begin
        $display("[1300 ns] TC-01 (STL 55 < 11)   -> FAIL | Esperado: 0, Obt: %d | ZF: %b", resultado_tb, ZF_tb);
    end

    instruccion_tb = 12'b0111_1110_1110; // STL: 8 < 16 = 1
    #100;

    if (resultado_tb == 32'd1 && ZF_tb == 1'b0) begin
        $display("[1400 ns] TC-01 (STL 8 < 16)   -> PASS | Resultado: %d | ZF: %b", resultado_tb, ZF_tb);
    end else begin
        $display("[1400 ns] TC-01 (STL 8 < 16)   -> FAIL | Esperado: 1, Obt: %d | ZF: %b", resultado_tb, ZF_tb);
    end

    instruccion_tb = 12'b0111_1111_1111; // STL: 20 < 4 = 0
    #100;

    if (resultado_tb == 32'd0 && ZF_tb == 1'b1) begin
        $display("[1500 ns] TC-01 (STL 20 < 4)   -> PASS | Resultado: %d | ZF: %b", resultado_tb, ZF_tb);
    end else begin
        $display("[1500 ns] TC-01 (STL 20 < 4)   -> FAIL | Esperado: 0, Obt: %d | ZF: %b", resultado_tb, ZF_tb);
    end

end

endmodule