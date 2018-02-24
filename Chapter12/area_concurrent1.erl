-module(area_concurrent1).
-export([loop/0]).

loop()->
	receive
		{rectangle,Width,Height}->
			io:format("Area of rectangle : ~w~n",[Width*Height]),
			loop();
		{square,Side}->
			io:format("Area of sqaure : ~w~n",[Side*Side]),
			loop()
	end.