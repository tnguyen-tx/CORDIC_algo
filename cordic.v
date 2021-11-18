`timescale 1ns / 1ps

module cordic(
clk,
rst,
mode,
load,
x0,
y0,
z0,
x,
y,
z
    );

input clk,rst;
input mode,load;
input[15:0] x0,y0,z0;

output reg signed[15:0] x,y,z;

wire d;
reg [3:0] k;
wire [15:0] atan[0:14];

//tan array
assign	atan[0] = 6434; 		//tan-1(0)
assign	atan[1] = 3798; 		//tan-1(1/2)
assign	atan[2] = 2006;
assign	atan[3] = 1018;
assign	atan[4] = 511;
assign	atan[5] = 255;
assign	atan[6] = 127;
assign	atan[7] = 64;
assign	atan[8] = 32;
assign	atan[9] = 16;
assign	atan[10] = 8;
assign	atan[11] = 4;
assign	atan[12] = 2;
assign	atan[13] = 1;
assign	atan[14] = 0;

//Comb logic
assign d = mode? (~y[15]) : (z[15]);

//your code here=============
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			x <= 0;
			y <= 0;
			z <= 0;
			k <= 0;
		end
		else begin
			if (load == 1'b1) begin
				x <= x0;
				y <= y0;
				z <= z0;
				k <= 0;
			end
			else begin
				if (k < 15) begin 
					case (d) 
						1'b0: begin
							x <= x - (y>>>k);
							y <= y + (x>>>k);
							z <= z - (atan[k]);
						end
						1'b1: begin
							x <= x + (y>>>k);
							y <= y - (x>>>k);
							z <= z + (atan[k]);
						end
					endcase
					k <= k + 1;
				end	
				else begin
					k <= k;
					x <= x;
					y <= y;
					z <= z;
				end
			end
		end
		end
endmodule
