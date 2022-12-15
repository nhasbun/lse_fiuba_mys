// Led core tb module
`timescale 1ns/1ns


module ledCoreTb;

localparam INPUT_WIDTH = 32;

reg enable = 0;
reg clk = 0;
reg [INPUT_WIDTH-1:0] num = {INPUT_WIDTH{1'bz}};

wire [7:0] led_out;

ledCore #(.INPUT_WIDTH(INPUT_WIDTH)) ledCore1(
    .enable(enable),
    .clk(clk),
    .num_in(num),
    .led_out(led_out)
);


initial begin

    $dumpfile("led_core_tb.vcd");
    $dumpvars(); 

    #10;
    enable = 0;
    clk = ~clk;
    #10; clk = ~clk; #10;

    enable = 1;
    num = 1;
    clk = ~clk;
    #10; clk = ~clk; #10;

    enable = 1;
    num = 200;
    clk = ~clk;
    #10; clk = ~clk; #10;

    enable = 1;
    num = 300;
    clk = ~clk;
    #10; clk = ~clk; #10;

    enable = 1;
    num = 1;
    clk = ~clk;
    #10; clk = ~clk; #10;

    enable = 0;
    clk = ~clk;
    #10; clk = ~clk; #10;

end

    
endmodule
