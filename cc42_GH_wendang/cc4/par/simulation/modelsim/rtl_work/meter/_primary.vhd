library verilog;
use verilog.vl_types.all;
entity meter is
    port(
        clkin           : in     vl_logic;
        datain          : in     vl_logic;
        rst_n           : in     vl_logic;
        fx              : out    vl_logic_vector(14 downto 0)
    );
end meter;
