



sameset([],[]).
sameset([E1|L1] ,L):-
	member(E1, L),
	extraire(E1,L, L2),
	sameset(L1, L2).

sudoku2(X):-
	intervalle(1,9,L),
	sameset(X,L).

sudoku(X):-
	intervalle(1,9,L),
	permute(L,L2),
	X = L2.

/*
answer( 3,  E12, 2,   E14, 5,   4,   E17, E18, 6,
	6,  4,   E23, E24, E25, E26, E27, 8,   3,
	E31,E32, E33, E34, 2,   E36, E37, 4,   E39,
	E41,E42, E43, E44, 3,   9,   8,   6,   E49,
	7,  3,   E53, 2,   E55, 8,   5,   E58, E59,
	E61,9,   E63, E64, E65, E66, E67, 2,   E69,
	E71,E72, E73, 3,   E75, E76, E77, 5,   E79,
	E81,E82, 3,   E84, E85, E86, E87, 1,   E89,
	E91,2,   4,   9,   1 ,  E96, 7,   3,   8 ).

	sudoku([ 3,1,2,E14,5,4,E17,E18,6]),
	sudoku([ 6,4,E23,E24,E25,E26,E27,8,3]),
	sudoku([ 6,4,E23,E34,2,E36,E37,4,E39]),
	sudoku([ E41,E42,E43,E44,3,9,8,6,E49]),
	sudoku([ 7,3,E53,2,E55,8,5,E58,E59]),
	sudoku([ E61,9,E63,E64,E65,E66,E67,2,E69]),
	sudoku([ E71,E72,E73,3,E75,E76,E77,5,E79]),
	sudoku([ E81,E82,3,E84,E85,E86,E87,1,E89]),
	sudoku([ E91,2,4,9,1,E96,4,3,8]),
	sudoku([ 3,6,E31,E41,7,E61,E71,E81,E91]),
	sudoku([ 1,4,E32,E42,3,9,E72,E82,2]),
	sudoku([ 2,E23,E33,E43,E53,E63,E73,3,4]),
	sudoku([ E14,E24,E34,E44,2,E64,3,E84,9]),
	sudoku([ 5,E25,2,3,E55,E65,E75,E85,1]),
	sudoku([ 4,E26,E36,9,8,E66,E76,E86,E96]),
	sudoku([ E17,E27,E37,8,5,E67,E77,E87,4]),
	sudoku([ E18,8,4,6,E58,2,5,1,3]),
	sudoku([ 6,3,E39,E49,E59,E69,E79,E89,8]),
	sudoku([3,1,2,6,4,E23,6,4,E23]),
	sudoku([E14,5,4,E24,E25,E26,E34,2,E36]),
	sudoku([E17,E18,6,E27,8,3,E37,4,E39]),
	sudoku([E41,E42,E43,7,3,E53,E61,9,E63]),
	sudoku([E44,3,9,2,E55,8,E64,E65,E66]),
	sudoku([8,6,E49,5,E58,E59,E67,2,E69]),
	sudoku([E71,E72,E73,E81,E82,3,E91,2,4]),
	sudoku([3,E75,E76,E84,E85,E86,9,1,E96]),
	sudoku([E77,5,E79,E87,1,E89,4,3,8]).
*/
answer(3,E12,E13,E14,E15,E16,E17,E18,E19,E21,E22,E23,E24,E25,E26,E27,E28,E29, E31,E32,E33,E34,E35,E36,E37,E38,E39, E41,E42,E43,E44,E45,E46,E47,E48,E49, E51,E52,E53,E54,E55,E56,E57,E58,E59, E61,E62,E63,E64,E65,E66,E67,E68,E69, E71,E72,E73,E74,E75,E76,E77,E78,E79, E81,E82,E83,E84,E85,E86,E87,E88,E89, E91,E92,E93,E94,E95,E96,E97,E98,E99):-
	%ligne
	sudoku([ E11,E12,E13,E14,E15,E16,E17,E18,E19]),
	sudoku([ E21,E22,E23,E24,E25,E26,E27,E28,E29]),
	sudoku([ E21,E22,E23,E34,E35,E36,E37,E38,E39]),

	sudoku([ E41,E42,E43,E44,E45,E46,E47,E48,E49]),
	sudoku([ E51,E52,E53,E54,E55,E56,E57,E58,E59]),
	sudoku([ E61,E62,E63,E64,E65,E66,E67,E68,E69]),

	sudoku([ E71,E72,E73,E74,E75,E76,E77,E78,E79]),
	sudoku([ E81,E82,E83,E84,E85,E86,E87,E88,E89]),
	sudoku([ E91,E92,E93,E94,E95,E96,E97,E98,E99]),
	%colone
	sudoku([ E11,E21,E31,E41,E51,E61,E71,E81,E91]),
	sudoku([ E12,E22,E32,E42,E52,E62,E72,E82,E92]),
	sudoku([ E13,E23,E33,E43,E53,E63,E73,E83,E93]),
	sudoku([ E14,E24,E34,E44,E54,E64,E74,E84,E94]),
	sudoku([ E15,E25,E35,E45,E55,E65,E75,E85,E95]),
	sudoku([ E16,E26,E36,E46,E56,E66,E76,E86,E96]),
	sudoku([ E17,E27,E37,E47,E57,E67,E77,E87,E97]),
	sudoku([ E18,E28,E38,E48,E58,E68,E78,E88,E98]),
	sudoku([ E19,E29,E39,E49,E59,E69,E79,E89,E99]),
	%case
	sudoku([E11,E12,E13,E21,E22,E23,E21,E22,E23]),
	sudoku([E14,E15,E16,E24,E25,E26,E34,E35,E36]),
	sudoku([E17,E18,E19,E27,E28,E29,E37,E38,E39]),
	sudoku([E41,E42,E43,E51,E52,E53,E61,E62,E63]),
	sudoku([E44,E45,E46,E54,E55,E56,E64,E65,E66]),
	sudoku([E47,E48,E49,E57,E58,E59,E67,E68,E69]),
	sudoku([E71,E72,E73,E81,E82,E83,E91,E92,E93]),
	sudoku([E74,E75,E76,E84,E85,E86,E94,E95,E96]),
	sudoku([E77,E78,E79,E87,E88,E89,E97,E98,E99]).
%sudoku(1,2,3,4,5,6,7,8,9,10).*/


intervalle(A,B,[]):-
	A>B.
intervalle(A,B,[A| L]):-
	A=<B,
	A1 is A+1,
	intervalle(A1,B,L).

permute([],[]).
permute(L, [A|P]):-
	select(A,L,R),
	permute(R,P).

extraire(D,[D|E],E).
extraire(E,[C|L],[C|D]):-
	extraire(E,L,D).
