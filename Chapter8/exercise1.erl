-module(exercise1).
-export([count/0]).

count()->
	Funcs = dict:module_info(exports),
	Length = length(Funcs),
	io:format("Length : ~w : ",[Length]).