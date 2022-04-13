`default_nettype none
`timescale 1ns/1ns
module pwm (
    input wire clk,
    input wire reset,
    output wire out,
    input wire [7:0] level
    );

    reg [7:0] counter;

    always @(posedge clk) begin
        if (reset) begin
            counter <= 8'b00000000;
        end 
        else begin
            counter <= counter + 1;
        end
    end

    wire less_than_level;
    assign less_than_level = (counter<level) ? 1'b1 : 1'b0;
    
    assign out = (reset) ? less_than_level : 1'b0;

endmodule
