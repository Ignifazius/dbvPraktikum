function m = irpMoments(Lc)
% m = irpMoments(Lc)
% Berechnet auf Basis einer Koordinatenliste die gesuchten Momente.
% Gesuchte Momente sind:
% m00, m01, m02, m03, m10, m11, m12, m20, m21, m30
%
% Parameter:
% 'Lc'                Mx2 Matrix mit Pixelkoordinaten (x, y)
%
% Rückgabewerte:
% 'm'                 10d Zeilenvektor mit den gesuchten Momemten.

% Hole Anzahl der Zeilen von 'Lc'.
numRows = size(Lc,1);

% Initialisiere Werte.
% Es wird hier nicht direkt in 'm' geschrieben, 
% um die Lesbarkeit zu erhöhen.
m00 = 0;
m01 = 0;
m02 = 0;
m03 = 0;
m10 = 0;
m11 = 0;
m12 = 0;
m20 = 0;
m21 = 0;
m30 = 0;

% Berechne die Momente.

for i = 1:numRows
    x =  Lc(i,1); % x-Werte
    y =  Lc(i,2); % y-Werte
    
    m00 = m00 + 1;
    m01 = m01 + y;
    m02 = m02 + y*y;
    m03 = m03 + y*y*y;
    m10 = m10 + x;
    m11 = m11 + x*y;
    m12 = m12 + x*y*y;
    m20 = m20 + x*x;
    m21 = m21 + x*x*y;
    m30 = m30 + x*x*x;
end


% Schreibe Werte in Zeilenvektor.
m = zeros(1, 10);
m(irpM(0,0)) = m00;
m(irpM(0,1)) = m01;
m(irpM(0,2)) = m02;
m(irpM(0,3)) = m03;
m(irpM(1,0)) = m10;
m(irpM(1,1)) = m11;
m(irpM(1,2)) = m12;
m(irpM(2,0)) = m20;
m(irpM(2,1)) = m21;
m(irpM(3,0)) = m30;

