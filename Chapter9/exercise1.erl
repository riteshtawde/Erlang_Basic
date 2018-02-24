-module(exercise1).
-export([print/2]).
-spec print(X::boolean(), Y::integer())->integer().
print(X,Y) when is_boolean(X)->
	X+Y.
