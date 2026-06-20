% FATOS
pai(carlos, joao).
pai(ricardo, ana).
pai(joao, maria).
pai(joao, pedro).

mae(luiza, joao).
mae(helena, ana).
mae(ana, maria).
mae(ana, pedro).

irmao(pedro, maria).
irma(ana, joao).

% REGRAS

% X é filho(a) de Y
filho_de(X, Y) :-
    pai(Y, X);
    mae(Y, X).

% X e Y são irmãos
irmaos(X, Y) :-
    pai(P, X),
    pai(P, Y),
    mae(M, X),
    mae(M, Y),
    X \= Y.

% X e Y são os pais de Z
pais_de(X, Y, Z) :-
    pai(X, Z),
    mae(Y, Z).

% X é neto(a) de Y
neto_de(X, Y) :-
    (pai(Z, X); mae(Z, X)),
    (pai(Y, Z); mae(Y, Z)).

% Avô ou avó de Y
avo_geral(X, Y) :-
    (pai(X, Z); mae(X, Z)),
    (pai(Z, Y); mae(Z, Y)).

% REGRAS RECURSIVAS

% Caso base: pai ou mãe direto
antepassado(X, Y) :-
    pai(X, Y).

antepassado(X, Y) :-
    mae(X, Y).

% Caso recursivo: ancestral indireto
antepassado(X, Y) :-
    pai(X, Z),
    antepassado(Z, Y).

antepassado(X, Y) :-
    mae(X, Z),
    antepassado(Z, Y).

% Tamanho de uma lista
tamanho_lista([], 0).

tamanho_lista([_|T], N) :-
    tamanho_lista(T, N1),
    N is N1 + 1.

% Verifica se um elemento pertence à lista
membro(X, [X|_]).

membro(X, [_|T]) :-
    membro(X, T).

% Concatena duas listas
concatena([], L, L).

concatena([H|T], L2, [H|R]) :-
    concatena(T, L2, R).