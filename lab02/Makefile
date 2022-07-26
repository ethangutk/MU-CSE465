all: check

check: check-list 

clean:
	@rm -f $(OUTPUTS)
	@rm -f *.class
	@rm -f *.exe

# Scheme
list.output: list.scm 
	scheme --quiet < list.scm >list.output


# Make sure the output matches the expected output
check-list: list.output
	diff -y list.output list.expected
	@echo check-list -- Success!

update:
	git pull git@gitlab.csi.miamioh.edu:CSE465/instructor/lab02.git master

submit: check submit-without-check

submit-without-check:
	git add -u 
	git commit -m "Submission" || echo "** Nothing has changed"
	git push origin master 
	git log -1
