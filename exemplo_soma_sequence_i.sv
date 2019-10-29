class exemplo_soma_sequence_i extends uvm_sequence#(exemplo_soma_transaction_i);

	`uvm_object_param_utils(exemplo_soma_sequence_i)

	typedef exemplo_soma_transaction_i transaction_type;

	function new(string name = "");
		super.new(name);
	endfunction

	task body();
		transaction_type tr;
		forever begin
			tr = transaction_type::type_id::create("tr");
			start_item(tr);
				assert(tr.randomize());
			finish_item(tr);
		end
	endtask
endclass : exemplo_soma_sequence_i