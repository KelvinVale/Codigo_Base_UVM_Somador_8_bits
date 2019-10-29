//import uvm_pkg::*;//NUNCA MUDE
//`include "uvm_macros.svh"//NUNCA MUDE e nessa ordem !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//import exemplo_soma_pkg::*;

module exemplo_top;
	import uvm_pkg::*;
	import exemplo_soma_pkg::*;
	parameter freq_clk = 50000000;
	parameter baud_rate = 115200;
	parameter min_trans = 100;
	
	logic clk, rst;
	exemplo_soma_if dut_if (.clk(clk), .rstn(rst));

	Somador_8_bits dut
	(
		.clk(dut_if.clk),
		.rstn(dut_if.rstn),
		.valid_i(dut_if.valid_i),
		.ready_i(dut_if.ready_i),
		.data1_i(dut_if.data1_i),
		.data2_i(dut_if.data2_i),
		.valid_o(dut_if.valid_o),
		.ready_o(dut_if.ready_o),
		.data_out_o(dut_if.data_out_o)
	);

  	initial begin
  		clk = 0;
  		rst = 1;
  		#10 rst = 0;
  		#10 rst = 1;
  	end

  	always #3 clk = ~clk;

	initial begin
		`ifdef XCELIUM
			$recordvars();
		`endif
		`ifdef VCS
			$vcdpluson;
		`endif
		`ifdef QUESTA
			$wlfdumpvars();
			set_config_int("*", "recording_detail", 1);
		`endif

		uvm_config_db#(interface_vif)::set(uvm_root::get(), "*", "vif", dut_if);
		uvm_config_db#(int)::set(uvm_root::get(), "*", "min_trans", min_trans);

		run_test("exemplo_soma_test");
	end

endmodule

