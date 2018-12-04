usage = "==============================\n\tusage : make run file=hoge.ml\n==============================\n"
export CPU_LIB_PATH=$(PWD)/assembly/lib/

TRASH = $(TESTS:%=test/%.st) $(TESTS:%=test/%) $(TESTS:%=test/%.res) $(TESTS:%=test/%.ans) $(TESTS:%=test/%.cmp) 
bin:
	echo $(CPU_LIB_PATH)
	make -C compiler/2nd
	make -C assembly/2nd
	./compiler/2nd/compile $(file)
	./assembly/2nd/assemble $(file).st
simulate_asm:
	rm -f d.txt
	make -C assembly/2nd
	make -C sim/2nd silent
	./assembly/2nd/assemble $(file)
	./sim/2nd/sim $(file).oo

simulate:
	echo $(usage)
	rm -f d.txt
	make -C compiler/2nd
	make -C assembly/2nd
	make -C sim/2nd silent
	./compiler/2nd/compile $(file)
	./assembly/2nd/assemble $(file).st
	./sim/2nd/sim $(file).st.oo
	./to_str <d.txt > dd.txt
	cat dd.txt

init:
	git submodule update --init
update: build

build:
	git submodule foreach git pull origin master
	make -C compiler/2nd
	make -C assembly/2nd
	make -C sim/2nd

build_test:
	# git submodule foreach git pull origin master
	make -C compiler/2nd
	make -C assembly/2nd
	make -C sim/2nd silent

clean:
	rm *.ml.st -f
	rm *.ml.st.txt -f
	rm *.ml.st.oo -f
	make -C compiler/2nd clean
	make -C assembly/2nd clean
	make -C sim/2nd clean
	rm -f test/*.st test/*.oo test/*.ans test/*.res conv a.out test/*.cmo test/*.cmi test/*.correct test/*.res test/*.st.* test/*.out

conv: conv.cpp
	g++-5 -std=c++14 conv.cpp -o conv
# TESTS= print sum-tail gcd sum fib ack even-odd \
# adder funcomp cls-rec cls-bug cls-bug2 cls-reg-bug \
# shuffle spill spill2 spill3 join-stack join-stack2 join-stack3 \
# join-reg join-reg2 non-tail-if non-tail-if2 \
# inprod inprod-rec inprod-loop matmul matmul-flat \
# manyargs

TESTS= sum-tail gcd sum fib adder cls-rec cls-bug cls-reg-bug spill spill2 spill3 even-odd  shuffle spill spill2 spill3 join-stack join-stack2 join-stack3 join-reg join-reg2 inprod inprod-rec inprod-loop matmul matmul-flat manyargs iszero fisneg fispos cond fless ftoi floor


# TESTS= float


sld: sld_converter.cpp
	g++-5 -std=c++14 sld_converter.cpp -o sldconv
mini: test/miniMLRuntime.ml
	ocamlc -c test/miniMLRuntime.ml

test: clean build_test conv mini $(TESTS:%=test/%.test)
	echo "OK"

.PRECIOUS: test/% test/%.res test/%.ans 


fusei: sld
	rm -rf d.txt
	./sldconv < $(file) > $(file).conved
	./sim/2nd/sim ./compiler/2nd/minrt/minrt_with_global_fusei.ml.st.oo  < $(file).conved
	./to_str < d.txt > res.ppm
	
test/%.test: test/%.ml 
	rm -f d.txt
	rm -f test/tmp.ml
	./compiler/2nd/compile $^
	./assembly/2nd/assemble $^.st
	./sim/2nd/sim $^.st.oo
	echo "open MiniMLRuntime" >> test/tmp.ml
	echo "let _ = " >> test/tmp.ml
	cat $^ >> test/tmp.ml
	ocamlc -c test/tmp.ml -I test/
	# ocamlc -I test/ test/tmp.ml -o $^.out
	ocamlc test/miniMLRuntime.cmo test/tmp.cmo  -o $^.out
	./$^.out > $^.correct
	./to_str < d.txt > $^.res
	diff $^.correct $^.res 
#
# test/%.test: test/%.ml 
# 	rm -f d.txt
# 	./compiler/compile $^
# 	./assembly/assemble $^.st
# 	./sim/sim $^.st.oo
# 	ocaml $^ > $^.res
# 	./to_str < d.txt > dd.txt
# 	diff dd.txt $^.res 
