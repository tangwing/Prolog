
subset_repeat([],[]).
subset_repeat([E|L],[E|R]):-
	subset_repeat(L,R).
subset_repeat([_|L],R):-
	subset_repeat(L,R).


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

%Another version, the list is built by elements
%in the original list.
genere2(_,0,[]):-!.
genere2(L,N,[E|R]):-
	%N >=1, Activate here or keep the cut!!!!
	select(E,L,_),
	N2 is N-1,
	genere2(L,N2,R).


%Ex 1.13
%remove(E,L,R). remove all occurences of E in L
remove(_,[],[]).
remove(E,[E|L],R):-
	remove(E,L,R).%,!.%line *
remove(E,[A|L],[A|R]):-
	A \= E,%We can also use ! in line *,instead of this line.
	remove(E,L,R).

%Ex 1.22 search the least/biggest number, its indice and
%	 the rest of the list.
petit([E],E,1,[]).
petit([E|L1],E,1,L1) :-
	petit(L1,E2,_,_),
	E =< E2.
petit([E|L1],E2,I,[E|L2]) :-
	petit(L1,E2,I2,L2),
	E > E2,
	I is I2+1.
%Ex 1.24
%forall/1, test a property p/1 for all elements
%For exemple, p/1 means arg is a even number


%Ex 1.25
%exist/1
%


%Ex 3.1
%Equality of two sets
seteq([],[]).
seteq([E|S],S2):-
	select(E,S2,S3),
	seteq(S,S3).
