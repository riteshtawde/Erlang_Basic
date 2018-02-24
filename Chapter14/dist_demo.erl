-module(dist_demo).
-export([rpc/4, start/1]).

start(Node)->
	spawn(Node, fun()->loop() end).

loop()->
	receive
		{rpc,Pid,Mod,Fun,Arg}->
			Pid ! {self(), (catch apply(Mod,Fun,Arg))},
			loop()
	end.

rpc(Pid,Mod,Fun,Arg)->
	Pid ! {rpc, self(), Mod, Fun, Arg},
	receive
		{Pid, Response} -> Response
	end.