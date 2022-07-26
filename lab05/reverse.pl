% Reverse the elements of a list
% HINT: Use recursive a helper function that gets the head from list 1 and adds it to a tmp list
%
%  The Idea:
%   helper([a, b, c], Result, [])
%     if helper([b, c], Result, [a])
%       if helper([c], Result, [b, a])
%         if helper([], Result, [c, b, a])
%            if Result is [c, b, a] then helper is True

% TODO: Implement my_reverse  (you need to implement helper)
% my_reverse(L1, L2) :- helper(L1, L2, []).

my_reverse([], []).
my_reverse([H|T], R) :-
	my_reverse(T, RT),
	append(RT, [H], R).


% TESTS
%
:- my_reverse([a, b, c], L), display(L), nl. 
:- my_reverse([], L), display(L), nl. 
:- my_reverse([a], L), display(L), nl.

