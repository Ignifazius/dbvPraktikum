function [Points, sOut] = irpGenSpherePoints(s, S, P, B, f)
% [Points, sOut] = irpGenSpherePoints(s, S, P, B, f)
% Erzeugt zuf�llig Punkte, die sich auf einer Kugeloberfl�che befinden.
% Es werden maximal 's(5) = num' Punkte erzeugt. Punkte, die au�erhalb der
% Bounding Box 'B' liegen, werden ignoriert.
%
% Parameter:
% 's'                 5d Zeilenvektor f�r Kugel (cx, cy, cz, r, numDesired)
% 'S'                 Mx5 Matrix. Jede Zeile beschreibt eine Kugel in der
%                     Form (cx, cy, cz, r, numDesired).
% 'P'                 Nx5 Matrix. Jede Zeile beschreibt eine Ebene in der
%                     Form (nx, ny, nz, d, numDesired).
% 'B'                 2x3 Matrix mit minimalen und maximalen 3d Koordinaten
% 'f'                 3d Zeilenvektor beschreibt Brennpunkt des Sensors.
%
% R�ckgabewerte:
% 'Points'            Mx3 Matrix mit Punktkoordinaten als Zeilenvektoren
% 'sOut'              5d Zeilenvektor f�r Kugel (cx, cy, cz, r, numReal)


% Initialisiere Parameter.
c = s(1:3);
r = s(4);
numDesired = s(5);

% Initialisiere Punkte.
Points = zeros(numDesired, 3);

% Erzeuge zuf�llig Punkte auf der Kugeloberfl�che.
k = 0;
for i=1:numDesired
    % Generiere Zufallspunkt auf der Kugeloberfl�che.
    v = [rand-0.5 rand-0.5 rand-0.5];
    vLength = norm(v);
    if vLength < 0.0001
        v = [0 0 1];
    end
    v = v / vLength * r + c;
    
    % Pr�fe, ob Punkt innerhalb der Bounding Box liegt 
    % und ob der Punkt sichtbar ist.
    if (sum((v >= B(1,:)) & (v <= B(2,:))) == 3) ...
            && irpVisibility(v, S, P, f)
        k = k + 1;
        Points(k,:) = v;
    end
end

% Schreibe R�ckgabeparameter.
Points = Points(1:k,:);
sOut = s;
sOut(5) = k;
