-module(mappred).
-export([map_search_pred/2]).


map_search_pred(Map,Pred)->
	map_search_pred1(maps:to_list(Map), Pred).

map_search_pred1([],_)->[];
map_search_pred1([{Key,Value}=H|T], Pred)->
	case Pred(Key,Value) of
		true->H;
		false->map_search_pred1(T,Pred)
	end.