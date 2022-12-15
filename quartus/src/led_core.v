module ledCore #(
    parameter INPUT_WIDTH = 16,
    parameter MAX_NUMBER = 255
)
(
    input enable,
    input clk,
    input [INPUT_WIDTH-1:0] num_in,
    output [7:0] led_out
);

reg [7:0] led = 8'd0;
assign led_out = led;

always @(posedge clk) begin
    
    if (enable == 0) led <= 0;
    
    else begin
        if (num_in > MAX_NUMBER) led <= 0;
        else led <= num_in;
    end
end

    
endmodule