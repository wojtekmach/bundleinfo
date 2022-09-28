-module(bundleinfo).
-export([init/0, info/0]).
-nifs([info/0]).
-on_load(init/0).

init() ->
  erlang:load_nif("./priv/bundleinfo", 0).

info() ->
  erlang:nif_error("NIF library not loaded").
