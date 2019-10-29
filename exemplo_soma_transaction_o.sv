class exemplo_soma_transaction_o extends uvm_sequence_item;
	rand logic unsigned [8:0] data_out_o;

	`uvm_object_utils_begin(exemplo_soma_transaction_o)
		`uvm_field_int(data_out_o, UVM_ALL_ON|UVM_HEX)
	`uvm_object_utils_end

	function new(string name = "exemplo_soma_transaction_o");
		super.new(name);	
	endfunction : new

	function string convert2string();
		return $sformatf("{data_out_o = %h}",data_out_o);
	endfunction

	function void do_copy(uvm_object rhs);
        exemplo_soma_transaction_o rhs_;

        if(!$cast(rhs_, rhs)) begin
          `uvm_fatal("do_copy", "cast of rhs object failed")
        end
        super.do_copy(rhs);
        data_out_o = rhs_.data_out_o;
    endfunction : do_copy

endclass : exemplo_soma_transaction_o
