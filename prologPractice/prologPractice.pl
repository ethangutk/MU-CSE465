% this is a comment


% this is a set and each
% name is apart of a set
% john, susan, and jim are all atoms
human(john).
human(jim).
human(susan).
human(jane).

male(john).
parent(john, jane).
father (X, Y) :- male(X), parent(X, Y).


% Can you read the rules?
% ?-[rules].
% should return "true."

%?- human(john).
% "Is there a human named john?
% This should return true.

% ?- human(X)
% X = john ;
%
% The ; stands for OR



