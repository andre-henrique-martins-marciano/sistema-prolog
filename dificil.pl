% FATOS
% Simpson

pai(abraham_simpson, homer_simpson).
mae(mona_simpson, homer_simpson).

pai(homer_simpson, bart_simpson).
pai(homer_simpson, lisa_simpson).
pai(homer_simpson, maggie_simpson).

mae(marge_bouvier, bart_simpson).
mae(marge_bouvier, lisa_simpson).
mae(marge_bouvier, maggie_simpson).

% Família Bouvier

pai(clancy_bouvier, marge_bouvier).
pai(clancy_bouvier, patty_bouvier).
pai(clancy_bouvier, selma_bouvier).

mae(jacqueline_bouvier, marge_bouvier).
mae(jacqueline_bouvier, patty_bouvier).
mae(jacqueline_bouvier, selma_bouvier).

% Descendentes

pai(bart_simpson, skippy_simpson).
pai(bart_simpson, jiff_simpson).

mae(jenda, skippy_simpson).
mae(jenda, jiff_simpson).

pai(milhouse_van_houten, zia_simpson).
mae(lisa_simpson, zia_simpson).

mae(maggie_simpson, maggie_simpson_jr).

mae(selma_bouvier, ling_bouvier).

% REGRAS DE DECISÃO

% Filho

filho(X,Y) :-
    pai(Y,X).

filho(X,Y) :-
    mae(Y,X).

% Irmãos

irmaos(X,Y) :-
    pai(P,X),
    pai(P,Y),
    X \= Y.

% Avô

avo(X,Y) :-
    pai(X,Z),
    pai(Z,Y).

avo(X,Y) :-
    pai(X,Z),
    mae(Z,Y).

% Tio

tio(X,Y) :-
    irmaos(X,Z),
    pai(Z,Y).

tio(X,Y) :-
    irmaos(X,Z),
    mae(Z,Y).

% Primo

primo(X,Y) :-
    filho(X,A),
    filho(Y,B),
    irmaos(A,B),
    X \= Y.


% INTERAÇÃO 

menu :-
    nl,
    write('========= MENU ========='), nl,
    write('1 - Verificar se Abraham e avo'), nl,
    write('2 - Verificar se duas pessoas sao irmas'), nl,
    write('3 - Verificar se uma pessoa e filho(a)'), nl,
    write('4 - Verificar se uma pessoa e tio(a)'), nl,
    write('5 - Verificar se duas pessoas sao primas'), nl,
    write('0 - Sair'), nl,
    read(Opcao),
    executar(Opcao).

executar(1) :-
    write('Nome do neto: '),
    read(Pessoa),
    (avo(abraham_simpson, Pessoa) ->
        write('SIM, Abraham Simpson e avo de '),
        write(Pessoa), nl
    ;
        write('NAO, Abraham Simpson nao e avo dessa pessoa.'), nl
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
        write('SIM, e tio(a).' ), nl
    ;
        write('NAO e tio(a).' ), nl
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