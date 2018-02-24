-module(shop2).
-export([total/1]).
%%-import(lists,[map/2,sum/1]).
%%-import(shop1, [cost/1]).

sum([H|T]) -> H+sum(T);
sum([]) -> 0.

map(_,[])->[];
map(F,[H|T])->[F(H)|map(F,T)].

total(L) -> sum(map(fun({What,N})-> shop1:cost(What) * N end, L)).