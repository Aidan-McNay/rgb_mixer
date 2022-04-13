`default_nettype none
`timescale 1ns/1ns
module debounce (
    input wire clk,
    input wire reset,
    input wire button,
    output reg debounced
);
    
    reg [7:0] sreg;

    always @(posedge clk) begin
        if (reset) begin
            sreg <= 8'b00000000;
        end else begin
            sreg <= {sreg[6:0],button};
        end
    end

    always @(posedge clk) begin
        if (reset) begin
            debounced <= 1'b0;
        end else if (sreg==8'b11111111) begin
            debounced <= 1'b1;
        end else if (sreg==8'b00000000) begin
            debounced <= 1'b0;
        end

    end

endmodule
