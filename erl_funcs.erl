-module(erl_funcs).
-import(lists, [reverse/1]).
-export([partition_by/2, drop/2, take/2]).


%% partition_by function %%

partition_by(F, [H | T]) ->
  partition_by(F, F(H), T, [H]).


partition_by(F, HV, [H | T] = L, Acc) ->
  case F(H) of
    HV -> partition_by(F, HV, T, [H | Acc]);
    _  -> [lists:reverse(Acc), L]
  end;


partition_by(_, _, [ ], Acc) -> [lists:reverse(Acc), [ ]]. 

%%


%% drop function %%

step(_, [ ]) ->
  [ ];


step(N, C) ->
    [_ | T] = C,
    case (N > 0) and (length(C) > 0) of
      true ->
        step(N - 1, T);
      false ->
        C
    end.


drop(_, [ ]) ->
  [ ];


drop(Number, Collection) ->
  step(Number, Collection).


%%

%drop_last(Collection) ->
%  drop_last(1, Collection);


%drop_last(Number, Collection).


%% take function %%

take(Number, [H | T]) when Number > 0 ->
  [H] ++ take(Number - 1, T);


take(0, _) ->
  [ ].

%%

%interleave(Collection_1, Collection_2).


%interpose(Separator, Collection).


%repeat(X).


%repeat(Number, X).


%repeatedly(F).


%repeatedly(Number, F).