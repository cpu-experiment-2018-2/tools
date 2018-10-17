usage = "==============================\n\tusage : make run file=hoge.ml\n==============================\n"
export CPU_LIB_PATH=$(PWD)/assembly/lib/

TRASH = $(TESTS:%=test/%.st) $(TESTS:%=test/%) $(TESTS:%=test/%.res) $(TESTS:%=test/%.ans) $(TESTS:%=test/%.cmp) 
bin:
	echo $(CPU_LIB_PATH)
	git submodule foreach git pull origin master
	make -C compiler
	make -C assembly
	./compiler/compile $(file)
	./assembly/assemble $(file).st
simulate:
	echo $(usage)
	rm -f d.txt
	git submodule foreach git pull origin master
	make -C compiler
	make -C assembly
	make -C sim silent
	./compiler/compile $(file)
	./assembly/assemble $(file).st
	./sim/sim $(file).st.oo
init:
	git submodule update --init
update: build

build:
	git submodule foreach git pull origin master
	make -C compiler
	make -C assembly
	make -C sim 
build_test:
	git submodule foreach git pull origin master
	make -C compiler
	make -C assembly
	make -C sim silent

clean:
	rm *.ml.st -f
	rm *.ml.st.txt -f
	rm *.ml.st.oo -f
	make -C compiler clean
	make -C assembly clean
	make -C sim clean
	rm -f test/*.st test/*.oo test/*.ans test/*.res conv a.out
conv: conv.cpp
	g++-5 -std=c++14 conv.cpp -o conv
# TESTS= print sum-tail gcd sum fib ack even-odd \
# adder funcomp cls-rec cls-bug cls-bug2 cls-reg-bug \
# shuffle spill spill2 spill3 join-stack join-stack2 join-stack3 \
# join-reg join-reg2 non-tail-if non-tail-if2 \
# inprod inprod-rec inprod-loop matmul matmul-flat \
# manyargs

TESTS= print sum-tail gcd sum fib ack

test: clean build_test conv $(TESTS:%=test/%.test)
	echo "OK"

.PRECIOUS: test/% test/%.res test/%.ans 


test/%.test: test/%.ml 
	rm -f d.txt
	./compiler/compile $^
	./assembly/assemble $^.st
	./sim/sim $^.st.oo
	ocaml $^ > $^.res
	./conv < d.txt > dd.txt
	diff dd.txt $^.res 
