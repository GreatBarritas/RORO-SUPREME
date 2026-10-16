`timescale 100ns/100ns

module RORO_SUPREME_tb();

reg [3:0]direccion_tb;
wire [31:0]resultado_tb;
wire ZF_tb;

RORO_SUPREME DUV (
    .direccion(direccion_tb),
    .resultado(resultado_tb),
    .ZF(ZF_tb)
);

initial
begin
    // Recorremos todas las instrucciones de la ROM de instrucciones (0 - 15)

    for (integer i = 0; i < 16; i = i + 1) begin
        // Asignamos la dirección actual a la entrada del módulo
        direccion_tb = i[3:0];
        #100; // Esperamos 100 unidades de tiempo entre cada instrucción
    end

    $finish;
end


endmodule