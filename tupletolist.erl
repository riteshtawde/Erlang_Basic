-module(tupletolist).
-export([tup2list/1]).

tup2list(T)->
	tup2list(T,1,tuple_size(T)).

tup2list(T,Start,Size) when Start =< Size->
	[element(Start,T) | tup2list(T,Start+1,Size)];
tup2list(_T,_Start,_Size)->[].