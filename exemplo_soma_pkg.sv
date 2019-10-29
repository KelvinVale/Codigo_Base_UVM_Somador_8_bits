package exemplo_soma_pkg;
	`include "uvm_macros.svh"
	import uvm_pkg::*;

`include "./exemplo_soma_transaction_i.sv"
`include "./exemplo_soma_transaction_o.sv"
`include "./exemplo_soma_sequence_i.sv"

`include "./exemplo_soma_driver_i.sv"
`include "./exemplo_soma_driver_o.sv"
`include "./exemplo_soma_monitor_i.sv"
`include "./exemplo_soma_monitor_o.sv"
`include "./exemplo_soma_agent_i.sv"
`include "./exemplo_soma_agent_o.sv"

`include "./exemplo_soma_refmod.sv"
`include "./exemplo_soma_cover.sv"
`include "./exemplo_soma_scoreboard.sv"
`include "./exemplo_soma_env.sv"
`include "./exemplo_soma_test.sv" //SE LIGUE SA SEQUÊNCIA QUE SÃO COLOCADOS !!!!!!!!! 
								  //SE ALGUEM CHAMA ALGO, ESSE ALGO DEVE ESTAR ACIMA DESSE ALGUEM !!!!!!

endpackage : exemplo_soma_pkg