% 9. Generate all permutation of N (N - given) respecting the property:
% for every 2<=i<=n exists an 1<=j<=i, so |v(i)-v(j)|=1.

% Mathematical model:
%  insetion(l1...ln, e) =
%      [e],if n = 0
%       e + l1...ln, n >= 1
%       l1 + insertion(l2...ln, e), otherwise
insertion([], E, [E]).
insertion([H|T], E, [E,H|T]).
insertion([H|T], E, [H|R]) :-
         insertion(T, E, R).




% Mathematical model:
%  permutations(l1...ln) =
%	[], n = 0
%	insertion(permutations(l2...ln), l1), otherwise
permutations([], []).
permutations([H|T], R) :-
    permutations(T, RP),
    insertion(RP, H, R).



% Mathematical model:
%  createList(n) =
%	[], n = 0
%	n + createList(n - 1), n > 0
createList(0, []).
createList(N, [N|R]) :-
    N > 0,
    NN is N - 1,
    createList(NN, R).




checkPerm([], _).
checkPerm([H|T], L) :-
    check(L, H),
    checkPerm(T, [H|L]).




% Mathematical model:
%  difference(a, b) =
%	a - b, if a > b
%	b - a, if a < b
difference(A, B, R) :-
    A > B,
    R is A - B.
difference(A, B, R) :-
    A =< B,
    R is B - A.




% Mathematical model:
%  check(l1...ln, e) =
%	true, if n = 0
%	true, if diff(l1, e) = 1
%	check(l2...ln, e), if n > 0
%	false, otherwise
check([], _).
check([H|_], X) :-
    difference(X, H, R),
    R >= 1, !.
check([_|T], X) :-
    check(T, X).





onesolution(L, R) :-
    permutations(L, R),
    checkPerm(R, []).


allsolutions(N, R) :-
    createList(N, RL),
    findall(RP, onesolution(RL, RP), R).



















