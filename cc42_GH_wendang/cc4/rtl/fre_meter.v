module fre_meter(
    input                  sys_clk  ,    // 时钟信号
    input                  sys_rst_n,    // 复位信号
    input                  clk_fx0a   ,    // 被测时钟
    input                  clk_fx0b   ,    // 被测时钟
	 input                  clk_fx1a   ,    // 被测时钟
    input                  clk_fx1b   ,    // 被测时钟
	 input                  clk_fx2a   ,    // 被测时钟
    input                  clk_fx2b   ,    // 被测时钟
	 input                  clk_fx3a   ,    // 被测时钟
    input                  clk_fx3b   ,    // 被测时钟
	 output                 uart_txd   
);

    wire				clk_data   ;
	 wire          clk_send   ;

    wire [7:0]    uart_data_w;
    wire          uart_en_w  ;
    wire [3:0]    tx_cnt_w   ;
    wire          tx_flag_w  ;

    wire [5:0]    current_state;
	 wire [5:0]    next_state;

	 wire [15:0]   clk_cnt    ;
    wire          en_flag_w  ;

    wire [14:0]	data_fx0   ;
    wire [14:0]	data_fx1   ; 
    wire [14:0]	data_fx2   ; 
    wire [14:0]	data_fx3   ; 	 

    wire          dir0       ;
    wire          dir1       ;
    wire          dir2       ;
    wire          dir3       ;
	 
    wire [15:0]   data0      ;
    wire [15:0]   data1      ;
    wire [15:0]   data2      ;
    wire [15:0]   data3      ;
	 
    wire [7:0]         data0a;
    wire [7:0]         data0b;
    wire [7:0]         data1a;
    wire [7:0]         data1b;
    wire [7:0]         data2a;
    wire [7:0]         data2b;
    wire [7:0]         data3a;
    wire [7:0]         data3b;

parameter  CLK_FREQ = 50000000;       //定义系统时钟频率
parameter  UART_BPS = 115200;         //定义串口波特率
//wire define
//wire    [19:0]       data_fx;            // 被测信号测量值
//*****************************************************
//**                    main code
//*****************************************************
//例化测试时钟模块，产生测试时钟
clk_div #(.DIV_N(6'd50)                 // 分频系数
) u_clk_div_data(
    .clk_in      (sys_clk  ),            // 输入时钟
    .rst_n       (sys_rst_n),            // 复位信号
	 .clk_out    (clk_data)
);

clk_div #(.DIV_N(20'd5000)                 // 分频系数
) u_clk_div_sam(
    .clk_in      (sys_clk  ),            // 输入时钟
    .rst_n       (sys_rst_n),            // 复位信号
	 .clk_out    (clk_send)
);

meter u_meter0(
    .clkin       (clk_data),            // 基准时钟信号
	 .datain      (clk_fx0a),           // 被测时钟信号
    .rst_n       (sys_rst_n),          // 复位信号
	 .fx          (data_fx0) 			   // 被测时钟频率输出
);
dir u_dir0(
    .clkin       (clk_data),            // 基准时钟信号
	 .datain_a    (clk_fx0a),           // 被测时钟信号
	 .datain_b    (clk_fx0b),           // 被测时钟信号
    .rst_n       (sys_rst_n),          // 复位信号
	 .dir         (dir0)
);
meter u_meter1(
    .clkin       (clk_data),            // 基准时钟信号
	 .datain      (clk_fx1a),           // 被测时钟信号
    .rst_n       (sys_rst_n),          // 复位信号
	 .fx          (data_fx1)			   // 被测时钟频率输出
);
dir u_dir1(
    .clkin       (clk_data),            // 基准时钟信号
	 .datain_a    (clk_fx1a),           // 被测时钟信号
	 .datain_b    (clk_fx1b),           // 被测时钟信号
    .rst_n       (sys_rst_n),          // 复位信号
	 .dir         (dir1)
);
meter u_meter2(
    .clkin       (clk_data),            // 基准时钟信号
	 .datain      (clk_fx2a),           // 被测时钟信号
    .rst_n       (sys_rst_n),          // 复位信号
	 .fx          (data_fx2)			   // 被测时钟频率输出
);
dir u_dir2(
    .clkin       (clk_data),            // 基准时钟信号
	 .datain_a    (clk_fx2a),           // 被测时钟信号
	 .datain_b    (clk_fx2b),           // 被测时钟信号
    .rst_n       (sys_rst_n),          // 复位信号
	 .dir         (dir2)
);
meter u_meter3(
    .clkin       (clk_data),            // 基准时钟信号
	 .datain      (clk_fx3a),           // 被测时钟信号
    .rst_n       (sys_rst_n),          // 复位信号
	 .fx          (data_fx3) 			   // 被测时钟频率输出
);
dir u_dir3(
    .clkin       (clk_data),            // 基准时钟信号
	 .datain_a    (clk_fx3a),           // 被测时钟信号
	 .datain_b    (clk_fx3b),           // 被测时钟信号
    .rst_n       (sys_rst_n),          // 复位信号
	 .dir         (dir3)
);




data u_data0(
	 .sys_rst_n   (sys_rst_n),            // 复位信号
	 .sys_clk     (sys_clk),	
	 .dir0        (dir0),
	 .dir1        (dir1),
	 .dir2        (dir2),
	 .dir3        (dir3),
	 .data_fx0    (data_fx0),
	 .data_fx1    (data_fx1),
	 .data_fx2    (data_fx2),
	 .data_fx3    (data_fx3),
	 .uart_en     (uart_en_w),
	 .clk_send     (clk_send),
	 .tx_cnt      ( tx_cnt_w),
	 .current_state       (current_state),
	 .next_state  (next_state),
	 .clk_out     (clk_out),
	 .uart_data   (uart_data_w)
);



uart_send #(                          //串口发送模块Error (10200): Verilog HDL Conditional Statement error at uart_send.v(46): cannot match operand(s) in the condition to the corresponding edges in the enclosing event control of the always construct

    .CLK_FREQ       (CLK_FREQ),       //设置系统时钟频率
    .UART_BPS       (UART_BPS))       //设置串口发送波特率
u_uart_send(                 
    .sys_clk        (sys_clk),
    .sys_rst_n      (sys_rst_n),
    .en_flag        (en_flag_w),
    .uart_en        (uart_en_w),
    .uart_din       (uart_data_w),
	 .tx_flag        (tx_flag_w),
    .uart_txd       (uart_txd),
	 .tx_cnt         (tx_cnt_w),
	 .clk_cnt        (clk_cnt),
	 .clk_send       (clk_send)
);


endmodule