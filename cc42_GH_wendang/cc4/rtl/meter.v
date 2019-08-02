module meter
(
	input clkin, 				// 基准时钟信号
	input datain, 				// 被测时钟信号
	input rst_n ,     		// 复位信号 
 	
	output reg [14:0]	fx	// 被测时钟频率输出
);
reg [35:0] cnt;   // 被测时钟周期输出
reg [1:0] datatmp = 0;
reg [35:0] cnttmp = 0;            
reg flag = 1'b0;

//拼接符号检测上升沿
always @ (posedge clkin or negedge rst_n)
begin
	if(!rst_n)	datatmp = 2'b0;
	else datatmp = {datain,datatmp[1]};  //捕获沿的方法
end

always @ (posedge clkin or negedge rst_n)
begin
  if(!rst_n)	cnt = 36'b0; 
  //else if(cnttmp > 36'd100000) cnt = 36'b0;
  else if(datatmp == 2'b10) //上升沿
  begin
    cnt = cnttmp + 1'b1;
    cnttmp = 36'b0;
  end
  else
	 cnttmp = cnttmp + 1'b1;  
end

always @ (posedge clkin or negedge rst_n)
begin
 if(!rst_n)	fx = 15'b0; 
 else if ( 36'd5000 < cnt && cnt < 36'd100000 && cnttmp < 36'd100000)
	   fx <= 36'd1_0000_0000 / cnt;   //100 ~ 2000
 else
		fx <= 0;
end
endmodule 

