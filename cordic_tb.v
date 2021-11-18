`timescale 1ns / 1ps
`include "cordic.v"
module cordic_tb(

    );

reg clk;
reg rst;
reg mode;
reg load;
reg [15:0] x0;
reg [15:0] y0;
reg [15:0] z0;
wire [15:0] x;
wire [15:0] y;
wire [15:0] z;

//your code here=============
//Instantiate
cordic top(.clk(clk), .rst(rst), .mode(mode), .load(load), .x0(x0), .y0(y0), .z0(z0), .x(x), .y(y), .z(z));
//your code here=============
always begin
	#1	clk = ~clk;
end

initial begin
	clk = 0;
	rst = 0;
	mode = 0;
	load = 0;
	x0 = 0;
	y0 = 0;
	z0 = 0;

//reset
#5 rst = 1;

//calculate sin and cos of angle z0
x0 = 4974;	//x0 = 1/G = 0.607252935, mandatory value
y0 = 0;		//y0 = 0, mandatory
z0 = 8578; 	//z0 = pi/3, target angle
#6 rst = 0;
load = 1;
#10 load = 0;
//sin and cos of pi/6
#100
z0 = 4289; //  pi/6 
load = 1;
#6 load =0;

//calculate tan-1 of y0
//#10 load = 1;
#100
mode = 1;
x0 = 8192;	//default value x=1
y0 = 8192; 	//y0 = 1, target
z0 = 0; 	//z0 = 0, default value
load = 1;

#10 
load = 0;

//tan-1(0.57735) = 0.52359878
#100
x0 = 4974;
y0 = 2872;
#5 load = 1;
#10 load =0;

#100
$finish;
end

initial begin
$dumpfile("waveforms.vcs");
$dumpvars;
end

endmodule
