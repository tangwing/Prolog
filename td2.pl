%This predicate represente the last element of the list
last(E,[E]):-!.
last(E, [_|L]):-
	last(E,L).
%extract E from list L.The last para is the result.
extract([],L,L):-!.
extract(E,[E|L],L).
extract(E,[E2|L], [E2|L2]):-
	extract(E,L,L2).
%Link all the lists in a list of list to one list.
append_list([[],L],L).
%append_list([[A],B], [A|B]).
append_list([L1,L2], L):-
	last(E,L1),
	extract(E,L1,L3),
	append_list([L3, [E|L2]], L).

myappend([],L,L).
myappend(L1, L2, L):-
	last(E,L1),
	extract(E,L1,L3),
	myappend(L3,[E|L2],L).
%	myappend(L1,[E],L3),
	%myappend(L3,L2,L).
