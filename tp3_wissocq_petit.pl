/* PETIT Antoine & WISSOCQ Sarah */
:- use_module(library(clpfd)).

grille([[_,_,_,_,_,_,_,_,_],
	[_,_,_,_,_,3,_,8,5],
	[_,_,1,_,2,_,_,_,_],
	[_,_,_,5,_,7,_,_,_],
	[_,_,4,_,_,_,1,_,_],
	[_,9,_,_,_,_,_,_,_],
	[5,_,_,_,_,_,_,7,3],
	[_,_,2,_,1,_,_,_,_],
	[_,_,_,_,4,_,_,_,9]]). 

/*Question 1:*/
printline([]) :- write('|'), !.
printline([X|XS]) :- integer(X), !, write('|'), write(X), printline(XS).
printline([_|XS]):- write('|'), write(' '), printline(XS).

/*Question 2:*/
printsudo([]).
printsudo([X|XS]) :- printline(X), write_ln(''), printsudo(XS).

/*Question 3:*/
bonnelongueur([],0).
bonnelongueur([_|XS],Y) :- bonnelongueur(XS,Y2), Y is (Y2+1) .

/*Question 4:*/
bonnetaille([X|[]],Y):- bonnelongueur(X,Y),!.
bonnetaille([X|XS],Y) :- bonnelongueur(X,Y),! , bonnetaille(XS,Y).

/*Question 5:*/
verifier([]).
verifier(X) :- X ins 1..9.

verifie([]).
verifie([X|XS]) :- verifier(X), all_different(X), verifie(XS).

/*Question 6:*/
eclate([],_,[]).
eclate([X|XS],[Y|YS],[[X|Y]|L2]) :- eclate(XS,YS,L2).

/*Question 7:*/
transp([],[]):-!.
transp([[X|XS]],[[X]|L]) :- transp([XS],L),!.
transp([X|XS],L) :- transp(XS, L2),eclate(X,L2,L).

/*Question 8:*/
decoupe([],[],[],[]).
decoupe([X1,Y1,Z1|XS],[X2,Y2,Z2|YS],[X3,Y3,Z3|ZS],[[X1,Y1,Z1,X2,Y2,Z2,X3,Y3,Z3]|L]):- decoupe(XS,YS,ZS,L).

/*Question 9:*/
carres([],[]).
carres([X,Y,Z|XS],[L2|L]) :- decoupe(X,Y,Z,L2), carres(XS,L).

/*Question 10:*/
solution(S):-  bonnetaille(S,9),verifie(CS),bonnetaille(TS,9), verifie(S),verifie(TS),transp(S,TS), carres(S,CS).