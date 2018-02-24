-module(attrs).
-export([fac/1]).
-modname("Factorial test").
-version(1.0).
-author([{first,"Ritesh"},{last,"Tawde"}]).

fac(1)->1;
fac(N)->N*fac(N-1).