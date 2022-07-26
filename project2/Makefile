all: update check

EXAMPLES=1 2 3 4 5 6 7

check: $(addprefix check-example, $(EXAMPLES))

output: $(addprefix example, $(addsuffix .output, $(EXAMPLES)))

lispish.exe: lispish.cs
	csc lispish.cs

%.output: lispish.exe %.input
	@timeout -v 30s mono lispish.exe < $*.input  2>&1 > $*.output

check-%: %.output
	@diff -qb $*.output $*.expected
	@echo $*- Success!

update: 
	@echo "Pulling in any changes made to the assignment by the instructor"
	@git pull https://gitlab.csi.miamioh.edu/cse465/instructor/project2.git master

clean:
	rm -f *.output
	rm -f lispish.exe 
	rm -f lispish.pdb