function [s num C] = irpBestSphere(Points, iter, eps)
% [s num C] = irpBestSphere(Points, iter, eps)
% Berechnet iterativ nach dem RANSAC-Prinzip die Kugel, die am besten zu
% der gegebenen Punktmenge passt.
%
% Parameter:
% 'Points'            Mx3 Matrix (pro Zeile ein Punkt)
% 'iter'              Anzahl der durchzuf�hrenden Iterationen
% 'eps'               Epsilon-Umgebung f�r Kontaktberechnung
%
% R�ckgabewerte:
% 's'                 1x4 Vektor (cx, cy, cz, r) beschreibt Kugel
% 'num'               Anzahl der Kontaktpunkte
% 'C'                 (num x 1) Vektor mit Indizes der Kontaktpunkte


num = -1;
for i=1:iter
	p_temp = irpCalcSphere(irpRandPoints(Points,4));
    if p_temp(4) > 50 %verwirf kugeln gr��er r 50
        continue;
    end
    C_temp = irpPointsOnSphere(Points, p_temp, eps);
    nomnom = size(C_temp, 1);
    
    if num < nomnom
       num = nomnom;
       C = C_temp;
       s = p_temp;
    end
    
end












