module Somador_8_bits (
	clk,
	rstn,
	valid_i,
	ready_i,
	data1_i,
	data2_i,
	valid_o,
	ready_o,
	data_out_o
);
input clk;
input rstn;
input logic		 valid_i;
output logic	 ready_i;
input logic		 [7:0] data1_i;
input logic		 [7:0] data2_i;

output logic	 valid_o;
input logic		 ready_o;
output logic	 [8:0] data_out_o;

logic [7:0]	data1;
logic [7:0]	data2;

always_ff @(posedge clk)
begin
	if(~rstn)
	begin
		ready_i <= '1;
		valid_o <= '0;
		data1 <= '0;
		data2 <= '0;
	end
	else
	begin
		if(ready_i && valid_i)
		begin
			data1 <= data1_i;
			data2 <= data2_i;
			ready_i <= '0;
			valid_o <= '1;
		end
		if(valid_o && ready_o)
		begin
			valid_o <= '0;
			ready_i <= '1;
		end
	end
end

always_comb begin
data_out_o = data1 + data2;
end

endmodule