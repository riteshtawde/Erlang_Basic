-module(test3fact).
-export([fact/0]).

fact() -> factorial(-5).

factorial(0) -> 1;
factorial(N) -> N * factorial(N-1).