-module(debugmacro).
-export([loop/1]).

-ifdef(debug_flag).
-define(DEBUG(X), io:format("Debug ~p : ~p ~p ~n",[?MODULE,?LINE,X])).
-else.
-define(DEBUG(X), void).
-endif.

loop(0)->done;
loop(N)->
	?DEBUG(N),
	loop(N-1).