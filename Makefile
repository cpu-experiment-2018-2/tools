usage = "==============================\n\tusage : make run file=hoge.ml\n==============================\n"
bin:
	git submodule foreach git pull origin master
	make -C compiler
	make -C assembly
	./compiler/compile $(file)
	./assembly/assemble $(file).s
simulate:
	echo $(usage)
	git submodule foreach git pull origin master
	make -C compiler
	make -C assembly
	make -C sim 
	./compiler/compile $(file)
	./assembly/assemble $(file).s
	./sim/test $(file).s.oo
init:
	git submodule update --init
update:
	git submodule foreach git pull origin master
clean:
	rm *.ml.s
	rm *.ml.s.txt
	make -C compiler clean
	make -C assembly clean
	make -C sim clean


