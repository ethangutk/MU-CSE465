% I will not accept a submission with the T0D0 comments left in place!

% Logic Puzzle ID: X034TV

url("https://logic.puzzlebaron.com/pdf/X034TV.pdf").

solution([
		[1932, "Umkad", 9.0, 49],
		[1938, "Garenia", 8.4, 41],
		[1944, "Delest", 9.1, 99],
		[1950, "Zhezios", 8.6, 84],
		[1956, "Nenios", 8.1, 58]
	]).

solve(T) :-
T = [[1932, I1, RS1, D1],
	[1938, I2, RS2, D2],
	[1944, I3, RS3, D3],
	[1950, I4, RS4, D4],
	[1956, I5, RS5, D5]],
permutation([41, 49, 58, 84, 99],
        [D1, D2, D3, D4, D5]),

rule6(T),

permutation(["Umkad", "Garenia", "Delest", "Zhezios", "Nenios"],
	[I1, I2, I3, I4, I5]),

rule3(T),

permutation([9.0, 8.4,9.1, 8.6, 8.1],
	[RS1, RS2, RS3, RS4, RS5]),
rule1(T),
rule2(T),
rule4(T),
rule5(T),
rule7(T),
rule8(T),
true.

% Implement rules here:
% 1. The quake that took place in 1950 didn't have a rating of 9.1.
rule1(T) :-
member([1950, _, R, _], T),
R \= 9.1.

% 2. Of the quake that took place in 1932 and the quake with a duration of 84 seconds, one had a rating of 8.6 and the other had its epicenter at Umkad.
rule2(T) :-
member([1932, E1, R1, _], T),
member([_, E2, R2, 84], T),
(R1 = 8.6, E2 = "Umkad"; R2 = 8.6, E1 = "Umkad").

% 3. The quake with its epicenter at Zhezios occurred 12 years after the earthquake with a duration of 41 seconds.
rule3(T) :-
member([Y1, "Zhezios", _, _], T),
member([Y2, _, _, 41], T),
A is Y1-Y2,
A = 12.

% 4. The quake with its epicenter at Delest occurred 12 years after the 9.0 quake.
rule4(T) :-
member([Y1, "Delest", _, _], T),
member([Y2, _, 9.0, _], T),
A is Y1-Y2,
A = 12.

% 5. The 9.1 earthquake occurred 6 years after the quake with a duration of 41 seconds.
rule5(T) :-
member([Y1, _, 9.1, _], T),
member([Y2, _, _, 41], T),
A is Y1-Y2,
A = 6.

% 6. The event that took place in 1932 lasted for 49 seconds.
rule6(T) :-
member([1932, _, _, 49], T).

% 7. Neither the earthquake with a duration of 84 seconds nor the 8.4 event was the event with its epicenter at Nenios.
rule7(T) :-
member([_, N1, _, 84], T),
member([_, N2, 8.4, _], T),
(N1 \= "Nenios"),
(N2 \= "Nenios").

% 8. The event with its epicenter at Nenios occurred sometime after the event with a duration of 99 seconds.
rule8(T) :-
	member([Y1, "Nenios", _, _], T),
	member([Y2, _, _, 99], T),
	Y1 > Y2.

check :-
% Confirm that the correct solution is found
solution(S), (solve(S); not(solve(S)), writeln("Fails Part 1: Eliminates the correct solution"), fail),
% Make sure S is the ONLY solution
not((solve(T), T\=S, writeln("Failed Part 2: Does not eliminate:"), print_table(T))),
writeln("Found 1 solutions").

print_table([]).
print_table([H|T]) :- atom(H), format("~|~w~t~20+", H), print_table(T).
print_table([H|T]) :- is_list(H), print_table(H), nl, print_table(T).


% Show the time it takes to conform that there are no incorrect solutions
checktime :- time((not((solution(S), solve(T), T\=S)))).



