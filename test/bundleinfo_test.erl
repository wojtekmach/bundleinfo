-module(bundleinfo_test).
-include_lib("eunit/include/eunit.hrl").

bundleinfo_test() ->
  ?debugMsg(io_lib:format("~p", [bundleinfo:info()])),
  ok.
