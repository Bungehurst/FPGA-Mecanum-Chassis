library verilog;
use verilog.vl_types.all;
entity dir is
    port(
        clkin           : in     vl_logic;
        datain_a        : in     vl_logic;
        datain_b        : in     vl_logic;
        rst_n           : in     vl_logic;
        dir             : out    vl_logic
    );
end dir;
