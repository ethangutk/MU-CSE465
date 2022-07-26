
%Logic Puzzle ID: X034TV

url("https://logic.puzzlebaron.com/pdf/B970MB.pdf").

solution([
[1984, "Miranda", "Caprica", "Trinidad"],
[1985, "Greg", "Farralon", "Barbados"],
[1986, "Ollie", "Neptunia", "Jamaica"],
[1987, "Andre", "Baroness", "Saint Lucia"],
[1988, "Eugene", "Azure Seas", "Grenada"],
[1989, "Cory", "Trinity", "Aruba"]
]).

 solve(T) :-
	 T = [[1984, N1, CL1, D1],
	 [1985, N2, CL2, D2],
	 [1986, N3, CL3, D3],
	 [1987, N4, CL4, D4],
	 [1988, N5, CL5, D5],
	 [1989, N6, CL6, D6]],

	 permutation(["Caprica","Farralon","Neptunia","Baroness","Azure Seas","Trinity"],
	 [CL1, CL2, CL3, CL4, CL5, CL6]),
	 rule1(T),
	 rule2(T),
	 permutation(["Trinidad","Barbados","Jamaica","Saint Lucia","Grenada","Aruba"],
	 [D1, D2, D3, D4, D5, D6]),

	 rule3(T),

	 permutation(["Miranda", "Greg", "Ollie", "Andre", "Eugene", "Cory"],
	 [N1, N2, N3, N4, N5, N6]),

	 rule4(T),
	 rule5(T),
	 rule6(T),
	 rule7(T),
	 rule8(T),
	 rule9(T),
	 rule10(T),
	 rule11(T),
	 rule12(T),
	 rule13(T),

	 true.

 % Implement rules here:
 % % 1. Of the person who took the 1988 cruise and Ollie, one took the Neptunia cruise
 % % and the other took the Azure Seas cruise.
 % % 2. Of the traveler who took the 1986 cruise and Andre, one took the Baroness cruise and the other took the
 % %  Neptunia cruise
 % % 3. The traveler who took the Neptunia cruise set sail 3 years before the traveler who went to Aruba
 % % 4. Cory wasn't on the 1988 cruise.
 % % 5. Greg didn't go to Saint Lucia.
 % % 6. Miranda is either the person who went to Jamaica or the traveler who took the Caprica cruise.
 % % 7. Cory wasn't on the Farralon cruise.
 % % 8. Neither the traveler who took the 1985 cruise nor the person who went to Trinidad is Eugene
 % % 9. The person who took the 1987 cruise is either Eugene or the person who went to Saint Lucia.
 % % 10. The person who took the 1985 cruise is either the traveler who went to Barbados or Cory.
 % % 11. Miranda set sail 4 years before the person who went to Grenada.
 % % 12. The person who went to Saint Lucia set sail 3 years after the person who took the Caprica cruise.
 % % 13. Cory is either the person who took the Azure Seas cruise or the person who went to Aruba







 rule1(T) :-
	 member([1988, _, CL1, _], T),
	 member([_, "Ollie", CL2, _], T),
	 (CL1 = "Neptunia", CL2 = "Azure Seas"; CL2 = "Neptunia", CL1 = "Azure Seas").

	 rule2(T) :-
		 member([1986, _, CL1, _], T),
		 member([_, "Andre", CL2, _], T),
		 (CL1 = "Neptunia", CL2 = "Baroness"; CL2 = "Neptunia", CL1 = "Baroness").

		 rule3(T) :-
			 member([Y1, _, "Neptunia", _], T),
			 member([Y2, _, _, "Aruba"], T),
			 A is Y2 - Y1,
			 A = 3.

		 rule4(T) :-
			 member([Y, "Cory", _, _], T),
			 Y \= 1988.

		 rule5(T) :-
			 member([_, "Greg", _, D], T),
			 D \= "Saint Lucia".

		 rule6(T) :-
			 member([_, "Miranda", CL, D], T),
			 (D = "Jamaica", CL \= "Caprica";D \= "Jamaica", CL = "Caprica").

			 rule7(T) :-
				 member([_, "Cory", CL, _], T),
				 CL \= "Farralon".

			 rule8(T) :-
				 member([Y, "Eugene", _, D], T),
				 Y \= 1985,
				 D \= "Trinidad".

			 rule9(T) :-
				 member([1987, N, _, D], T),
				 (D = "Saint Lucia", N \= "Eugene"; D \= "Saint Lucia", N = "Eugene").

				 rule10(T) :-
					 member([1985, N, _, D], T),
					 (N = "Cory"; D = "Barbados").

					 rule11(T) :-
						 member([Y1, "Miranda", _, _], T),
						 member([Y2, _, _, "Grenada"], T),
						 A is Y2 - Y1,
						 A = 4.

					 rule12(T) :-
						 member([Y1, _, "Caprica", _], T),
						 member([Y2, _, _, "Saint Lucia"], T),
						 A is Y2 - Y1,
						 A = 3.

					 rule13(T) :-
						 member([_, "Cory", CL, D], T),
						 (CL = "Azure Seas"; D = "Aruba").




						 check :- 
							 % Confirm that the correct solution is found
							 solution(S), (solve(S); not(solve(S)), writeln("Fails Part 1: Does not eliminate the correct solution"), fail),
							 % Make sure S is the ONLY solution 
							 not((solve(T), T\=S, writeln("Failed Part 2: Does not eliminate:"), print_table(T))),
							 writeln("Found 1 solutions").

						 print_table([]).
					 print_table([H|T]) :- atom(H), format("~|~w~t~20+", H), print_table(T). 
				 print_table([H|T]) :- is_list(H), print_table(H), nl, print_table(T). 


			 % Show the time it takes to conform that there are no incorrect solutions
			 checktime :- time((not((solution(S), solve(T), T\=S)))).

