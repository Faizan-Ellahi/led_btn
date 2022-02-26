module led_btn(
    input clk24,
    input reset,
    input btn_i,
    output led_o
);

wire clk;
Gowin_PLL clock100(
    .clkout(clk), //output clkout
    .clkin(clk24) //input clkin
);

one_sec #(.VALUE(100000000)) led_one_sec (
		.clk(clk), 
		.rstn(reset), 
    	.enable(btn_i), 
        .out(led_o)
	);

endmodule