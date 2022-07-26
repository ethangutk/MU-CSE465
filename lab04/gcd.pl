% Implement the GCD algorithm using Prolog
% See https://en.wikipedia.org/wiki/Euclidean_algorithm#Implementations

% The recursive version of he Euclidean algorithm 
% for computing the GCD  is:
%
% function gcd(a, b)
%     if b = 0
%         return a
%     else
%         return gcd(b, a mod b)


% TODO -- Define GCD here in Prolog here
gcd(A, 0, A).
gcd(A, B, R) :- AmodB is A mod B, gcd(B, AmodB, R).

% Tests
:- gcd(8, 4, X), format('gcd of 8 and 4 is ~f~n', X).
:- gcd(105, 252, X), format('gcd of 105 and 252 is ~f~n', X).
