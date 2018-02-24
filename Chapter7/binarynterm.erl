-module(binarynterm).
-export([packet_to_term/1]).

packet_to_term(Packet)->
	<<Length:32/integer, BinaryTerm:Length/binary>> = Packet,
	binary_to_term(BinaryTerm).