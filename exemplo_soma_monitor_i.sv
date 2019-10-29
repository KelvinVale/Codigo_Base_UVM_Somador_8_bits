class exemplo_soma_monitor_i extends uvm_monitor;
	
	interface_vif vif;
	exemplo_soma_transaction_i tr;
	
	event begin_record, end_record;
	
	uvm_analysis_port #(exemplo_soma_transaction_i) mon_exemplo_soma_i_tr_analysis_port; 
										// NomeDoModulo_NomeDaTransacao_tr_NomeDaPorta

	`uvm_component_utils(exemplo_soma_monitor_i)

	function new(string name, uvm_component parent);
        super.new(name, parent);
        mon_exemplo_soma_i_tr_analysis_port = new("mon_exemplo_soma_i_tr_analysis_port", this);
    endfunction

    virtual function void build_phase (uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(interface_vif)::get(this, "", "vif", vif)) begin
			`uvm_fatal("NO_VIF", "exemplo_soma_monitor_i: falha no get da interface_vif")
		end

		tr = exemplo_soma_transaction_i::type_id::create("tr",this);	
	endfunction : build_phase

	virtual task run_phase(uvm_phase phase);
		super.run_phase (phase);
		fork
			monitoramento();
			record_tr();
		join
	endtask : run_phase

	virtual task monitoramento();
		forever
		begin
			@(posedge vif.clk iff((vif.valid_i == 1'b1) && (vif.ready_i == 1'b1)));
			-> begin_record;
			tr.data1_i = vif.data1_i;
			tr.data2_i = vif.data2_i;
			->end_record;
			mon_exemplo_soma_i_tr_analysis_port.write(tr);
		end
	endtask : monitoramento

	virtual task record_tr();
		forever 
		begin 	
			@begin_record;
			begin_tr(tr, "exemplo_soma_monitor_i: tr");
			@end_record;
			end_tr(tr);
		end
	endtask : record_tr
	
endclass : exemplo_soma_monitor_i

//vif.valid_i
//vif.ready_i
//vif.data1_i
//vif.data2_i