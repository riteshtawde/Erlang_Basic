%% perm generator
-module(anagrams).
-export([perm/1]).

perm([]) -> [[]];
perm(L) -> [[H|T] || H<-L, T<-perm(L--[H])].