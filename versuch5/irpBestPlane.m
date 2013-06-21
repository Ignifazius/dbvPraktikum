function [p num C] = irpBestPlane(Points, iter, eps)
% [p num C] = irpBestPlane(Points, iter, eps)
% Berechnet iterativ nach dem RANSAC-Prinzip die Ebene, die am besten zu
% der gegebenen Punktmenge passt.
%
% Parameter:
% 'Points'            Mx3 Matrix (pro Zeile ein Punkt)
% 'iter'              Anzahl der durchzuf�hrenden Iterationen
% 'eps'               Epsilon-Umgebung f�r Kontaktberechnung
%
% R�ckgabewerte:
% 'p'                 1x4 Vektor (nx, ny, nz, d) beschreibt Ebene
% 'num'               Anzahl der Kontaktpunkte
% 'C'                 (num x 1) Vektor mit Indizes der Kontaktpunkte
















