-module(multiDieTogether).
-export([start/1]).

start(Fs)->
	spawn(fun()->
		[spawn_link(F) || F<-Fs],
		receive
			after
				infinity->true
		end
	end).