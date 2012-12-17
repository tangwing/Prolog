subset(L,[],L).
subset(L,L,[]).
subset([E|L],[E1|A],[E2|B]):-
	(   E1 =E,
	subset(L,A,[E2|B]));
	(   E2 =E,
	subset(L,[E1|A],B)).
