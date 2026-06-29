% O nível 2 do trabalho tem como tema as relações familiares de Star Wars.
% Nos fatos, apenas relações de pai e mãe(adotivo ou biológico) foram apresentados e 
% os gêmeos para caso de curiosidade.

% Fatos: 

mae(princesa_leia_organa,jaina_solo).
mae(princesa_leia_organa,jacen_solo).
mae(princesa_leia_organa,anakin_solo).
mae(mara_jade,ben_skywalker).
mae(padme_amidala,luke_skywalker).
mae(padme_amidala,princesa_leia_organa).
mae(jobal_naberrie,padme_amidala).
mae(shmi_skywalker,anakin_skywalker).

mae_adotiva(breha_organa,princesa_leia_organa).
mae_adotiva(beru_lars,luke_skywalker).

pai(luke_skywalker,ben_skywalker).
pai(han_solo,jaina_solo).
pai(han_solo,jacen_solo).
pai(han_solo,anakin_solo).
pai(anakin_skywalker,luke_skywalker).
pai(anakin_skywalker,princesa_leia_organa).
pai(ruweee_naberrie,padme_amidala).
pai(cliegg_lars,owen_lars).

pai_adotivo(cliegg_lars,anakin_skywalker).
pai_adotivo(owen_lars,luke_skywalker).
pai_adotivo(bail_organa,princesa_leia_organa).

gemeos(luke_skywalker,princesa_leia_organa).
gemeos(jaina_solo,jacen_solo).

%regras

% Determina "filho" como adotivo ou biológico, não havendo diferencação,
% pois todas as regras seguintes de parentesco mais direto independem de genética.
filho(X,Y):-
    (mae(Y,X);pai(Y,X));
    (mae_adotiva(Y,X);pai_adotivo(Y,X)).


avo(X,Y):-
    filho(Y,Z),
    filho(Z,X).

% A regra "conjuge" foi estruturada de modo que impeça que um pai ou mãe adotivo
% seja vinculado à um biológico, apenas por convenção do universo.
% Ou seja, em Star Wars não existem casais compostos dessa forma.
conjuge(X,Y):-
    ((pai(X,Z),mae(Y,Z));
    (mae(X,Z),pai(Y,Z)));
    ((pai_adotivo(X,Z),mae_adotiva(Y,Z));
    (pai_adotivo(Y,Z),mae_adotiva(X,Z))).


neto(X,Y):-
    filho(Z,Y),
    filho(X,Z).

irmao(X,Y):-
    (X\=Y),
    (filho(X,Z),filho(Y,Z)).

tio(X,Y):-
    filho(Y,Z),
    irmao(Z,X).

cunhado(X,Y):-
    (conjuge(X,Z),
    irmao(Z,Y));
    (conjuge(Y,Z),
    irmao(Z,X)).

primo(X,Y):-
    filho(X,Z),
    filho(Y,W),
    irmao(Z,W),
    (X\=Y).

sobrinho(X,Y):-
    filho(X,Z),
    irmao(Z,Y).

% Determina se um elemento X do universo é descendente de um elemento Y,
% desconsiderando se existe ou não vinculo genético. 
descendente(X,Y):-
    filho(X,Y).
descendente(X,Y):-
    filho(X,Z),
    descendente(Z,Y).


% Determina se um elemento X do universo é descendente_natural de um elemento Y,
% sendo válido apenas para relações sanguíneas, e por isso usa os fatos: pai e mãe. 
descendente_natural(X,Y):-
    (mae(Y,X);pai(Y,X)).
descendente_natural(X,Y):-
    (pai(Z,X);mae(Z,X)),
    descendente_natural(Z,Y).

% Determina, primeiro, se um elemento X do universo é descendente de um elemneto Y,
% após, elimina todos que têm relações apenas formadas por descendência de sangue.
% Dessa forma, engloba somente as linhagens (nos intevalos determinados pelas variáveis)
% que tem, pelo menos, uma relação adotiva. 
descendente_civil(X,Y):-
    descendente(X,Y),
    \+descendente_natural(X,Y).


% geracoes(descendente, ancestral, distância do descendente para o ancestral na árvore)*
% Pode exibir mais de uma ramificação da árvore genealógica, visto que considera
% tanto as relações biológicas, quanto as adotivas. 
geracoes(X,Y,1):-
    filho(X,Y).
geracoes(X,Y,N):-
    filho(X,Z),
    geracoes(Z,Y,N1),
    N is N1 + 1.

