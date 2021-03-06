﻿%-----------------------------------------------------
%Ex1 append_list, a not expensive version
%-----------------------------------------------------

%Link all the lists in a list of list to one list.
%my first version, not good
append_list1([[],L],L).
append_list1([[A],B], [A|B]).
append_list1([L1,L2], L):-
	last(E,L1),
	extract(E,L1,L3),
	append_list1([L3, [E|L2]], L).
%2nd version, better, but only for a list of 2 lists.
append_list2([[],L],L).
append_list2([[E|L1],L2],[E|L]):-
	append_list2([L1,L2],L).

%3rd, worse memory consumption. Because the elements
%of A appear many times in append/3.
append_list3([L],L).
append_list3([A,B|LL], LS) :-
	append(A,B,C),
	append_list3([C|LL],LS).

%4th Best version
append_list4([L], L).
append_list4([L|LL], LS) :-
	append(L,LR,LS),%LS = [L|LR]
	append_list3(LL,LR).

%-----------------------------------------------------
%Ex2 reverse a list. reverse/2
%-----------------------------------------------------
%1st version. We put the first element of the
%    original list at the end of the final list.
%    use append.
reverse1([],[]).
reverse1([E|L1], L):-
	reverse1(L1,L2),
	append(L2,[E],L).

%A wrong version
reverseWrong([],[]).
reverseWrong([E|L1], L):-
	append(L2,E,L),%L2 and L are both unknown.
				   %Infinitive possibilities
	reverseWrong(L1,L2).

%2nd version. We put the last element of the
%    original list at the beginning of the final list.
%    use append.
reverse2_1([],[]).
reverse2_1(L1,[E|L3]):-
	last(L1,E),
	extract(E,L1,L2),
	reverse2_1(L2,L3).

reverse2_2([],[]):-!.
reverse2_2(L1, [E|L]):-
	append(L2,[E],L1),
	reverse2_2(L2,L).

%3nd linear comlexity
reverse3(L,R):-
	reverse3_3(L,[],R).

reverse3_3([],L,L).
reverse3_3([E|L1],L2,R):-
	reverse3_3(L1,[E|L2],R).

%-----------------------------------------------------
%Ex3 permute/2. return the n! permutations
%    of the first argument, a list.
%-----------------------------------------------------
permute1([],[]):-!.
permute1(L1,[E|L2]):-
	select(E,L1,L11),
	permute1(L11,L2).

%-----------------------------------------------------
%EX4 ??????????????????????????
%sublist/2     ex:sublist([a,b,c],[a,c]).false.
%				  should be continuous
%listextract/2 ex:listextract([a,b,c],[a,c]).true
%-----------------------------------------------------
%sublist([],[]).
sublist(L,[E|R]):-
	sublist_head(L,[E|R]);
	sublist_head(L,R).
%sublist_head([E|L1],[E|L2]):-
%	true;
%	sublist_head(L1,L2).

%sublist_head([],_).
sublist_head([E],[E]).
sublist_head([E],[E|_]).
sublist_head([E|L1],[E|L2]):-
	sublist_head(L1,L2).

sublist2(L,L).
%sublist2([E],[E|_]).
sublist2(L,R):-
	append(_,L,L2),
	append(L2,_,R),
	L \= [],
	L \= R.
%-----------------------------------------------------
%Ex5 numeric sum
%   sum/2
%-----------------------------------------------------
sum1([],0).
sum1([E|L],R):-
	sum1(L,R2),
	R is E+R2.

%2nd version, better
sum2([],0).
sum2(L,R):-
	sum2_3(L,0,R).
%This is an auxiliary predicate
sum2_3([],L,L):-!.
sum2_3([E|L],S,R):-
	S2 is S+E,
	sum2_3(L,S2,R).


%-----------------------------------------------------
%Ex6 symbolic sum
%-----------------------------------------------------
%1st a first version with '()'
%ssum1([a,b,n],X).
%X = a+ (b+n) ;
ssum1([A],A).
ssum1([A|L], A+S):-
	ssum1(L,S).

%2nd version, order inversed
ssum2([A],A).
ssum2([A|L], S+A):-
	ssum2(L,S).

%3rd version. Good. But too much memory consumed
ssum3([A],A).
ssum3([A,B|L],R):-
	ssum3([A+B|L],R).

%4th version. With accelorater
ssum4([E|L],R):-
	ssum4_3(L,E,R).
ssum4_3([],L,L).
ssum4_3([E|L],S,R):-
	S2 = S+E,%Don't use 'is' here!!!!!!!!!
	ssum4_3(L,S2,R).%We don't need to use var S2

%-----------------------------------------------------
%Ex7 select addends.
%selectadd(+L,+V,-R)
%R is a list of numbers selected from L, whose
%sum is V.
%-----------------------------------------------------
selectadd(_,0,[]).

selectadd([E|L],V,[E|R]):-
	E=<V,
	V2 is V-E,
	selectadd(L,V2,R).

selectadd([_|L],V,R):-
	selectadd(L,V,R).






%This predicate represente the last element of the list
%extract E from list L.The last para is the result.
extract([],L,L):-!.
extract(E,[E|L],L).
extract(E,[E2|L], [E2|L2]):-
	extract(E,L,L2).
