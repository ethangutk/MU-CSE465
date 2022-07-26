% Find the kth element of a list


% TODO: Find the kth element of a list
kth_element([E|_], 0 , E).
kth_element([_|T], K, E):-
	J is K-1,
	kth_element(T, J, E).

% TESTS 

:- kth_element([a, b, c, d], 0, X), display(X), nl. 
:- kth_element([a, b, c, d], 3, X), display(X), nl. 
:- kth_element([a], 0, X), display(X), nl. 

