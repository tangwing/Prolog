%TD 21/11
%Penser que l'on manipule une liste chain¨¦e

%appartient(E ,L)
%E est un element de la liste L
%§ C'est la condition d'arrête
appartient(E, [E|_]).
%§ C'est la règle qui permet de faire l'itération
%  Ici, Prolog essaie de trouver le cas
%  correspondant la condition d'arrête, en suprimant
%  pas à pas, l'élément au début de la liste, puisque
%  on a [_] au début, qui veut dire que cet élément n'est
%  pas nécessaire de considérer.
appartient(E, [_|L]):-
	appartient(E, L).

% pourquoi ci-dessous est faux?
% en fait '_' ici signifie le premier élément
% de la liste, et E est la queue de la liste,
% qui peut être une sous liste.
%appartientFaux(E, [_|E]).
%appartient(E, [L|_]):-
	%appartient(E, L).

%premier(E,L)
%E est le 1er element de la liste L
permier(E, [E|_]).

%queue(E,L)
%E est la queue de la liste L
%cad la liste L moins son 1er element
queue(E, [_|E]).

%dernier(E,L)
%E est le dernier element de L
dernier(E,[E]):-!.
dernier(E,[_|L]) :-
	dernier(E,L).

%concate(L1, L2, L3)
%L1+L2=L3
concate([], T, T).
concate([E1|Q1],L2,[E1|Q2]):-
	concate(Q1,L2,Q2).

%extraire(E,L,R)
%R=L-E
extraire(D,[D|E],E).%Pourquoi avec ça on ne
%peut pas obtenir extraire([a], [a,b,c],X)?
%extraire(E,[L|C],[D|C]):-
extraire(E,[C|L],[C|D]):-
	extraire(E,L,D).

%concateliste(LL,LR).
%LL est une liste de listes on concatène
%les elements de LL le resultat est LR.
concateliste([[A],[B]],[A|B]).
concateliste([[A|C],[B]],LR):-
	concateliste([[A],[C|B]],LR).


sum_to(N,1):- (N<1;N=1),!.%Perfect
%sum_to(N,1):- (N<1;N=1).%Infinity
%sum_to(1,1):-!.%Can't handle N<1
%sum_to(1,1).%ERROR:Out of local stack
sum_to(N,Res):-
	N1 is N-1,
	sum_to(N1,Res1),
	Res is Res1+N.

%-----------------------------------------------------------------------
%TD2-1
%renverser(L1,L2)
%L2 est la lishte "renversée" de L1
%Version1, déplacer le 1er au dernier
renverser1([],[]):-!.
renverser1([E|Q], L2):-
	renverser1(Q, L1),
	append(L1, [E], L2).

%Version2, déplacer le dernier au permier
renverser2([],[]):-!.
renverser2(L1, [E|Q]):-
%	dernier(E, L1),
	append(X, [E], L1),
	renverser2(X, Q).

%Complexité:
 %append(Lconnu, X, Y) -> colle, O(n)
 %append( X, Y, Lconnu) -> ciseaux, O(n)
 %renverser1/2 = O(n²).

%Version3
%Comlexité: ça me semble pas mal quand on veut
%savoir 'true' ou 'false', mais pas dans autres cas...
renverser3([], []):-!.
renverser3([_|Q], L2):-
	dernier(E2, L2),
	extraire(E2, L2, Q2),
	renverser3(Q, Q2).

%Version4
renverser4(L, R):-
	renverser43(L, [], R).%[] est comme une var en C ou
			      %on met le résultat.
renverser43([], L, L).%Fin
renverser43([A|L], R, S):-%Boucle
	renverser43(L, [A|R], S).
%En C:
%S = 0
%for(i in L) s+=i
%resultat <- S

%-------------------------------------------------------------------
%un autre ex
%somme(L, R)
%
somme(L,R):-
	somme_3(L, 0, R).
somme_3([], S, S).%Le 3ème arg est seulement pour
                 %récupérer le resultat.
somme_3([A|L], S, R):-
	S1 is S+A,
	somme_3(L, S1, R).


%-----------------------------------------------------------------------
%Faire le somme synbolique
%Version 1, pas bonne
%somsomsomsomme_synbo([a,b,c],X).
%X = [a, +, b, +, c].
somme_synbo([E|L],R):-
	somme_synbo_3(L, [E], R).
somme_synbo_3([], S, S).
somme_synbo_3([A|L], S, R):-
	concate(S, [+],S1),
	concate(S1, [A], S2),
	somme_synbo_3(L, S2, R).


%Version 3, marche bien
somme_synbo2([E|L],R):-
	somme_synbo2_3(L, E, R).
somme_synbo2_3([], S, S).
somme_synbo2_3([A|L], S, R):-
	somme_synbo2_3(L, S+A, R).

%Version 2, bonne, mais la consommation de mémoire..
somme_synbo3([E], E):-!.
somme_synbo3([E|[E2|L]],R):-
	somme_synbo3([E+E2|L], R).


%--------------------------------------------------------------
%conterbon(L, V, R).
%L est une liste de nombres, connus, entrée.
%V est un nombre, entrée.
%R est une somme d'élément L, L=V, sortie.
%conterbon([3,17,9,12,7], 33, Z) -> Z= 17+9+7
conterbon([E|_], E, E).
conterbon([E|L1],V, E+R):-
	E < V,
	V2 is V-E,
	conterbon(L1,V2,R).

conterbon([_|L1],V, R):-%if _ est E, c'est pas comlet, car on jete ausi une valeur meme s'il est petit
	%E > V,
	conterbon(L1,V,R).








