-module(area_server0).
-export([loop/0]).

loop()->
	receive
		{rectangle, Width, Height}->
			io:format("Area of a retangle is ~p",[Width*Height]),
			loop();
		{square, Side}->
			io:format("Area of a square is ~p",[Side*Side]),
			loop()
	end.	