function [s num C] = irpBestSphere(Points, iter, eps)
% [s num C] = irpBestSphere(Points, iter, eps)
% Berechnet iterativ nach dem RANSAC-Prinzip die Kugel, die am besten zu
% der gegebenen Punktmenge passt.
%
% Parameter:
% 'Points'            Mx3 Matrix (pro Zeile ein Punkt)
% 'iter'              Anzahl der durchzuführenden Iterationen
% 'eps'               Epsilon-Umgebung für Kontaktberechnung
%
% Rückgabewerte:
% 's'                 1x4 Vektor (cx, cy, cz, r) beschreibt Kugel
% 'num'               Anzahl der Kontaktpunkte
% 'C'                 (num x 1) Vektor mit Indizes der Kontaktpunkte
















