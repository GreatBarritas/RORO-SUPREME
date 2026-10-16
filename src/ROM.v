// 1. Declaracion del modulo (I/O)
module ROM #(
	parameter FILENAME = "turipipip.txt" // IMPORTANTE: Cambiar el nombre del archivo de texto para cada ROM
)(
	input [3:0]DirL,
	output [31:0]Data
);

//componente interno Memoria

reg [31:0] srom [0:15];


assign Data=srom[DirL];

initial 
begin
      $readmemb(FILENAME, srom);
end

endmodule