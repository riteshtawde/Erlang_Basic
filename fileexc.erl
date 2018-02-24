-module(fileexc).
-export([read_file/1]).

read_file(File)->
	read_from_file(File).
	
readlines(Device,Acc)->
	case io:get_line(Device,"") of
		eof -> file:close(Device), Acc;
		Line -> readlines(Device,Acc ++ [Line])
	end.

read_from_file(File)->
	case file:open(File, [read]) of
		{ok, Device} -> readlines(Device, []);
		{error, _Device} -> {error, erlang:get_stacktrace()}
	end.

