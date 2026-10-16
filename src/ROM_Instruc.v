module rom_instrucciones (
    input wire [3:0] direccion,   
    output reg [11:0] instruccion 
);

    
    reg [11:0] mem [15:0];

    initial begin
        
        $readmemb("instruc.txt", mem);
    end

    always @(*) begin
        instruccion = mem[direccion];
    end

endmodule