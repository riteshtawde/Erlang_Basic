-module(area_server1).
-export([rpc/2,loop/0]).

rpc(Pid, Request)->
	Pid ! {self(), Request},
	receive
		Response -> Response
	end.

loop()->
	receive
		{From, {rectangle, Width, Height}}->
			From ! {self(), Width * Height},
			loop();
		{From, {square, Side}}->
			From ! {self(), Side * Side},
			loop();
		{From, Other}->
			From ! {self(), error, Other},
			loop()
	end.