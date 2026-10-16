// 1. Declaracion del modulo (I/O)
module ROM (
	input [3:0]DirL,
	output [31:0]Data
);

//componente interno Memoria

reg [11:0] srom [0:15];


assign Data=srom[DirL];

initial 
begin
      $readmemb("Datos de ROMa.txt", srom);
end

endmodule