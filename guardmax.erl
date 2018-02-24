-module(guardmax).
-export([max/2, maxList/1]).

max(X,Y) when X>Y->X;
max(X,Y) when X=<Y->Y.

maxList([]) -> [];
maxList([H|T]) -> maxList(H,T).
maxList(X,[]) -> X;
maxList(X,[H|T]) when X>H -> maxList([X|T]);
maxList(_X,[H|T]) -> maxList(H,T).
