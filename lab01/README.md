# 465-java-recursion

1. Write a recursive Java program to print all 8-digit binary numbers.  No loops allowed!. 
2. Also, complete the parts indicated in the `basics.scm` file 

# Submitting Your Code
1. Make sure your code passes all of the tests when you run `make check` 
2. Type `make update-ssh`  or  `make update-http` to make sure you have the latest version of the assignment. 
3. Commit to gitlab (or type `make submit`)

# How do I solve this crazy problem?
Recursive problems can be puzzling, but it is a skill that is valuable to have. 
1.  Think of what is the simplest subproblem I could solve? Could you print every 1-digit number? 
2.  Think of _how_ you could incorporate a solution to the subproblem into a _slightly_ larger problem. Can I _use_ the 1-bit solution to print every 2-bit number?  This may involve minor asjustments to the 1-bit solution. 
3.  If you have done steps 1 and 2, you might be able to (inductively) solve it for n-bits!  


# Testing  your Code

1.  Test Counter using `make check-counter`
2.  Test basics.scm using `make check-basics`
3.  Test everything `make check`

# Submitting your code
type 
```
make submit
```
and the copy/paste the output into canvas. 