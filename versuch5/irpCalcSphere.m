function [s] = irpCalcSphere(Q)
% [s] = irpCalcSphere(Q)
% Berechnet eine Kugel, so dass alle vier gegebenen Punkt auf der
% Kugeloberfläche liegen. Falls keine eindeutige Lösung existiert,
% wird [0 0 0 0] zurückgegeben.
%
% Parameter:
% 'Q'                 4x3 Matrix (jede Zeile beschreibt einen 3d Punkt)
%
% Rückgabewerte:
% 's'                 4d-Zeilenvektor beschreibt Kugel (x,y,z,r)

[a v] = irpCalcCenterAxis( Q(1, 1:3), Q(2, 1:3), Q(3, 1:3));
[b w] = irpCalcCenterAxis( Q(1, 1:3), Q(2, 1:3), Q(4, 1:3));
n = cross (v,w);
%mathemagie
s= -1;
x = b - a;
A = [v' -w' n'];
if det(A) == 0
    s = [ 0 0 0 0];
else
    h = A\x'; % A^-1 * x
    c1 = a + h(1)*v + 0.5*h(3)*n;
    c2 = b + h(2)*w - 0.5*h(3)*n;
%     bool = isequal(c1, c2);
%     if bool ==1 % Teste ob c richtig berechnet wurde
        %m = irpCalcCenterAxis(a, b, c1);
        r = norm(c1-Q(1,:));
        s = [c1(1) c1(2) c1(3) r];
%         disp('bkl');
%     else
%         disp('Error in calculating C');
%     end
end




























