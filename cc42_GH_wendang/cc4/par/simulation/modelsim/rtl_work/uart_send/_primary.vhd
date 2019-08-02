library verilog;
use verilog.vl_types.all;
entity uart_send is
    generic(
        CLK_FREQ        : integer := 50000000;
        UART_BPS        : integer := 115200
    );
    port(
        sys_clk         : in     vl_logic;
        clk_send        : in     vl_logic;
        sys_rst_n       : in     vl_logic;
        uart_en         : in     vl_logic;
        uart_din        : in     vl_logic_vector(7 downto 0);
        tx_cnt          : out    vl_logic_vector(3 downto 0);
        tx_flag         : out    vl_logic;
        clk_cnt         : out    vl_logic_vector(15 downto 0);
        uart_txd        : out    vl_logic;
        en_flag         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLK_FREQ : constant is 1;
    attribute mti_svvh_generic_type of UART_BPS : constant is 1;
end uart_send;
