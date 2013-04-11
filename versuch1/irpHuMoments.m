function h = irpHuMoments(u)
% h = irpHuMoments(u)
% Berechnet die Hu-Momente auf Basis der Zentralmomente.
%
% Parameter:
% 'u'                 10d Zeilenvektor mit Zentralmomenten
%
% Rückgabewerte:
% 'h'                 7d Zeilenvektor mit Hu-Momenten

% Initialisiere 'h'.
h = zeros(1, 7);

% Zur besseren Lesbarkeit:
u00 = u(irpM(0,0));

% Berechne normierte Zentralmomente.
% n00
% n01
n02 = u(irpM(0,2)) / u00^2;
n03 = u(irpM(0,3)) / u00^2.5;
% n10
n11 = u(irpM(1,1)) / u00^2;
n12 = u(irpM(1,2)) / u00^2.5;
n20 = u(irpM(2,0)) / u00^2;
n21 = u(irpM(2,1)) / u00^2.5;
n30 = u(irpM(3,0)) / u00^2.5;

% Berechne Hu-Momente nach den Formeln aus dem Umdruck
% zur Vorlesung "Digitale Bildverarbeitung".
h(1) = n20 + n02;
h(2) = (n20-n02)^2 + 4*n11^2;
h(3) = (n30 - 3*n12)^2 + (n03 - 3*n21)^2;
h(4) = (n30 + n12)^2 + (n21 + n03)^2;
h(5) = (n30 - 3*n12)*(n30 + n12)*((n30 + n12)^2 - 3*(n21 + n03)^2) + (3*n21 - n03)*(n21 + n03)*(3*(n30 + n12)^2 - (n21 + n03)^2);
h(6) = (n20 - n02)*((n30 + n12)^2 - (n21 + n03)^2) + 4*n11*(n30 + n12)*(n21 + n03);
h(7) = (3*n21 - n03)*(n30 + n12)*((n30 + n12)^2 - 3*(n21 + n03)^2) + (3*n12 - n30)*(n21 + n03)*(3*(n30 + n12)^2 - (n21 + n03)^2);

% Da die Werte stark mit der Ordnung abfallen,
% wird hier noch eine Skalierung durchgeführt.
s = [1 10 100 100 100000 10000 1000000];
for i=1:7
    h(i) = h(i) * s(i);
end
