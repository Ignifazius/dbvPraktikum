function [bVis] = irpVisibility(p, S, P, c)
% [bVis] = irpVisibility(p, S, P, c)
% Mit Hilfe eines einfachen Sensormodells werden Punkte, die durch den
% Sensor nicht gesehen werden können, entfernt. 'c' stellt dabei den
% Brennpunkt des Sensors dar, durch den alle Sensormessstrahlen gehen.
% Für die Berechnung dürfen die Daten noch nicht verrauscht worden sein.
%
% Falls 'c == [0 0 0]' gilt, findet keine Überprüfung statt.
%
% Parameter:
% 'p'                 3d Zeilenvektor, der einen 3d Punkt beschreibt.
% 'S'                 Mx5 Matrix. Jede Zeile beschreibt eine Kugel in der
%                     Form (cx, cy, cz, r, numDesired).
% 'P'                 Nx5 Matrix. Jede Zeile beschreibt eine Ebene in der
%                     Form (nx, ny, nz, d, numDesired).
% 'c'                 3d Zeilenvektor beschreibt Brennpunkt des Sensors.
%
% Rückgabewerte:
% 'bVis'              Ist true oder false.

% Initialisiere einige Werte.
numSpheres = size(S, 1);
numPlanes = size(P, 1);
bVis = true;

if sum(c == [0 0 0]) == 3
	return;
end

% Teste Kugeln.
for j=1:numSpheres
    m = S(j, 1:3);
    r = S(j, 4);
    mp = p - m;
    cm = m - c;
    cp = p - c;
    cpn = cp / norm(cp);
    dot = cpn * cm';
    cpm = cpn * dot - cm;
    dist = norm(cpm);
    dot = mp * cm';
    if ((dist < r) && (dot > 0))
        bVis = false;
    end
end

 % Teste Ebenen.
eps = 0.001;
for j=1:numPlanes
    n = P(j, 1:3);
    d = P(j, 4);
    sign = 1;
    if (c * n' - d) < 0, sign = -1; end
    dist = (p * n' - d) * sign;
    if dist < -eps
        bVis = false;
    end
end
