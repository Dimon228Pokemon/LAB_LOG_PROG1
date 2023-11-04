len([],0).
len([_|Y],N):-len(Y,N1),N is N1 + 1.
member(A, [A|_]).
member(A, [_|Z]) :- member(A, Z).
append([], X, X).
append([A|X], Y, [A|Z]) :- append(X,Y,Z).
remove(X,[X|T],T).
remove(X,[Y|T],[Y|T1]):-remove(X,T,T1).
permute([],[]).
permute(L,[X|T]):-remove(X,L,R),permute(R,T).

truncated_list1(List,Res,N):-append(Res,_,List),length(Res,N),!.

truncated_list2(_,[],0).
truncated_list2(_, 0, []).
truncated_list2([X|Xs], N, [X|Ys]) :-
    N > 0,
    N1 is N - 1,
    truncated_list2(Xs, N1, Ys),!.




min_position1(List, Position) :-
    min_list(List, Min),
    nth1(Position, List, Min).



min_position2([X|Xs], Position) :-
    min_position2(Xs, X, 1, Position).

min_position2([], _, Position, Position).

min_position2([X|Xs], Min, CurrentPos, Position) :-
    X < Min,
    NewCurrentPos is CurrentPos + 1,
    min_position2(Xs, X, NewCurrentPos, Position).

min_position2([_|Xs], Min, CurrentPos, Position) :-
    NewCurrentPos is CurrentPos + 1,
    min_position2(Xs, Min, NewCurrentPos, Position).





min_pos_comb1(List,Result):-
        min_position1(List,Position),truncated_list2(List,Position,Result).


min_pos_comb2([], []).

min_pos_comb2([X], [X]).

min_pos_comb2([X, Y | Tail], Result) :-
    X =< Y, 
    min_pos_comb2([X | Tail], Result).

min_pos_comb2([X, Y | Tail], Result) :-
    X > Y, 
    min_pos_comb2([Y | Tail], Result).

