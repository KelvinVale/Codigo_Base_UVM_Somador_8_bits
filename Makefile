IFS = ./exemplo_soma_if.sv

PKGS = ./exemplo_soma_pkg.sv

RTL = ./Somador_8_bits.sv 

MIN_TRANSA = 100

RUN_ARGS_COMMON = -access +r -input ./shm.tcl \
		  +uvm_set_config_int=*,recording_detail,1 -coverage all -covoverwrite

sim: clean
	@g++ -g -fPIC -Wall -std=c++0x refmod_c.cpp -shared -o test.so
	xrun -64bit -uvm $(PKGS) $(IFS) $(RTL) exemplo_top.sv -sv_lib test.so \
		+UVM_TESTNAME=exemplo_soma_test -covtest exemplo_soma_test $(RUN_ARGS_COMMON) \
		-defparam exemplo_top.min_trans=$(MIN_TRANSA)

clean:
	@rm -rf INCA_libs waves.shm cov_work/ *.history *.log *.key mdv.log imc.log imc.key ncvlog_*.err *.trn *.dsn .simvision/ xcelium.d simv.daidir *.so *.o *.err

waves:
	simvision waves.shm &


	