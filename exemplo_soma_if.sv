interface exemplo_soma_if (input clk, rstn);
	logic valid_i;
	logic ready_i;
	logic [7:0] data1_i;
	logic [7:0] data2_i;
	logic valid_o;
	logic ready_o;
	logic [8:0] data_out_o;

	modport DUT (
		input clk, rstn,
		input	 valid_i,
		output	 ready_i,
		input	 data1_i,
		input	 data2_i,
		output	 valid_o,
		input	 ready_o,
		output	 data_out_o);

	modport VERIF (
		input clk, rstn,
		output	 valid_i,
		input	 ready_i,
		output	 data1_i,
		output	 data2_i,
		input	 valid_o,
		output	 ready_o,
		input	 data_out_o);
endinterface : exemplo_soma_if