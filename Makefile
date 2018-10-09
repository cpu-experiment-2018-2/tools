usage = "==============================\n\tusage : make run file=hoge.ml\n==============================\n"
run:
	echo $(usage)
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
