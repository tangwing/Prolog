%1.8 --------------------------------
%genere(+L, +N, -M).
%L is a list
%N is a number
%M is a list whose length is N, and which is
%  built by list.(repeat if necessary)
genere(L,N,R):-
	genere_4(L,L,N,R).
genere_4(_,_,0,[]):-!.%note this use.
genere_4(L,[],N,R):-
	genere_4(L,L,N,R).
genere_4(O,[E|L],N,[E|R]):-
	N2 is N-1,
	genere_4(O,L,N2,R).


%Ex 1.13
%remove(E,L,R). remove all occurences of E in L
remove(_,[],[]).
remove(E,[E|L],R):-
	remove(E,L,R).%,!.%line *
remove(E,[A|L],[A|R]):-
	A \= E,%We can also use ! in line *,instead of this line.
	remove(E,L,R).
