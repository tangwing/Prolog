%Here are some sorting algos

%Ex 1 Quick sort
%

%Ex 2 Merge sort
%
split(L2,0,_,L2):-!.
split([E|L],N,[E|L1],L2):-
      N2 is N-1,
      split(L,N2,L1,L2).
merge([E1|L1],[E2|L2], [E|L]):-
    (E1 =< E2
        ->
     (E is E1),merge(L1,[E2|L2], L)
     ;
     (E is E2),merge([E1|L1],L2, L)).
     
merge_sort([E], [E]):-!.
merge_sort(L, LSorted):-
    length(L,N),
    N2 is N/2,
    split(L, N2, L1, L2),
    merge_sort(L1, L1Sorted),
    merge_sort(L2, L2Sorted),
    merge(L1Sorted,L2Sorted,LSorted).

%Ex 3 Sort by insertion

%Ex 4 Sort by selection
%

%Ex 5 Bubble sort   big>small
bubble_sort([E],[E]):-!.
bubble_sort([X1|L1],[X1|L2]):-
        bubble(X2,L2),
        X2 < X1,
        bubble_sort(L1,L2).

bubble([E],[E]).
