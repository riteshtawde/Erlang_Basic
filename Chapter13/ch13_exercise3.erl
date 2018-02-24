-module(ch13_exercise3).
-export([test/0, spawn_and_restart/3, my_spawn/0]).
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
	Time=20000
	Pid = ?MODULE:spawn_and_restart(?MODULE,test,[],Time),
	receive
		something->temp
	after
		1000->
			exit(Pid,kill)
	end.

spawn_and_restart(Module,Function,Args,Time)->
	Pid = spawn(Module,Function,Args),
	Start = erlang:timestamp(),
	
	spawn(fun()->
			Ref = monitor(process,Pid),
			receive
				{'DOWN',Ref,process,Pid,Why}->
					TimeDiff = calculate_time(erlang:timestamp(), Start),
					io:format("Process with Pid ~p lasted ~p Died because ~p~n",[Pid,TimeDiff,Why]),
					?MODULE:spawn_and_restart(Module,Function,Args),
					exit(self(),kill)
			after
				Time->
					io:format("Process killed after ~p seconds",[Time])
					exit(Pid,kill)
			end
		end),Pid.

calculate_time(Current,Past)->
	{MegaC,SecC,_} = Current,
	{MegaP,SecP,_} = Past,
	(MegaC * 1000000 + SecC) - (MegaP * 1000000 + SecP).
