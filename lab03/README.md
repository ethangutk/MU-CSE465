# Lab 3:  More Exercises in Scheme
# Before Asking for Help
1.  Make sure you are caught up with the reading and, if you have missed a lecture, try to check with a classmate.
2.  Carefully read the error message, if any is shown (!)
3.  You _must_ explain the process you have already used to solve the problem.  
    **NOT** how long you worked, or how many attempts. You need to explain your approaches that have thus-far failed. 
4.  Include the output of any error messages.

# How to Submit and Use Gitlab
2. Check out _your_ clone into your container. Do _not_ request access to write to the instructor version. 
3. Do _not_ edit the makefile or .expected files.   
   Periodically use `make update-http`  or `make update-ssh` to make sure you get any corrections I make to the assignment. 


4. Each time you make progress, or plan to switch to a machine, use
   ```
   git commit -am "Made Progress" 
   git push
   ```
   If you plan to start work on a new machine, use 
   ```
   git pull
   ``` 
   ***before*** editing any files. 
5. When you are done, use
   ```
   make submit
   ```
   or 
   ```
   make check &&  git commit -am "Finished"  &&  git push
   ```  
   > NOTE: The message is irrelevant, I will grade whatever is posted to gitlab periodically after the due date.  
   **Submit late work ASAP -- you lose points each day that the repo does _not_ pass the tests**. 

   Your work will not be accepted if  `make check` fails. 

6. No need to do anything on canvas -- I grade whatever is in gitlab. 

# Description

For this assignment, I have put some exercises about 
higher-order functions in scheme into different files. 

For each file, I provide a problem description at the 
top of the file and some examples of using a function
at the bottom of the file. 

You should look at the files that end in `.expected` to 
check what the output should be. 

Here are the different checks:
-  `make check-approx-der` - Check `approx-der.scm` which  returns the derivative of a function. 
- `make check-eval-poly` - Check `eval-poly.scm` which evaluates a polynomial whose coefficients are given as a list
- `make check-poly-func` - Check `poly-func.scm` which returns a function based on polynomial coefficients provided as a list. Each time you call the returned function it will evaluate the polynomial. 
- `make cube-all`  - Checl `cube-all.scm` which uses a higher order function (NOT RECURSION!) to cube all of the elements of a list. 
- `make reverse-fold` - Check `reverse-fold.scm`  which uses a higher order function (NOT RECURSION!) to reverse the elements of a list. You may NOT use the builtin `reverse` function. 
- `make even-values` - Checl `even-values.scm`  which uses a higher order function to remove all of the odd values from a list. NOT recursion. 

To run all of the tests use `make check` or just `make`. 

You will receive a zero if you submit and the checks do not all pass.
It is better to turn it in late than incomplete. 

To submit, type  `make submit` or just commit and push your changes to the repo. 

# Grading Notes
This seems like many problems, but each one is small. 
If done correctly, each problem should have a short solution
(a few lines, often just one line of scheme). 
Of course, they _wont be **easy** _ even if the correct solutions are short. 

1. The grader will run 'make check' to confirm that all checks are successful. 
2. The grader will look at `reverse-fold.scm` to make sure that the `reverse` builtin function is not used. 
3. The grader will look at `cube-all.scm` to make sure that `map` is used properly.
4. The grader will look at `even-values.scm` to make sure that `filter` is used properly. 


