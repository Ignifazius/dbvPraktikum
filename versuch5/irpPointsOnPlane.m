function [C] = irpPointsOnPlane(Points, p, eps)
% [C] = irpPointsOnPlane(Points, p, eps)
% Berechnet die Kontaktpunkte f�r die gegebene Ebene.
% Falls keine Kontaktpunkte vorhanden sind, wird zeros(0, 1) zur�ckgegeben.
%
% Parameter:
% 'Points'            Mx3 Matrix beschreibt 3d Punkte (Zeilenvektoren)
% 'p'                 4d Zeilenvektor f�r Ebene (nx, ny, nz, d)
% 'eps'               Ausdehnung der Kontaktumgebung
%
% R�ckgabewerte:
% 'C'                 Kx1 Spaltenvektor mit Indizes der Kontaktpunkte.












