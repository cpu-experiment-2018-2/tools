usage = "==============================\n\tusage : make run file=hoge.ml\n==============================\n"
bin:
	git submodule foreach git pull origin master
	make -C compiler
	make -C assembly
	./compiler/compile $$file
	./assembly/assemble $$file.s 
simulate:
	echo $(usage)
	git submodule foreach git pull origin master
	make -C compiler
	make -C assembly
	make -C sim 
	./compiler/compile $$file
	./assembly/assemble $$file.s -txt
	./sim/test $$file.s.txt
init:
	git submodule update --init
update:
	git submodule foreach git pull origin master
clean:
	rm *.ml.s
	rm *.ml.s.txt
