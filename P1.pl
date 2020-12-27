%Mathematical model
%concatenate(l1l2..ln,p1p2..pn)=
%   p1p2..pn, if n = 0
%   l1 + insert(l2..ln,p1p2..pn) otherwise
concatenate([], L , L).
concatenate([H|T], L , [H|R]):- concatenate(T, L, R).

%Mathematical model:
%substitute(l1l2..ln, e, p1p2..pn)=
% [], if n = 0
% substitute(inserare(p1p2..pn,l2l3..ln),e,p1p2..pn), if l1 = e
% l1 + substitute(l2..ln , e , p1p2..pn) , otherwise
substitute([],_,_,[]).
substitute([H|T], E, L, R):- H=:=E,
    concatenate(L,T,R1),
    substitute(R1,E,L,R).
substitute([H|T],E,L,[H|R]):- H=\=E,
    substitute(T,E,L,R).



%Mathematical model:
% removeNthElem(l1l2..ln,k) =
%  [], if n=0
%  l2..ln, if k=1
%  l1 + remove(l2..ln, k-1), otherwise
removeNthElem([],_,[]).
removeNthElem([_|T],1,T).
removeNthElem([H|T], K, [H|R]):-
    K1 is K-1,
    removeNthElem(T,K1,R).

