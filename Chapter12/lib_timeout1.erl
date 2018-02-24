-module(lib_timeout1).
-export([]).

timeout()->
	receive
		{alarm, X} -> {alarm,X}
	after 0->
		receive
			Any -> Any
		end
	end.	