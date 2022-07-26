default: all

all: check

check: check-approx-der check-eval-poly check-poly-func \
       	check-cube-all check-reverse-fold check-even-values

clean:
	@rm -f *.output
	@rm -f *.class
	@rm -f *.exe

submit: check
	git commit -am "Submitting"
	git push origin master

update-http:
	git pull https://gitlab.csi.miamioh.edu/CSE465/instructor/lab03.git

update-ssh:
	git pull git@gitlab.csi.miamioh.edu:CSE465/instructor/lab03.git

update: update-http

# Rules to get outputs of the assignments.
FORCE: # no dependancies -- always dirty

# Scheme
%.output: %.scm FORCE
	@(scheme --quiet < $*.scm >$*.output) || (cat $*.output; false)


# Make sure the output matches the expected output
check-%: %.output
	@[ -z '$(shell diff --strip-trailing-cr $*.output $*.expected)' ] \
		|| (echo "$*.output does not match $*.expected\n" \
		    && diff --strip-trailing-cr $*.output $*.expected && false)
	@echo $*-Success!




