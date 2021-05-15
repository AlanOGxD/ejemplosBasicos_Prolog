
mujer(ana).
mujer(maria).
mujer(luisa).
mujer(fabila).
mujer(esther).
mujer(rocio).
mujer(diana).
mujer(vanessa).
mujer(martha).
mujer(olivia).

:- discontiguous hombre/1.
hombre(hugo). adulto(hugo).
hombre(paco).
hombre(luis).
hombre(mario).
hombre(marco).
:- discontiguous hombre/1.
hombre(juan). ninio(juan).
hombre(pedro).
hombre(raul).
hombre(gabriel).
hombre(sergio).

madre(ana, sergio).
madre(ana, maria).
madre(ana, luis).
madre(martha, diana).
madre(olivia, raul).

padre(raul, rocio).
padre(marco, hugo).
padre(pedro, gabriel).
padre(sergio, paco).
padre(hugo, sergio).

%ABUELOS
abuelos(X, Z) :- padre(X, Y) , (padre(Y,Z) ; madre(Y,Z)), hombre(X). %abuelas(X, Z).% 

%ABUELAS
abuelas(X, Z) :- madre(X, Y) , (padre(Y,Z) ; madre(Y,Z)), mujer(X). %abuelas(X, Z).%

%PERSONA
persona(Y) :- mujer(Y) ; hombre(Y). %persona(sergio). o cualquier otro nombre %

%NIETO
nieto(Z) :- (padre(_, Y);madre(_, Y)) , (padre(Y,Z) ; madre(Y,Z)), hombre(Z). %nieto(Z).% 

%NIETA
nieta(Z) :- (padre(_, Y);madre(_, Y)) , (padre(Y,Z) ; madre(Y,Z)), mujer(Z). %nieta(Z).% 

%HERMANOS
hermanos(X, Y) :- (padre(Z, X), padre(Z, Y));(madre(Z, X), madre(Z, Y)), hombre(X), hombre(Y).% hermanos(luis, sergio). //debe retornar un true%

%HERMANAS
hermanas(X, Y) :- (padre(Z, X), padre(Z, Y));(madre(Z, X), madre(Z, Y)), mujer(X), mujer(Y).% hermanas(maria, rocio). //debe retornar un false debido a que no hay dos hermanas%

%PAREJAS
esposos(X, Y) :- (padre(X, Z), madre(Y, Z)), hombre(X), mujer(Y). %esposos(X, Y).%