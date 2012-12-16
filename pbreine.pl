%Problème des reines.
%Solution naïve, générer et tester.
solreine(N,L):-
	generer(N,L),
	tester(L).
generer(N,L):-
	intervalle(1,N,L1),
	permute(L1,L).

tester(L):-
	diagonale1(L,D1,D2),
	tous_differents(D1),
	tous_differents(D2).

diagonale1(L, D1, D2):-
	diagonale1_3(L,1,D1,D2).

diagonale1_3([E],N,[D1], [D2]):-
	D1 is E+N,
	D2 is E-N.
diagonale1_3([E|L],N,[D1|L1],[D2|L2]):-
	D1 is E+N,
	D2 is E-N,
	diagonale1_3(L, N+1, L1, L2).
tous_differents([]).
tous_differents([E|L]):-
	\+member(E,L),
	tous_differents(L).



%Solution "general backtracking"*
%Le résultat, les numéros sont inversés
%
solreine2(N,Sol):-
	intervalle(1,N,L),
	reine(0,[],[],[],L,Sol).
%reine(_,Lp,_,_,[],Lp) mieux
reine(_,Lp,_,_,[],Sol):-
	Sol = Lp.
reine(Np,Lp,Ld1,Ld2,Ln,Sol):-
	select(E, Ln, Ln1),
	E1 is E+Np,%E+combien n'est pas important.
	\+member(E1, Ld1),
	E2 is E-Np,
	\+member(E2, Ld2),
	append(Ld1, [E1], Ld1new),
	append(Ld2, [E2], Ld2new),
	append( Lp, [E], Lp1),
	Np1 is Np+1,
	reine(Np1,Lp1,Ld1new,Ld2new,Ln1,Sol).



%----------------------------------------------
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



