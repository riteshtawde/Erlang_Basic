-module(reverse_bytes).
-export([reverse/1]).

reverse(B) -> list_to_binary(lists:reverse(binary_to_list(B))).