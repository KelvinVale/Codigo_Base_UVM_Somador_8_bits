class exemplo_soma_test extends uvm_test;
  exemplo_soma_env env;
  exemplo_soma_sequence_i seq;

  `uvm_component_utils(exemplo_soma_test)

  function new(string name, uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = exemplo_soma_env::type_id::create("env", this);
    seq = exemplo_soma_sequence_i::type_id::create("seq", this);
  endfunction
 
  task run_phase(uvm_phase phase);
    fork
      seq.start(env.agent_i.sequencer);
    join
  endtask: run_phase

endclass : exemplo_soma_test