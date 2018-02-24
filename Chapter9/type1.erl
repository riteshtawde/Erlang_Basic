-module(type1).
-export([f1/1,f2/1,f3/1,f4/1]).

f1({Hour,Min,Sec})->
	(Hour+Min*60)*60+Sec.
f2({Hour,Min,Sec}) when is_integer(Hour)->
	(Hour+Min*60)*60+Sec.
f3({Hour,Min,Sec})->
	print(Hour,Min,Sec),
	(Hour+Min*60)*60+Sec.
f4({Hour,Min,Sec}) when is_float(Hour)->
	print(Hour,Min,Sec),
	(Hour+Min*60)*60+Sec.

print(Hour,Min,Sec)->
	Str = integer_to_list(Hour) ++ ":" ++ integer_to_list(Min) ++ ":" ++ integer_to_list(Sec),
	io:format("~p : ",[Str]).