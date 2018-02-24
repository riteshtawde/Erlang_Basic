-module(register_timer).
-export([start/2, stop/0]).

start(Time, Fun)->
	register(clock, spawn(fun()->timer(Time, Fun) end)).

stop() -> clock ! en.

timer(Time, Fun)->
	receive
		en->void
	after Time->
		Fun(),
		timer(Time, Fun)
	end.