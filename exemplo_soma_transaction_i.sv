class exemplo_soma_transaction_i extends uvm_sequence_item;
	rand logic unsigned [7:0] data1_i;
    rand logic unsigned [7:0] data2_i;

	`uvm_object_utils_begin(exemplo_soma_transaction_i)
		`uvm_field_int(data1_i, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(data2_i, UVM_ALL_ON|UVM_HEX)
	`uvm_object_utils_end

	function new(string name = "exemplo_soma_transaction_i");
		super.new(name);	
	endfunction : new

	function string convert2string();
		return $sformatf("{data1_i = %h, data2_i = %h}",data1_i, data2_i);
	endfunction

	function void do_copy(uvm_object rhs);
        exemplo_soma_transaction_i rhs_;

        if(!$cast(rhs_, rhs)) begin
          `uvm_fatal("do_copy", "cast of rhs object failed")
        end
        super.do_copy(rhs);
        data1_i = rhs_.data1_i;
        data2_i = rhs_.data2_i;
    endfunction : do_copy

endclass : exemplo_soma_transaction_i
