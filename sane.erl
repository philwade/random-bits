%% A Module for determining if a string contains properly paired parentheses.
-module(sane).

-export([pair/1, isSane/1, startPair/1, bookendPair/1]).

pair("()") ->
	true;
pair(")(") ->
	true;
pair(_) ->
	false.

startPair("") ->
	true;
startPair(Exp) ->
	pair(string:substr(Exp, 1, 2)).

bookendPair("") ->
	true;
bookendPair(Exp) ->
	pair([X || X <- [hd(Exp), lists:last(Exp)]]).

isSane("") ->
	true;
isSane(Exp) ->
	case startPair(Exp) of
		true -> isSane(string:substr(Exp, 3, string:len(Exp) - 2));
		false ->
			case bookendPair(Exp) of
				true -> isSane(string:substr(Exp, 2, string:len(Exp) - 2));
				false -> false
			end
	end.
