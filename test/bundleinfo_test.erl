-module(bundleinfo_test).
-include_lib("eunit/include/eunit.hrl").

bundleinfo_test() ->
  bundleinfo:info(),
  ok.
