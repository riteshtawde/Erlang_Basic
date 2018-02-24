-module(oddandeven).
-export([oddeven/1, oddeveni1/1, oddeveni2/3]).

oddeven(L)->
	Even = [X || X<-L,X rem 2 =:=0],
	Odd = [X || X<-L,X rem 2 =/=0],
	{Odd,Even}.

%%improvized to traverse the entire list once for each item
oddeveni1(L)->
	oddeveni2(L,[],[]).

oddeveni2([H|T],Odds,Evens)->
	case (H rem 2) of
		1 -> oddeveni2(T,[H|Odds],Evens);
		0 -> oddeveni2(T,Odds,[H|Evens])
	end;

oddeveni2([],Odds,Evens)->
	{lists:reverse(Odds),lists:reverse(Evens)}.