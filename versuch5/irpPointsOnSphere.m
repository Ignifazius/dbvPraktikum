function [C] = irpPointsOnSphere(Points, s, eps)
% [C] = irpPointsOnSphere(Points, s, eps)
% Berechnet die Kontaktpunkte f�r die gegebene Kugel.
% Falls keine Kontaktpunkte vorhanden sind, wird zeros(0, 1) zur�ckgegeben.
%
% Parameter:
% 'Points'            Mx3 Matrix beschreibt 3d Punkte (Zeilenvektoren)
% 's'                 4d Zeilenvektor f�r Ebene (cx, cy, cz, r)
% 'eps'               Ausdehnung der Kontaktumgebung
%
% R�ckgabewerte:
% 'C'                 Kx1 Spaltenvektor mit Indizes der Kontaktpunkte.


m = s(1:3);
r = s(4);
 
[numcol numrow] = size(Points);

d = zeros(numcol,1);
for i = 1: numcol
    d(i) = norm(Points(i,:) - m);
end
C = find( abs(d-r) <= eps);



















