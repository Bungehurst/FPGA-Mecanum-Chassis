`timescale 1ns/1ns

module data(
	input sys_clk  ,        // 鏃堕挓淇″彿
	input clk_send ,  
	input clk_out,
   input sys_rst_n,        // 澶嶄綅淇″彿
	//--------------------
	input dir0, 				// 鍩哄噯鏃堕挓淇″彿
	input dir1, 
   input dir2, 
	input dir3, 
	input [14:0] data_fx0, 	// 琚祴鏃堕挓淇″彿
	input [14:0] data_fx1, 
	input [14:0] data_fx2, 
	input [14:0] data_fx3,
	//--------------------
	input [3:0] tx_cnt,
	output reg uart_en,
	//--------------------
	output reg [7:0] uart_data,
	output reg [5:0] current_state,
	output reg [5:0] next_state
	//--------------------
);
  

  reg [15:0] data0;	// 琚祴鏃堕挓鍛ㄦ湡杈撳嚭
  reg [15:0] data1;
  reg [15:0] data2;
  reg [15:0] data3;

  reg [7:0] data0a;
  reg [7:0] data0b;
  reg [7:0] data1a;
  reg [7:0] data1b;
  reg [7:0] data2a;
  reg [7:0] data2b;
  reg [7:0] data3a;
  reg [7:0] data3b;
  
  reg [7:0] exam;

//--------------------
parameter s00 = 6'd00;
parameter s01 = 6'd01;
parameter s02 = 6'd02;
parameter s03 = 6'd03;
parameter s04 = 6'd04;
parameter s05 = 6'd05;
parameter s06 = 6'd06;
parameter s07 = 6'd07;
parameter s08 = 6'd08;
parameter s09 = 6'd09;
parameter s10 = 6'd10;
parameter s11 = 6'd11;
parameter s12 = 6'd12;
//--------------------
parameter s13 = 6'd13;
parameter s14 = 6'd14;
parameter s15 = 6'd15;
parameter s16 = 6'd16;
parameter s17 = 6'd17;
parameter s18 = 6'd18;
parameter s19 = 6'd19;
parameter s20 = 6'd20;
parameter s21 = 6'd21;
parameter s22 = 6'd22;
parameter s23 = 6'd23;
parameter s24 = 6'd24;
parameter s25 = 6'd25;
//--------------------
parameter s26 = 6'd26;
parameter s27 = 6'd27;
parameter s28 = 6'd28;
parameter s29 = 6'd29;
parameter s30 = 6'd30;
parameter s31 = 6'd31;
parameter s32 = 6'd32;
parameter s33 = 6'd33;
parameter s34 = 6'd34;
parameter s35 = 6'd35;
parameter s36 = 6'd36;
parameter s37 = 6'd37;
parameter s38 = 6'd38;
//--------------------
parameter s39 = 6'd39;
parameter s40 = 6'd40;
parameter s41 = 6'd41;
parameter s42 = 6'd42;
parameter s43 = 6'd43;
parameter s44 = 6'd44;
parameter s45 = 6'd45;
parameter s46 = 6'd46;
parameter s47 = 6'd47;
parameter s48 = 6'd48;
parameter s49 = 6'd49;
parameter s50 = 6'd50;
parameter s51 = 6'd51;
//--------------------




always @ (posedge sys_clk or negedge sys_rst_n)
begin
	if(!sys_rst_n)
		begin
	   data0[15:0] = 16'b0;	
		data1[15:0] = 16'b0;	
		data2[15:0] = 16'b0;	
		data3[15:0] = 16'b0;	
		end
	else
		data0[14:0] = data_fx0;
		data0[15] = dir0;
		data1[14:0] = data_fx1;
		data1[15] = dir1;
		data2[14:0] = data_fx2;
		data2[15] = dir2;
		data3[14:0] = data_fx3;
		data3[15] = dir3;
end

always @ (posedge clk_send or negedge sys_rst_n)
begin
	if(!sys_rst_n)
		begin
			data0a = 8'b0;
			data0b = 8'b0;
			data1a = 8'b0;
			data1b = 8'b0;
			data2a = 8'b0;
			data2b = 8'b0;
			data3a = 8'b0;
			data3b = 8'b0;
			current_state = 6'b0;
			next_state =  6'b0;
			uart_en = 1'b0;
			uart_data = 8'b00000000;
		end
	else
		begin
	   	current_state = next_state;
			case(current_state)
			s00 :begin
					data0a <= data0[15:8];
					data0b <= data0[7:0];
					data1a <= data1[15:8];
					data1b <= data1[7:0];
					data2a <= data2[15:8];
					data2b <= data2[7:0];
					data3a <= data3[15:8];
					data3b <= data3[7:0];
					next_state <= s01;
					end
			s01 :begin
	            exam <= data0b + data1b + data2b + data3b + data0a + data1a + data2a + data3a;
					next_state <= s02;end
					
					
			s02 :begin uart_data <= 8'h5A; uart_en <= 1'b1; next_state <= s03; end
			s03 :begin uart_data <= 8'h5A; uart_en <= 1'b0; next_state <= s04; end
			s04 :begin uart_data <= 8'hA5; uart_en <= 1'b1; next_state <= s05; end
			s05 :begin uart_data <= 8'hA5; uart_en <= 1'b0; next_state <= s06; end
			//-----------------------------------------------------------------
			s06 :begin uart_data <= data0a;uart_en <= 1'b1; next_state <= s07; end
			s07 :begin uart_data <= data0a;uart_en <= 1'b0; next_state <= s08; end
			s08 :begin uart_data <= data0b;uart_en <= 1'b1; next_state <= s09; end
			s09 :begin uart_data <= data0b;uart_en <= 1'b0; next_state <= s10; end
			//-----------------------------------------------------------------
			s10 :begin uart_data <= data1a;uart_en <= 1'b1; next_state <= s11; end
			s11 :begin uart_data <= data1a;uart_en <= 1'b0; next_state <= s12; end
			s12 :begin uart_data <= data1b;uart_en <= 1'b1; next_state <= s13; end		
			s13 :begin uart_data <= data1b;uart_en <= 1'b0; next_state <= s14; end
		   //-----------------------------------------------------------------
			s14 :begin uart_data <= data2a;uart_en <= 1'b1; next_state <= s15; end
			s15 :begin uart_data <= data2a;uart_en <= 1'b0; next_state <= s16; end
			s16 :begin uart_data <= data2b;uart_en <= 1'b1; next_state <= s17; end
			s17 :begin uart_data <= data2b;uart_en <= 1'b0; next_state <= s18; end
			//-----------------------------------------------------------------
			s18 :begin uart_data <= data3a;uart_en <= 1'b1; next_state <= s19; end
			s19 :begin uart_data <= data3a;uart_en <= 1'b0; next_state <= s20; end
			s20 :begin uart_data <= data3b;uart_en <= 1'b1; next_state <= s21; end
			s21 :begin uart_data <= data3b;uart_en <= 1'b0; next_state <= s22; end
			//-----------------------------------------------------------------
			s22 :begin uart_data <= exam;  uart_en <= 1'b1; next_state <= s23; end
			s23 :begin uart_data <= exam;  uart_en <= 1'b0; next_state <= s24; end
			s24 :begin uart_data <= 8'hFF; uart_en <= 1'b1; next_state <= s25; end
			s25 :begin uart_data <= 8'hFF; uart_en <= 1'b0; next_state <= s26; end
			s26 :begin uart_data <= 8'hFE; uart_en <= 1'b1; next_state <= s27; end
			s27 :begin uart_data <= 8'hFE; uart_en <= 1'b0; next_state <= s00; end
						
			default:uart_en = 1'b0;
			endcase
		end
end



endmodule



