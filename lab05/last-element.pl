% Find the last element of a list



 % TODO: Implement my_last/2
my_last([Last], Last).
my_last([_|T], Last) :-
	    my_last(T, Last).

% Tests
:- my_last([a, b, c, d], X), display(X), nl. 
:- my_last([a], X), display(X), nl. 

