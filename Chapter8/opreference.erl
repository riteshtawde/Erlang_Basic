-module(opreference).
-export([call_func/1]).

call_func(L) -> lists:map(fun operations:square/1, L).