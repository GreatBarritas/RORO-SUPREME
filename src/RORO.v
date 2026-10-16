module RORO(
	input [11:0]instruccion,
	output [31:0]resultado,
	output ZF
);

wire [31:0]c1,c2;

ROM #(
	FILENAME = "Datos de ROMa.txt"
)Roma(
	.DirL(instruccion[7:4]),
	.Data(c1)
	);

ROM #(
	FILENAME = "Datos de ROMina.txt"
) Romina(
	.DirL(instruccion[3:0]),
	.Data(c2)
	);

MIPSALU Pablo(
	.ALUctl(instruccion[11:8]),
	.A(c1),
	.B(c2),
	.ALUOut(resultado),
	.Zero(ZF)
);



endmodule
