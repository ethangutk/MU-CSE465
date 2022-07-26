

all: lex.exe

check: check-example1

check-example1: example1.output
	diff -qb example1.output example1.expected || diff -qb example1.output example1.old.expected 

example1.output: lex.exe example1.input
	mono lex.exe < example1.input >example1.output

lex.exe: lex.cs
	csc lex.cs

diagram.png: state-diagram.gv
	dot state-diagram.gv -odiagram.png -Tpng

submit: check
	git add -u
	git commit -am "Submitting"
	git push origin master

update-http:
	git pull https://gitlab.csi.miamioh.edu/CSE465/instructor/lab07.git

update-ssh:
	git pull git@gitlab.csi.miamioh.edu:CSE465/instructor/lab07.git

update: update-http
