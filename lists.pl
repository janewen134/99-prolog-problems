% 1.01 find the last element of a list
my_last(X,[X]).
my_last(X, [_|List]):-
    my_last(X,List).
%% List should be capticalized!!!!!!

% 1.02 find the last but one element of a list. (倒数第二个)
last_but_one(X, [X,_]). %%%这里需要cut吗？？？
last_but_one(X, [_|T]) :-
    last_but_one(X, T).

% 1.03 find the k'th elem of a list.
% element_at(H, [H|_], 1). % if the first elem is requested.
% element_at(X, [_|T], N) :- % if not the first elem is requested.
%     element_at(X, T, N, 2).

% element_at(H, [H|_], N, N).
% element_at(X, [_|T], N, A) :-
%     A < N,
%     M is A + 1,
%     element_at(X,T,N,M).

element_at(X, [X|_], 1).
element_at(X, [_|T], N) :-
    element_at(X,T,M),
    N is (M+1).

% 1.04 find the number of elems of a list
elem_num([],0).
% elem_num([_], 1). %如果保留这行，就会打俩遍结果
% elem_num([_,_], 2). %如果又保留这行，就会打出仨结果
elem_num([_|T], N) :-
    elem_num(T,M),
    N is M+1.

% 1.05 reverse a list
% my_reverse([],Z,Z).
% my_reverse([H|T],Z,Acc) :- 
%     my_reverse(T,Z,[H|Acc]).没

%这个方法都不好使 会进入无限循环
% my_reverse([],[]) :- !.
% my_reverse([H|T],Z) :- append(Y,[H],Z), reverse(T,Y). 


my_reverse(L1,L2) :- my_rev(L1,L2,[]).

my_rev([],L2,L2) :- !.
my_rev([X|Xs],L2,Acc) :- my_rev(Xs,L2,[X|Acc]).