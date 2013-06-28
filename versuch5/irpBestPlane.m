function [p num C] = irpBestPlane(Points, iter, eps)
% [p num C] = irpBestPlane(Points, iter, eps)
% Berechnet iterativ nach dem RANSAC-Prinzip die Ebene, die am besten zu
% der gegebenen Punktmenge passt.
%
% Parameter:
% 'Points'            Mx3 Matrix (pro Zeile ein Punkt)
% 'iter'              Anzahl der durchzuführenden Iterationen
% 'eps'               Epsilon-Umgebung für Kontaktberechnung
%
% Rückgabewerte:
% 'p'                 1x4 Vektor (nx, ny, nz, d) beschreibt Ebene
% 'num'               Anzahl der Kontaktpunkte
% 'C'                 (num x 1) Vektor mit Indizes der Kontaktpunkte


num = -1;
for i=1:iter
	p_temp = irpCalcPlane(irpRandPoints(Points,3));
    C_temp = irpPointsOnPlane(Points, p_temp, eps);
    nomnom = size(C_temp, 1);
    
    if num < nomnom
       num = nomnom;
       C = C_temp;
       p = p_temp;
    end
    
end












