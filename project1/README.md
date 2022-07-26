# Prolog Puzzle Project

## Overview
The "funnest" way I can think of to practice logic programming is to use it to solve a logic puzzle. 
A logic puzzle is typically presented as a mystery and list of clues that can be used to infer facts such as "who done it". 

For this assignment, we will use the [Printable Logic Puzzles](https://www.printable-puzzles.com/printable-logic-puzzles.php) website to find two puzzles to solve. One will be a "challenging" puzzle and the other will be a "Very Hard" puzzle. 


For this assignment, you will write all of the clues as rules in a prolog program. 

Your prolog file must obey the folowing format:

1.  The name of the prolog files must be 'challenging.pl' and 'veryhard.pl' 
2.  Your prolog file must provide a `url/1` fact to get the URL of the puzzle being solved. 
3.  Your prolog file must also provide a `solution/1` fact with the correct solution hardcoded in. You will get the correct solution from the [Printable Logic Puzzles](https://www.printable-puzzles.com/printable-logic-puzzles.php) website.  
    Note that challenging puzzles have solutions with 5 rows, and veryhard puzzles have solutions with 6 rows. 
4.  Your prolog file must provide a `solve/1` rule that uses the clues to find one, and only one, table that is the solution. 
5.  Your puzzle must have a sereis of `clueX(T)` rules that are satisfied whenever the solution in `T` is consistent with clue X.  
6.  Your puzzle must include the `check` rule, you should not modify this except if specifically suggested by the instructor. 

To receive credit, your puzzle must find one, and only one, solution to the puzzle. 

Your assignment will be checked by running swipl in the docker container as follows:

```
swipl -q -g check -g halt challenging.pl 
```
or 
```
swipl -q -g check -g halt veryhard.pl 
```

which will use your `solve` and `solution` predicates to make sure you find exactly one solution and that it is the correct solution. 

***Time Matters*** While I am not specifically grading based on how fast your code runs, as a practical concern there MUST be some upper limit on how long a program can execute before the process times out. Otherwise I would never be able to run every student's submission.  Also your program may take up to twice as long on my computer as it does on yours, so optimization will be important. Usually a process times out after 5 minutes; I _may_ extent the limit to 10 minutes but you should not count on it. Historically, students who optimize their code can get it to solve the veryhard puzzle in well under a minute, and that time likely will get faster as my computer gets upgraded over time. 

***Optimization*** If you pay attention to chapter 16 and the lecture, then you know that prolog uses a depth-first-search to satisfy goals and it process them from left to right (or top to bottom). As soon as a goal fails, the entire branch of that search is "pruned". Therefore, by rearranging the goals of a rule to "fail fast" in prolog you can drastically reduce the number of branches it has to explore, resulting in large improvements of running time. I should not need to explain more than this, but I probably will in class.  

***Errors & Warnings*** It should go without saying that your program must not display error messages. I will not accept submissions that show error messages or warnings when they are run. 

***Debugging*** Your strongest skill as a CS student should be debugging -- so please do not ask me to do this for you except in extreme situations. You can post questions on Piazza, but do not be upset if I wait for another student to answer it.  For most questions I will try to give high level/vague "hint" types of answers. This may be frustrating, but you are the one that needs to do the work (of figuring things out). 

***Other issues*** It is not reasonable to expect that a coding assignment explain every possible thing that could be done wrong (there are just so many!). Simply because an issue is not mentioned here, that does not mean it could result in my not accepting the assignment. 

***SWISH*** You can, of course, work on your solution using  [SWISH](https://swish.swi-prolog.org/) in which case you may want to also use their [table rendering plugin](https://swish.swi-prolog.org/example/render_table.swinb) to display your solution.  Once you have a solution, however, you should confirm that it runs properly in the container. This may mean commenting out the part where you load the plugin. 

## Checking Your Solution
You will not be able to solve the veryhard puzzle without optimizing your solution. 
1.   Type `solution(S), solve(S)` to make sure you dont rule out the correct solution. This is always fast. 
2.   Type `soltuion(S), solve(T), T\=S` to find your first incorrect solution. This is usually fast enough. 
3.   Copy the incorrect soltuion from above and use     `T=<pasted from abov>, clueX(T)` to debug a clue.  

When you think you have it, use

```
make check
```
or 
```
make check-challenging
make check-veryhard
```

All of these MUST pass before you submit the assignment. 

## Submitting your solution

Run `make submit` to dubmit to gitlab, and make sure it succeeded. 

Then submit anything you can to canvas (e.g. the output of make submit)



