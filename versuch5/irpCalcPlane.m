function [p] = irpCalcPlane(Q)
% [p] = irpCalcPlane(Q)
% Berechnet eine Ebene, die durch die drei gegebenen Punkte geht.
% Falls keine eindeutige Ebene berechnet werden kann, wird [0 0 0 0]
% zurückgegeben.
%
% Parameter:
% 'Q'                 3x3 Matrix (drei Punkte jeweils als Zeilenvektoren)
% 
% Rückgabewerte:
% 'p'                 1x4 Vektor für Ebene (nx, ny, nz, d)

A = Q(1,1:3)-Q(2,1:3);
B = Q(1,1:3)-Q(3,1:3);
n = cross(A',B');
n = n / norm(n);
x = (Q(1,1:3))';
d = n' * x;

p = [n(1,1), n(2,1), n(3,1), d];







