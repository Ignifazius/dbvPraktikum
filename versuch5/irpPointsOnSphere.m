function [C] = irpPointsOnSphere(Points, s, eps)
% [C] = irpPointsOnSphere(Points, s, eps)
% Berechnet die Kontaktpunkte für die gegebene Kugel.
% Falls keine Kontaktpunkte vorhanden sind, wird zeros(0, 1) zurückgegeben.
%
% Parameter:
% 'Points'            Mx3 Matrix beschreibt 3d Punkte (Zeilenvektoren)
% 's'                 4d Zeilenvektor für Ebene (cx, cy, cz, r)
% 'eps'               Ausdehnung der Kontaktumgebung
%
% Rückgabewerte:
% 'C'                 Kx1 Spaltenvektor mit Indizes der Kontaktpunkte.


m_temp = irpCalcSphere(irpRandPoints(Points, 4));
m = m_temp(1:3);
r = m_temp(4);
 
[numcol numrow] = size(Points);

d = zeros(numcol,1);
for i = 1: numcol
    d(i) = norm(Points(i) - m);
end
C = find( abs(d-r) <= eps);



















