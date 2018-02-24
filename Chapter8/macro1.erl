-module(macro1).
-define(mac(X,Y), {"Test",X,Y}).
-export([foo/1]).

foo(A)->
	?mac(A+10,b).	