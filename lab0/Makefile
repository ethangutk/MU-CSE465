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

# Use:   
#	make xxxx.output to se the output of xxx (e.g 'make HelloWorldJava.output')
# to test only one problem

PROBLEMS = $(basename  $(wildcard *.expected))

# Build a list of make-targets that check the solution
# The rules themselves are further down in the file, of course. 
#
#  check-XXXX  will compere XXXX.output to XXXX.expected
#  no-loops-in-XXXX.YYY will make sure the words 'for' and 'while' are not used
#  no-todos-in-XXXX.YYY  will make sure the word 'todo' is not in the file anymore
#
RULES =  $(addprefix check-, $(PROBLEMS))

# The student code is saved to XXX.output
OUTPUTS = $(addsuffix .output,  $(PROBLEMS))

default: all

all: check

check: $(RULES)

clean:
	@rm -f $(OUTPUTS)
	@rm -f *.class
	@rm -f *.exe

# Rules to get outputs of the assignments.
FORCE: # no dependancies -- always dirty

# Scheme
%.output: %.scm FORCE
	@(scheme --quiet < $*.scm >$*.output) || (cat $*.output; false)


# Prolog
%.output: %.pl FORCE
	@(swipl --quiet  $*.pl > $*.output) || (cat $*.output; false)


# Python
%.output:  %.py FORCE
	@(python $*.py >$*.output) || (cat $*.output; false)

# Java
HelloWorldJava.class: HelloWorldJava.java FORCE
	@javac HelloWorldJava.java

%.output: %.class FORCE
	@(java $* >$*.output) || (cat $*.output; false)

# C-Sharp
HelloWorldCSharp.exe: HelloWorldCSharp.cs FORCE
	@mcs -nologo HelloWorldCSharp.cs

%.output:  %.exe FORCE
	@(mono $*.exe >$*.output) || (cat $*.output; false)

###########################################################################
# Sanity checks to make sure the output is correct and the sourcefiles 
# follow the rules of the assignment. 
###########################################################################

# Make sure the output matches the expected output
check-%: %.output
	@[ -z '$(shell diff $*.output $*.expected)' ] || (echo "$*.output does not match $*.expected\n" && diff $*.output $*.expected && false)
	@echo $* -- Success!

submit: check
	git add -u
	git commit -am "Submitting"
	git push origin master
	@echo ""
	git log -1
	@echo ""
	@echo "*** All tests seem to have passed. "
	@echo "*** Copy and paste the output above and submit it to canvas."
	@echo "*** Bear in mind that the tests must complete in under 5 minutes on the instructors machine." 
	@echo "*** and make sure that the output is has the commit hash shown above." 
	@echo ""

update-http:
	git pull https://gitlab.csi.miamioh.edu/CSE465/instructor/lab0.git

update-ssh:
	git pull git@gitlab.csi.miamioh.edu:CSE465/instructor/lab0.git

update: update-http

