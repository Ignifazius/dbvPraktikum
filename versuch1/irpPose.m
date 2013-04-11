function [p n] = irpPose(m, u)
% [p n] = irpPose(m, u)
% Berechnet die Position und Orientierung mit Hilfe von Momenten und
% Zentralmomenten.
%
% Parameter:
% 'm'                 10d Zeilenvektor mit Momenten
% 'u'                 10d Zeilenvektor mit Zentralmomenten
%
% Rückgabewerte:
% 'p'                 2d Zeilenvektor für die Position (x, y)
% 'n'                 2d Zeilenvektor für die Normale (nx, ny) = (u, v)

% Für die bessere Lesbarkeit:
m00 = m(irpM(0,0));
m10 = m(irpM(1,0));
m01 = m(irpM(0,1));
u11 = u(irpM(1,1));
u20 = u(irpM(2,0));
u02 = u(irpM(0,2));

% Position als Schwerpunkt.
p = 
    
% Winkel.
phi = 

% Normale.
% Nehmen Sie an, dass der Winkel 'phi' zwischen der gesuchten
% Normale und der x-Achse liegt.
n = 

% Richte Normale an Hauptachse aus.
if u02 > u20
    n = [-n(2) n(1)];
end
