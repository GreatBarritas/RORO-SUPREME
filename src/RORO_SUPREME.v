module RORO_SUPREME(
    input [3:0]direccion,
    output [31:0]resultado,
    output ZF
);

wire [11:0]c1;

rom_instrucciones papoi(
    .direccion(direccion),
    .instruccion(c1)
);


RORO RorOmegaRor(
    .instruccion(c1),
    .resultado(resultado),
    .ZF(ZF)
);

endmodule