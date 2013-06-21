function [C] = irpPointsOnPlane(Points, p, eps)
% [C] = irpPointsOnPlane(Points, p, eps)
% Berechnet die Kontaktpunkte für die gegebene Ebene.
% Falls keine Kontaktpunkte vorhanden sind, wird zeros(0, 1) zurückgegeben.
%
% Parameter:
% 'Points'            Mx3 Matrix beschreibt 3d Punkte (Zeilenvektoren)
% 'p'                 4d Zeilenvektor für Ebene (nx, ny, nz, d)
% 'eps'               Ausdehnung der Kontaktumgebung
%
% Rückgabewerte:
% 'C'                 Kx1 Spaltenvektor mit Indizes der Kontaktpunkte.

[numcol numrow] = size(Points);

d = zeroes(numcol,1);
for i = 1: numcol
    d(i) = dot(Points(i,:),p(1:3));
end
C = find(abs(d-p(4)) <= eps);





