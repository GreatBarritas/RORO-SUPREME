`timescale 1ns/1ns

module RORO_SUPREME_tb();

reg [3:0]direccion_tb;
wire [31:0]resultado_tb;
wire ZF_tb;

RORO_SUPREME DUV (
    .direccion(direccion_tb),
    .resultado(resultado_tb),
    .ZF(ZF_tb)
);

integer i;

// Arreglos con los valores esperados para las 16 direcciones
reg [31:0] esperados [0:15];
reg zf_esperados [0:15];

initial
begin


    // SUMAS (0 a 5)
    esperados[0]  = 32'd17;          zf_esperados[0]  = 1'b0; // 12 + 5
    esperados[1]  = 32'd21;          zf_esperados[1]  = 1'b0; // 7 + 14
    esperados[2]  = 32'd35;          zf_esperados[2]  = 1'b0; // 25 + 10
    esperados[3]  = 32'd12;          zf_esperados[3]  = 1'b0; // 3 + 9
    esperados[4]  = 32'd60;          zf_esperados[4]  = 1'b0; // 40 + 20
    esperados[5]  = 32'd48;          zf_esperados[5]  = 1'b0; // 18 + 30

    // RESTAS (6 a 11)
    esperados[6]  = 32'd0;           zf_esperados[6]  = 1'b1; // 0 - 0 = 0 (ZF = 1)
    esperados[7]  = 32'd9;           zf_esperados[7]  = 1'b0; // 15 - 6
    esperados[8]  = 32'd51;          zf_esperados[8]  = 1'b0; // 63 - 12
    esperados[9]  = 32'hFFFFFFD7;    zf_esperados[9]  = 1'b0; // 9 - 50 = -41 (4294967255)
    esperados[10] = 32'd97;          zf_esperados[10] = 1'b0; // 100 - 3
    esperados[11] = 32'd0;           zf_esperados[11] = 1'b1; // 2 - 2 = 0 (ZF = 1)

    // STL (12 a 15)
    esperados[12] = 32'd0;           zf_esperados[12] = 1'b1; // 31 < 31 -> False (ZF = 1)
    esperados[13] = 32'd0;           zf_esperados[13] = 1'b1; // 55 < 11 -> False (ZF = 1)
    esperados[14] = 32'd1;           zf_esperados[14] = 1'b0; // 8 < 16 -> True (ZF = 0)
    esperados[15] = 32'd0;           zf_esperados[15] = 1'b1; // 20 < 4 -> False (ZF = 1)


    // Recorremos todas las instrucciones de la ROM de instrucciones (0 - 15)

    for (i = 0; i < 16; i = i + 1) begin
        // Asignamos la dirección actual a la entrada del módulo
        direccion_tb = i[3:0];
        #100; // Esperamos 100 unidades de tiempo entre cada instrucción

        // Evaluación automática PASS / FAIL
        if (resultado_tb == esperados[i] && ZF_tb == zf_esperados[i]) begin
            $display("[%04d ns] Dir: %02d | -> PASS | Resultado: %d | ZF: %b", 
                     $time, i, $signed(resultado_tb), ZF_tb);
        end else begin
            $display("[%04d ns] Dir: %02d | -> FAIL | Obtenido: %d (ZF:%b) | Esperado: %d (ZF:%b)", 
                     $time, i, $signed(resultado_tb), ZF_tb, $signed(esperados[i]), zf_esperados[i]);
        end
    end

    $finish;
end


endmodule