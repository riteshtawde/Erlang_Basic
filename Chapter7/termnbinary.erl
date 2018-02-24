-module(termnbinary).
-export([term_to_packet/1]).

term_to_packet(Term) ->
	BinaryTerm = term_to_binary(Term),
	Length = byte_size(BinaryTerm),
	<<Length:32/integer,BinaryTerm/binary>>.