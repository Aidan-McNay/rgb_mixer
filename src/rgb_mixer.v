`default_nettype none
`timescale 1ns/1ns
module rgb_mixer (
    input clk,
    input reset,
    input enc0_a,
    input enc0_b,
    input enc1_a,
    input enc1_b,
    input enc2_a,
    input enc2_b,
    output pwm0_out,
    output pwm1_out,
    output pwm2_out
);

    wire       debounced0_a;
    wire       debounced0_b;
    wire       debounced1_a;
    wire       debounced1_b;
    wire       debounced2_a;
    wire       debounced2_b;
    wire [7:0] enc0;
    wire [7:0] enc1;
    wire [7:0] enc2;

    
    // Channel 1
    debounce debouncer_1_a
    (
        .clk       (clk),
        .reset     (reset),
        .button    (enc0_a),
        .debounced (debounced0_a)
    );

    debounce debouncer_1_b
    (
        .clk       (clk),
        .reset     (reset),
        .button    (enc0_b),
        .debounced (debounced0_b)
    );

    encoder encoder_1
    (
        .clk   (clk),
        .reset (reset),
        .a     (debounced0_a),
        .b     (debounced0_b),
        .value (enc0)
    );

    pwm pwm_1
    (
        .clk   (clk),
        .reset (reset),
        .out   (pwm0_out),
        .level (enc0)
    );

    // Channel 2

    debounce debouncer_2_a
    (
        .clk       (clk),
        .reset     (reset),
        .button    (enc1_a),
        .debounced (debounced1_a)
    );

    debounce debouncer_2_b
    (
        .clk       (clk),
        .reset     (reset),
        .button    (enc1_b),
        .debounced (debounced1_b)
    );

    encoder encoder_2
    (
        .clk   (clk),
        .reset (reset),
        .a     (debounced1_a),
        .b     (debounced1_b),
        .value (enc1)
    );

    pwm pwm_2
    (
        .clk   (clk),
        .reset (reset),
        .out   (pwm1_out),
        .level (enc1)
    );

    // Channel 3

    debounce debouncer_3_a
    (
        .clk       (clk),
        .reset     (reset),
        .button    (enc2_a),
        .debounced (debounced2_a)
    );

    debounce debouncer_3_b
    (
        .clk       (clk),
        .reset     (reset),
        .button    (enc2_b),
        .debounced (debounced2_b)
    );

    encoder encoder_3
    (
        .clk   (clk),
        .reset (reset),
        .a     (debounced2_a),
        .b     (debounced2_b),
        .value (enc2)
    );

    pwm pwm_3
    (
        .clk   (clk),
        .reset (reset),
        .out   (pwm2_out),
        .level (enc2)
    );

    

endmodule
