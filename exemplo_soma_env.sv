class exemplo_soma_env extends uvm_env;
	`uvm_component_utils(exemplo_soma_env)

	exemplo_soma_agent_i agent_i;
	exemplo_soma_agent_o agent_o;

	exemplo_soma_scoreboard scoreboard;

	exemplo_soma_cover cobertura;

	function new(string name, uvm_component parent = null);
		super.new(name, parent);
	endfunction : new

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		agent_i = exemplo_soma_agent_i::type_id::create("agent_i", this);
		agent_o = exemplo_soma_agent_o::type_id::create("agent_o", this);

		scoreboard = exemplo_soma_scoreboard::type_id::create("scoreboard", this);

		cobertura = exemplo_soma_cover::type_id::create("cobertura", this);
	endfunction : build_phase

	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		//agent_i
		agent_i.agt_exemplo_soma_i_tr_analysis_port.connect(scoreboard.to_rfm_analysis_port);

		//agent_o
		agent_o.agt_exemplo_soma_o_tr_analysis_port.connect(cobertura.resp_port);
		agent_o.agt_exemplo_soma_o_tr_analysis_port.connect(scoreboard.to_comp_analysis_port);
	endfunction : connect_phase

	virtual function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
	endfunction : end_of_elaboration_phase

endclass : exemplo_soma_env
