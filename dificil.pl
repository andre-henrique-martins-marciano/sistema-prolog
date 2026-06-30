pai(abraham_simpson, homer_simpson).

pai(clancy_bouvier, marge_bouvier).
pai(clancy_bouvier, patty_bouvier).
pai(clancy_bouvier, selma_bouvier).

pai(homer_simpson, bart_simpson).
pai(homer_simpson, lisa_simpson).
pai(homer_simpson, maggie_simpson).

pai(bart_simpson, skippy_simpson).
pai(bart_simpson, jiff_simpson).

pai(milhouse_van_houten, zia_simpson).

mae(mona_simpson, homer_simpson).

mae(marge_bouvier, bart_simpson).
mae(marge_bouvier, lisa_simpson).
mae(marge_bouvier, maggie_simpson).

mae(jacqueline_bouvier, marge_bouvier).
mae(jacqueline_bouvier, patty_bouvier).
mae(jacqueline_bouvier, selma_bouvier).

mae(jenda, skippy_simpson).
mae(jenda, jiff_simpson).

mae(lisa_simpson, zia_simpson).

mae(maggie_simpson, maggie_simpson_jr).

mae(selma_bouvier, ling_bouvier).

filho(X,Y) :-
    pai(Y,X).

filho(X,Y) :-
    mae(Y,X).

irmaos(X,Y) :-
    pai(P,X),
    pai(P,Y),
    X \= Y.

irmaos(X,Y) :-
    mae(M,X),
    mae(M,Y),
    X \= Y.

avo(X,Y) :-
    pai(X,Z),
    pai(Z,Y).

avo(X,Y) :-
    pai(X,Z),
    mae(Z,Y).

avo(X,Y) :-
    mae(X,Z),
    pai(Z,Y).

avo(X,Y) :-
    mae(X,Z),
    mae(Z,Y).

tio(X,Y) :-
    pai(P,Y),
    irmaos(X,P).

tio(X,Y) :-
    mae(M,Y),
    irmaos(X,M).

primo(X,Y) :-
    filho(X,A),
    filho(Y,B),
    irmaos(A,B),
    X \= Y.
menu :-
    nl,
    write('========= MENU ========='), nl,
    write('1 - Verificar avo'), nl,
    write('2 - Verificar irmaos'), nl,
    write('3 - Verificar filho(a)'), nl,
    write('4 - Verificar tio(a)'), nl,
    write('5 - Verificar primos'), nl,
    write('0 - Sair'), nl,
    write('Opcao: '),
    read(Opcao),
    executar(Opcao).
executar(1) :-
    write('Possivel avo: '),
    read(Avo),
    write('Possivel neto: '),
    read(Neto),
    (avo(Avo, Neto) ->
        write('SIM, e avo(a).'), nl
    ;
        write('NAO e avo(a).'), nl
    ),
    menu.
executar(2) :-
    write('Primeira pessoa: '),
    read(X),
    write('Segunda pessoa: '),
    read(Y),
    (irmaos(X,Y) ->
        write('SIM, sao irmaos.'), nl
    ;
        write('NAO sao irmaos.'), nl
    ),
    menu.
executar(3) :-
    write('Filho(a): '),
    read(X),
    write('Pai ou Mae: '),
    read(Y),
    (filho(X,Y) ->
        write('SIM, existe relacao de filiacao.'), nl
    ;
        write('NAO existe relacao de filiacao.'), nl
    ),
    menu.
executar(4) :-
    write('Possivel tio(a): '),
    read(X),
    write('Sobrinho(a): '),
    read(Y),
    (tio(X,Y) ->
        write('SIM, e tio(a).'), nl
    ;
        write('NAO e tio(a).'), nl
    ),
    menu.
executar(5) :-
    write('Primeira pessoa: '),
    read(X),
    write('Segunda pessoa: '),
    read(Y),
    (primo(X,Y) ->
        write('SIM, sao primos.'), nl
    ;
        write('NAO sao primos.'), nl
    ),
    menu.
executar(0) :-
    write('Programa encerrado.'), nl.

executar(_) :-
    write('Opcao invalida!'), nl,
    menu.