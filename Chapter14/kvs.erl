-module(kvs).
-export([store/2, load/1, start/0]).

start()->register(kvs, spawn(fun()-> loop() end)).

load(Key) -> rpc({load,Key}).

store(Key,Value) -> rpc({store,Key,Value}).

rpc(Q)->
	kvs ! {self(),Q},
	receive
		{kvs, Reply} -> Reply
	end.

loop()->
	receive
		{From, {store,Key,Value}}->
			put(Key,{ok,Value}),
			From ! {kvs, true},
			loop();
		{From, {load,Key}}->
			From ! {kvs, get(Key)},
			loop()
	end.
	