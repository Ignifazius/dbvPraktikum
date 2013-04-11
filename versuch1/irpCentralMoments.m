function u = irpCentralMoments(m)
% u = irpCentralMoments(m)
% Berechnet die Zentralmomente auf Basis der Momente.
%
% Parameter:
% 'm'                 10d Zeilenvektor mit Momenten
%
% Rückgabewerte:
% 'u'                 10d Zeilenvektor mit Zentralmomenten

% Initialisiere 'u'.
u = zeros(1, 10);

% Berechne Mittelwerte.
xu = m(irpM(1,0)) / m(irpM(0,0));
yu = m(irpM(0,1)) / m(irpM(0,0));
xxu = xu * xu;
yyu = yu * yu;

% Nur zur besseren Lesbarkeit:
m00 = m(irpM(0,0)); 
m01 = m(irpM(0,1));
m02 = m(irpM(0,2));
m03 = m(irpM(0,3));
m10 = m(irpM(1,0));
m11 = m(irpM(1,1));
m12 = m(irpM(1,2));
m20 = m(irpM(2,0));
m21 = m(irpM(2,1));
m30 = m(irpM(3,0));

% Berechne Zentralmomente nach den Formeln aus dem Umdruck
% zur Vorlesung "Digitale Bildverarbeitung".
u(irpM(0,0)) = m00;
u(irpM(1,0)) = 0;
u(irpM(0,1)) = 0;
u(irpM(2,0)) = m20 - xu * m10;
u(irpM(0,2)) = m02 - yu * m01;
u(irpM(1,1)) = m11 - yu * m10;
u(irpM(3,0)) = m30 - 3 * xu * m20 + 2 * xxu * m10;
u(irpM(1,2)) = m12 - 2 * yu * m11 - xu * m02 + 2 * yyu * m10;
u(irpM(2,1)) = m21 - 2 * xu * m11 - yu * m20 + 2 * xxu * m01;
u(irpM(0,3)) = m03 - 3 * yu * m02 + 2 * yyu * m01;
