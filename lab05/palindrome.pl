% Find out whether a list is a palindrome. 
% You may use the prolog reverse function

% TODO write is_palindrome/1
is_palindrome(L) :-
	reverse(L, L).

% TESTS
:- is_palindrome([a, b, b, a]), format("Passed!"), nl; format('Failed'), nl. 
:- is_palindrome([m, y, g, y, m]), format("Passed!"), nl; format('Failed'), nl. 
:- \+ is_palindrome([g, y, m]), format("Passed!"), nl; format('Failed'), nl. 


