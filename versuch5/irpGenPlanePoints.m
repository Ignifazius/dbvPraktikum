function [Points, pOut] = irpGenPlanePoints(p, S, P, B, f)
% [Points, pOut] = irpGenPlanePoints(p, S, P, B, f)
% Generiert zufällig Punkte, die auf einer Ebene liegen.
% Es werden maximal 'p(5) = num' Punkte erzeugt. Punkte, die außerhalb der
% Bounding Box 'B' liegen, werden ignoriert.
% 
% Parameter:
% 'p'                 5d Zeilenvektor für Ebene (nx, ny, nz, d, numDesired)
% 'S'                 Mx5 Matrix. Jede Zeile beschreibt eine Kugel in der
%                     Form (cx, cy, cz, r, numDesired).
% 'P'                 Nx5 Matrix. Jede Zeile beschreibt eine Ebene in der
%                     Form (nx, ny, nz, d, numDesired).
% 'B'                 2x3 Matrix mit minimalen und maximalen 3d Koordinaten
% 'f'                 3d Zeilenvektor beschreibt Brennpunkt des Sensors.
%
% Rückgabewerte:
% 'Points'            (numReal x 3)Matrix mit 3d Punkten als Zeilenvektoren
% 'sOut'              5d Zeilenvektor für Ebene (nx, ny, nz, d, numReal)

% Initialisiere einige Parameter.
numDesired = p(5);
Points = zeros(numDesired, 3);
n = p(1:3);
d = p(4);

% Berechne Zufallspunkte.
numReal = 0;
for i=1:numDesired
    % Generiere Zufallsvektor, der innerhalb der Bounding Box liegt.
    v = B(1,:) + rand(1,3) .* (B(2,:) - B(1,:));
    
    % Projiziere diesen Zufallsvektore auf die Ebene.
    dist = v * n';
    dif = d - dist;
    v = v + n * dif;
    
    % Teste, ob der Punkt innerhalb der Bounding Box liegt
    % und ob der Punkt sichtbar ist.
    if (sum((v >= B(1,:)) & (v <= B(2,:))) == 3) ...
            && irpVisibility(v, S, P, f)
        numReal = numReal + 1;
        Points(numReal,:) = v;
    end
end

% Schreibe Rückgabewerte.
Points = Points(1:numReal,:);
pOut = [p(1:4), numReal];
