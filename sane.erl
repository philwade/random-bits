-module(sane).

-export([pair/1, isSane/1]).

pair("()") ->
	true;
pair(")(") ->
	true;
pair(_) ->
	false.

isSane("") ->
	true;
isSane(Expression) ->
	case sane:pair([X || X <- [hd(Expression), lists:last(Expression)]]) of
		true -> isSane(string:substr(Expression, 2, string:len(Expression) - 2));
		false -> false
	end.
