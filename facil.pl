homem(george_joestar).
homem(jonathan_joestar).
homem(george_joestar_II).
homem(joseph_joestar).
homem(josuke_higashikata).
homem(sadao_kujo).
homem(jotaro_kujo).
mulher(mary_joestar).
mulher(erina_pendleton).
mulher(elizabeth_joestar).
mulher(suzi_Q_joestar).
mulher(holy_kujo).
mulher(tomoko_higashikata).
mulher(jolyne_kujo).

progenitor(george_joestar, jonathan_joestar).
progenitor(mary_joestar, jonathan_joestar).
progenitor(jonathan_joestar, george_joestar_II).
progenitor(erina_pendleton, george_joestar_II).
progenitor(george_joestar_II, joseph_joestar).
progenitor(elizabeth_joestar, joseph_joestar).
progenitor(joseph_joestar, josuke_higashikata).
progenitor(tomoko_higashikata, josuke_higashikata).
progenitor(joseph_joestar, holy_kujo).
progenitor(suzi_Q_joestar, holy_kujo).
progenitor(holy_kujo, jotaro_kujo).
progenitor(sadao_kujo, jotaro_kujo).
progenitor(jotaro_kujo, jolyne_kujo).

mae(X,Y):-
    progenitor(X,Y),
    mulher(X).
pai(X,Y):-
    progenitor(X,Y),
    homem(X).
filho(X,Y):-
    progenitor(Y,X).