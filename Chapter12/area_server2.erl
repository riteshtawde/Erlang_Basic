-module(area_server2).
-export([start/0,area/2,loop/0]).

start() -> spawn(area_server2, loop, []).

area(Pid, What)-> rpc(Pid, What).

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