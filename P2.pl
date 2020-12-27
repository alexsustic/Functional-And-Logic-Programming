% a) Determine the product of a number represented as digits in a list
% to a given digit.
% Eg.: [1 9 3 5 9 9] * 2 => [3 8 7 1 9 8]

%Mathematical model
% addToEnd(l1l2..ln, e) =
%   [e], if n == 0
%    l1 + addToEnd(l2l3..ln,e)

addToEnd([],E,[E]).
addToEnd([H|T],E,[H|R]):-
    addToEnd(T,E,R).


%Mathematical model
% invert(l1l2..ln) =
%  [], if n == 0
%   addToEnd(invert(l2...ln), l1), otherwise

invert([],[]).
invert([H|T],R):-
    invert(T,R1),
    addToEnd(R1,H,R).

%Mathematical model
% product(l1l2..ln,k,c)=
%  [c], if n == 0 and c != 0
%  [ ], if n == 0 and c == 0
%  (l1*k+c)%10 + product(l2l3..ln,k,(l1*k+c)/10), otherwise

product([],_,0,[]).
product([],_,C,[C]):- C=\=0.
product([H|T],K,C,[R1|R]):-
    R1 is (H*K+C) mod 10,
    C1 is (H*K+C-R1)/10,
    product(T,K,C1,R).



productFinal(L,K,R):-
    invert(L,L1),
    product(L1,K,0,L2),
    invert(L2,R).


% b) . For a heterogeneous list, formed from integer numbers and list of
% numbers, write a predicate to replace every sublist with the position
% of the maximum elemen from that sublist. [1, [2, 3], [4, 1, 4], 3, 6,
% [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] => [1, [2], [1, 3], 3, 6, [2], 5,
% [1, 2, 3], 7]


%Mathematical model
%maximumNumber(a,b)=
% a, if a >= b
% b, if a < b

maximumNumber(A,B,A):- A>=B.
maximumNumber(A,B,B):- A<B.


%Mathematical model
%maximumNumberList(l1l2..ln)=
% l1, if n = 1
% maximumNumber(l1,maximumNumberList(l2..ln)), otherwise

maximumNumberList([H],H).
maximumNumberList([H|T],R):-
    maximumNumberList(T,R1),
    maximumNumber(H,R1,R).


%Mathematical model
%getPositionElem(l1l2..ln,e,pos) =
% [] , if n==0
% pos + getPositionElem(l2..ln,e,pos+1), if e == l1
% getPositionElem(l2...ln,e,pos+1), if e!=l1


getPositionElem([],_,_,[]).
getPositionElem([H|T], E, P, R):- H=\=E,
    P1 is P+1,
    getPositionElem(T,E,P1,R).
getPositionElem([H|T],E,P,[P|R]):- H=:=E,
       P1 is P+1,
       getPositionElem(T,E,P1,R).



%Mathematical model:
%replaceHeteroList(l1l2..ln) =
%  [], n = 0
%  l1 + replaceHeteroList(l2..ln), if is_list(l1) = False
%  getPositionElem(l1,maximumNumberList(l1),1) +replaceHeteroList(l2...ln) , otherwise

replaceHeteroList([],[]).
replaceHeteroList([H|T],[R1|R]) :- is_list(H),
   maximumNumberList(H,K),
   getPositionElem(H,K,1,R1),
   replaceHeteroList(T,R).
replaceHeteroList([H|T],[H|R]):- not(is_list(H)),
    replaceHeteroList(T,R).







