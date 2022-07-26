# This is a makefile I use to grade assignments in various languages
# It should be simple enough that the adventurous student can understand
# what it is doing. 
#
# STUDENTS: Note that changes to this file will only hurt you.
# I do not use YOUR version when doing a sanity-check before grading.  
# Changing this file is a potential integrity issue. 
#
# Also note that this is a SANITY check. Assignments will not be accepted 
# if they do not pass the sanity check, and will be marked late or missing. 
# 
# Grading is only done after the sanity checks pass. 
# The student code is saved to XXX.output

default: all

all: check

check: check-list-basics check-kth-element check-last-element check-reverse check-palindrome

clean:
	@rm -f *.output
	@rm -f *.class
	@rm -f *.exe

# Rules to get outputs of the assignments.
FORCE: # no dependancies -- always dirty


# Prolog
%.output: %.pl FORCE
	(swipl -q -g halt $*.pl | tee $*.output) 


%.output:  %.exe FORCE
	@(mono $*.exe >$*.output) || (cat $*.output; false)


check-%: %.output
	@[ -z '$(shell diff --strip-trailing-cr $*.output $*.expected)' ] \
		|| (echo "$*.output does not match $*.expected\n" \
		    && diff --strip-trailing-cr $*.output $*.expected && false)
	@echo $*-Success!


submit: check submit-without-check

submit-without-check:
	git add -u 
	git commit -m "Submission" || echo "** Nothing has changed"
	git push origin master 
	git log -1

update-http:
	git pull https://gitlab.csi.miamioh.edu/CSE465/instructor/lab04.git

update-ssh:
	git pull git@gitlab.csi.miamioh.edu:CSE465/instructor/lab04.git

update: update-ssh 



