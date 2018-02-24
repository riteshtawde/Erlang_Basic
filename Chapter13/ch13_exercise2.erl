-module(ch13_exercise2).

-export([test/0, spawn_and_restart/3, my_spawn/0, on_exit/2]).
%comment
test()->
	receive
		Msg -> io:write(Msg),
		test()
	after
		5000->io:write("Process is still running"),
		test()
	end.

my_spawn()->
	Pid = ?MODULE:spawn_and_restart(?MODULE,test,[]),
	receive
		something->temp
	after
		20000->
			exit(Pid,kill)
	end.

spawn_and_restart(Module,Function,Args)->
	Pid = spawn(Module,Function,Args),
	Start = erlang:timestamp(),
	
	Handler = fun(Why)->
				TimeDiff = calculate_time(erlang:timestamp(), Start),
				io:format("Process with Pid ~p lasted ~p Died because ~p~n",[Pid,TimeDiff,Why])
		end,
	on_exit(Pid,Handler).

on_exit(Pid,Fun)->
	spawn(fun()->
		Ref = monitor(process, Pid),
		receive
				{'DOWN',Ref,process,Pid,Why}->
					Fun(Why)
		end
	end).

calculate_time(Current,Past)->
	{MegaC,SecC,_} = Current,
	{MegaP,SecP,_} = Past,
	(MegaC * 1000000 + SecC) - (MegaP * 1000000 + SecP).
