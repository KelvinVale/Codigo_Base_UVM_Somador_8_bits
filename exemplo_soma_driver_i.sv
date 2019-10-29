typedef virtual exemplo_soma_if interface_vif;


class exemplo_soma_driver_i extends uvm_driver#(exemplo_soma_transaction_i);
	`uvm_component_param_utils(exemplo_soma_driver_i)
	
	typedef exemplo_soma_transaction_i tr_type;

	interface_vif vif;
	tr_type tr;

	event reset_feito, begin_record, end_record;

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
			get_and_drive(phase);
			record_tr();
		join
	endtask

	virtual task reset_funcion();
        forever begin
        	@(negedge vif.rstn);
			vif.valid_i		= '0;
			vif.data1_i		= '0;
			vif.data2_i		= '0;
			@(posedge vif.rstn);
			-> reset_feito;
        end
    endtask : reset_funcion

	virtual task get_and_drive(uvm_phase phase);
		@(reset_feito);
        forever begin
            seq_item_port.try_next_item(tr);
            -> begin_record;
            drive_transfer();
        end
    endtask : get_and_drive

	virtual task drive_transfer();
		vif.valid_i		<= 1'b1;
		wait (vif.ready_i == 1'b1);
			vif.data1_i		<= tr.data1_i;
			vif.data2_i		<= tr.data2_i;
			@(negedge vif.ready_i);
		-> end_record;
		seq_item_port.item_done();
	endtask : drive_transfer

	virtual task record_tr();
        forever begin
            @(begin_record);
            begin_tr(tr, "exemplo_soma_driver");
            @(end_record);
            end_tr(tr);
        end
    endtask
endclass