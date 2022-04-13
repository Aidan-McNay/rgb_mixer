`default_nettype none
`timescale 1ns/1ns
module encoder (
    input clk,
    input reset,
    input a,
    input b,
    output reg [7:0] value
);

    reg old_a;
    reg old_b;
    reg [3:0] inputs;

    always @(posedge clk) begin
        old_a <= a;
        old_b <= b;
        if (reset) begin
            value <= 8'b0;
        end else begin
            inputs <= {a,old_a,b,old_b};
            case (inputs)
                4'b1000: value <= value + 1;
                4'b0111: value <= value + 1;
                4'b0010: value <= value - 1;
                4'b1101: value <= value - 1;
                default: value <= value;
            endcase
        end
    end

endmodule
