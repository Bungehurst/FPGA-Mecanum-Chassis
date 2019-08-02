module dir
(
	input clkin, 				// 基准时钟信号
	input datain_a, 				// 被测时钟信号
	input datain_b, 				// 被测时钟信号
	input rst_n ,     		// 复位信号 
	output reg dir	// 方向

);
always @ (posedge datain_a or negedge rst_n)
begin
	if(!rst_n)
	dir <= 1'b0;
	else
	dir <= datain_b;
end

endmodule