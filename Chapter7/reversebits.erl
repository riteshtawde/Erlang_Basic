-module(reversebits).
-export([reverse/1]).

reverse(Binary)->
	reverse(Binary,<<>>).
	
reverse(<<>>, Acc) -> Acc;
reverse(<<A:1/binary,Rem/binary>>, Acc)->
	reverse(Rem, <<A:1/binary,Acc/binary>>).