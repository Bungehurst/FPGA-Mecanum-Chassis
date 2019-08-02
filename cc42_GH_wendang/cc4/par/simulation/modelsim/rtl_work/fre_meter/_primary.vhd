library verilog;
use verilog.vl_types.all;
entity fre_meter is
    generic(
        CLK_FREQ        : integer := 50000000;
        UART_BPS        : integer := 115200
    );
    port(
        sys_clk         : in     vl_logic;
        sys_rst_n       : in     vl_logic;
        clk_fx0a        : in     vl_logic;
        clk_fx0b        : in     vl_logic;
        clk_fx1a        : in     vl_logic;
        clk_fx1b        : in     vl_logic;
        clk_fx2a        : in     vl_logic;
        clk_fx2b        : in     vl_logic;
        clk_fx3a        : in     vl_logic;
        clk_fx3b        : in     vl_logic;
        clk_out         : out    vl_logic;
        clk_sam         : out    vl_logic;
        uart_txd        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLK_FREQ : constant is 1;
    attribute mti_svvh_generic_type of UART_BPS : constant is 1;
end fre_meter;
