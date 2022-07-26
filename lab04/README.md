# Lab 4:  Beginning Prolog
This lab covers basic prolog rules, facts, and numbers. 
> **NOTE:** You can interact with prolog programs using https://swish.swi-prolog.org/
> This can be a good way to test things out before pasting them into your solution. 

# Before Asking for Help
1.  Make sure you watched the weak's lecture
2.  You _must_ explain the process you have already used to solve the problem.  
    **NOT** how long you worked, or how many attempts. You need to explain your approaches that have thus-far failed. 
3.  Include the output of any error messages.

# How to Submit and Use Gitlab
1. Fork this repo into your own subgroup
2. Clone _your_ fork into your container
3. Add the 'instructor' remote to your repo
   ```
   git remote add instructor https://gitlab.csi.miamioh.edu/cse465/instructor/lab04.git
   git pull instructor
   ``` 
   Periodically use `git pull instructor` to make sure you get any corrections I make to the assignment. 
4. Each time you make progress, use
   ```
   git commit -am "Made Progress" 
   git push
   ```
5. When you are done, use
   ```
   git commit -am "Finished" 
   git push
   ```  
   Then go to **canvas** and post the URL of your fork. 
# Description

For this assignment, I hav put different prolog assignments
into files. Each file `XXX.pl` can be tested using a corresponding 
`make check-XXX` target.  


For each file, I provide a problem description 
and some examples of using your solution
at the bottom of the file. 

You should look at the files that end in `.expected` to 
check what the output should be. 

To run all of the tests use `make check` or just `make`. 

You will receive a zero if you submit and the checks do not all pass.
It is better to turn it in late than incomplete. 

# Grading Notes
This seems like many problems, but each one is small. 
If done correctly, each problem should have a short solution
Of course, they _wont be **easy** _ even if the correct solutions are short. 

1. The grader will run 'make check' to confirm that all checks are successful. 
2. The grader will look at your code to make sure that you have followed the rules of the assignment (no modifying the tests for example).  
3. If your solution is acceptable you will receive full credit, otherwise you will be asked to resubmit and will incur a late penalty. 

