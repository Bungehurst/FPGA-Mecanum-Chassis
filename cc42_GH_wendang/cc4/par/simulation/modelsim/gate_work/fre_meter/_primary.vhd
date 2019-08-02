library verilog;
use verilog.vl_types.all;
entity fre_meter is
    port(
        sys_clk         : in     vl_logic;
        sys_rst_n       : in     vl_logic;
        clk_fx0a        : in     vl_logic;
        clk_fx0b        : in     vl_logic;
        data_fx0        : out    vl_logic_vector(14 downto 0);
        data_cnt0       : out    vl_logic_vector(35 downto 0);
        dir0            : out    vl_logic;
        clk_out         : out    vl_logic;
        clk_sam         : out    vl_logic;
        clk_send        : out    vl_logic;
        uart_txd        : out    vl_logic;
        data0           : out    vl_logic_vector(15 downto 0);
        uart_data_w     : out    vl_logic_vector(7 downto 0);
        uart_en_w       : out    vl_logic;
        tx_cnt_w        : out    vl_logic_vector(3 downto 0);
        tx_flag_w       : out    vl_logic;
        state           : out    vl_logic_vector(5 downto 0);
        en_flag_w       : out    vl_logic
    );
end fre_meter;
