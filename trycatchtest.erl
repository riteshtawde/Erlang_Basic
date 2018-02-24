-module(trycatchtest).
-export([callexc/0, callexc1/0]).

callexc()->[ catchtest(N) || N <- [1,2,3,4,5,6,8,9]].
callexc1()->[{N, generate_exception(N)} || N<-[1,2,3,4,5]].

generate_exception(1)->someatom;
generate_exception(2)->throw(someatom);
generate_exception(3)->exit(someatom);
generate_exception(4)->{'EXIT',someatom};
generate_exception(5)->error(someatom).

catchtest(N)->
	try generate_exception(N) of
		Val -> {N, normal, Val}
	catch
		throw:X -> {N, caught, thrown, X};
		exit:X -> {N, caught, exited, X};
		error:X -> {N, caught, error, X}
	end.