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

check: check-family check-factorial check-gcd

clean:
	@rm -f *.output
	@rm -f *.class
	@rm -f *.exe

# Rules to get outputs of the assignments.
FORCE: # no dependancies -- always dirty

# Scheme
%.output: %.scm FORCE
	@(scheme --quiet < $*.scm >$*.output) || (cat $*.output; false)


# Prolog
%.output: %.pl FORCE
	(swipl -q -g halt $*.pl | tee $*.output) 


# Python
%.output:  %.py FORCE
	@(python $*.py >$*.output) || (cat $*.output; false)

# Java
%.class: %.java
	@javac $?

%.output: %.class FORCE
	@(java $* >$*.output) || (cat $*.output; false)

# C-Sharp
%.exe: %.cs 
	@csc -nologo $?

%.output:  %.exe FORCE
	@(mono $*.exe >$*.output) || (cat $*.output; false)

###########################################################################
# Sanity checks to make sure the output is correct and the sourcefiles 
# follow the rules of the assignment. 
###########################################################################

# Make sure the output matches the expected output
check-%: %.output
	@[ -z '$(shell diff --strip-trailing-cr $*.output $*.expected)' ] \
		|| (echo "$*.output does not match $*.expected\n" \
		    && diff --strip-trailing-cr $*.output $*.expected && false)
	@echo $*-Success!

# This uses grep to make sure there are no for-loops or while-loops
no-loops-in-%: %
	@[ -z "$(shell grep for $*)" ] || (echo "You may not use for loops" && false)
	@[ -z "$(shell grep while $*)" ] || (echo "You may not use while loops" && false)

# This used grep to make sure students address all of the TODO comments
# (and then remove them!)
no-todos-in-%: %
	@[ -z "$(shell grep -i todo $*)" ] || (echo "You must replace all TODO comments" && false)




