library verilog;
use verilog.vl_types.all;
entity clk_div is
    generic(
        DIV_N           : vl_notype
    );
    port(
        clk_in          : in     vl_logic;
        rst_n           : in     vl_logic;
        clk_out         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DIV_N : constant is 5;
end clk_div;
