module parity_calc (
    input  wire       CLK,
    input  wire       RST,
    input  wire       Data_Valid,
    input  wire       PAR_TYP,
    input  wire [7:0] P_DATA,
    output reg        par_bit
);
    always @(posedge CLK or negedge RST) begin
        if (~RST) begin
            par_bit <= 1'b0;
        end
        else begin
            if (Data_Valid) begin
                if (~PAR_TYP) begin
                    par_bit <= ^P_DATA;
                end
                else begin
                    par_bit <= ~^P_DATA;
                end
            end
        end
    end
endmodule
