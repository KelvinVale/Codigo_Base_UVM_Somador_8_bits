//typedef virtual exemplo_soma_if.mst interface_vif;

class exemplo_soma_driver_o extends uvm_driver#(exemplo_soma_transaction_o);
	`uvm_component_param_utils(exemplo_soma_driver_o)
	
	typedef exemplo_soma_transaction_o tr_type;

	interface_vif vif;

	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(interface_vif)::get(this, "", "vif", vif)) begin
			`uvm_fatal("NOVIF", "failed to get virtual interface")
		end
	endfunction

	function void connect_phase (uvm_phase phase);
		super.connect_phase(phase);
	endfunction

	task run_phase (uvm_phase phase);
		super.run_phase (phase);
		fork
			reset_funcion();
		join
	endtask

	virtual task reset_funcion();
        forever begin
        	@(negedge vif.rstn);
			vif.ready_o		<= 1'b0;
			@(posedge vif.rstn);
			vif.ready_o		<= 1'b1;

        end
    endtask : reset_funcion

endclass