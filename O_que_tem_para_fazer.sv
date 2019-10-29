O que tem para fazer :


	agents:
		-agent_in
			.interfacee			ok;
			.transaction		ok;
			.sequence			ok;
			.sequencer			ok;
			.driver				ok;
			.monitor			ok;
			.montar_agent		ok;

		-agent_out
			.interfacee			ok;
			.transaction		ok;
			.driver				ok;
			.monitor			ok;
			.montar_agent		ok;

	scoreboard:
		-refmods
			.refmod.c				ok;
			.refmod.sv				ok;
		-comparador					ok;
		-montar_scoreboard			ok;

	env:
		-agents						ok;
		-scoreboard					ok;
		-cobertura					ok;
		-montar_env					ok;

	teste:
		-env 						ok;
		-montar_teste				ok; //Ativar a sequência !!!!

	top:
		-dut						ok;
		-montar_top					ok;




	Mudar arquivo 'pkg' 			ok;

	Mudar Makefile 					ok;


