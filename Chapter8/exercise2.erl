-module(exercise2).
-export([loaded_modules/0, mod_most_exports/0, all_functions_names/0, remove_func_arity/1, function_count/1,
		most_common_function/0, unambigious_function/0, all_info/0]).

loaded_modules()->
	Modules = code:all_loaded(),
	ModNames = lists:map(fun({Name,_Path}) -> Name end, Modules),
	ModNames.

mod_most_exports()->
	Modules = loaded_modules(),
	{ModName, _Exports} = lists:foldl(
							fun(NewModName, {ModName, Length}) -> 
								NewModLength = length(NewModName:module_info(exports)),
								case NewModLength >= Length of
									true -> {NewModName, NewModLength};
											%%io:format("~p ~w",[NewModName, NewModLength]);
									_ -> {ModName, Length}
										 %%io:format("~p ~w",[NewModName, NewModLength])
								end
							end, {none, 0}, Modules),
	io:format("~p ~w ~n",[ModName, length(ModName:module_info(exports))]),
	ModName.

all_functions_names()->
	Functions = loaded_modules(),
	AllExports = lists:map(fun(Mod) -> Mod:module_info(exports) end, Functions),
	lists:flatten(AllExports).

remove_func_arity(Functions)->
	remove_func_arity(Functions, []).

remove_func_arity([], Accum)->
	Accum;
remove_func_arity([{Name,_arity}|Functions], Accum)->
	remove_func_arity(Functions,[Name|Accum]).

function_count(Functions)->
	lists:foldl(fun(Item,Acc)->
					case proplists:lookup(Item, Acc) of
						none -> 
								Count = lists:filter(fun(Val) -> Item =:= Val end, Functions),
								[{Item,Count}|Acc];
						_ -> Acc
					end
				end,
				[], Functions).

most_common_function()->
	Functions = all_functions_names(),
	FuncArityRem = remove_func_arity(Functions),
	Count = function_count(FuncArityRem),
	{Name, _FuncCount} = lists:foldl(fun({Name,FuncCount},{MostCommonName, MostCommonCount}) ->
											 case FuncCount > MostCommonCount of
												 true -> {Name, FuncCount};
												 _ -> {MostCommonName, MostCommonCount}
											 end
									 end,
									 {none,0}, Count),
	Name.

unambigious_function()->
	Functions = all_functions_names(),
	FuncArityRem = remove_func_arity(Functions),
	Count = function_count(FuncArityRem),
	lists:filtermap(fun({X, FuncCount}) ->
						case FuncCount of
							1 -> {true, X};
							_ -> false
						end
					end,		
					Count).

all_info()->
	io:format("Loaded modules : ~p ~n",[loaded_modules()]),
	%%io:format("All function names :~p ~n ",[all_functions_names()]),
	io:format("Most exported modules :~p ~n ",[mod_most_exports()]),
	io:format("Most common function :~p ~n ",[most_common_function()]),
	io:format("Unambigious functions :~p ~n ",[unambigious_function()]).