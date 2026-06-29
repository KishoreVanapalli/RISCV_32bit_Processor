module alu(
    input [31:0] a,
    input [31:0] b,
    input [1:0] alu_op,
    input [2:0] funct3,
    input [6:0] funct7,
    output reg [31:0] result,
    output zero
);

always @(*)
begin
    case(alu_op)

        2'b00:
            result = a + b;

        2'b01:
            result = a - b;

        2'b10:
        begin
            case(funct3)

                3'b000:
                begin
                    if(funct7 == 7'b0100000)
                        result = a - b;
                    else
                        result = a + b;
                end

                3'b111:
                    result = a & b;

                3'b110:
                    result = a | b;

                3'b100:
                    result = a ^ b;

                default:
                    result = 0;
            endcase
        end

        default:
            result = 0;

    endcase
end

assign zero = (result == 0);

endmodule