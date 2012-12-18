%Here are some sorting algos

%Ex 1 Quick sort
%

%Ex 2 Merge sort
%

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
bubble([]
