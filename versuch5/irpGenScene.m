function [Points, SOut, POut] = irpGenScene(S, P, B, f)
% [Points, SOut, POut] = irpGenScene(S, P, B, f)
% Generiert eine Szene, die aus mehreren Kugeln und mehreren Ebenen
% besteht. Die Parameter der Kugeln können mittels 'S' und die Parameter
% für die Ebenen mittels 'P' frei vorgegeben werden. Punkte, die außerhalb
% der Bounding Box 'B' liegen, werden verworfen. Daher kann die gewünschte
% Anzahl an Punkten (numDesired) für eine Geometrie von der tatsächlichen
% (numReal) abweichen.
%
% Mit Hilfe eines einfachen Sensormodells werden Punkte, die durch den
% Sensor nicht gesehen werden können, entfernt. 'f' stellt dabei den
% Brennpunkt des Sensors dar, durch den alle Sensormessstrahlen gehen.
% Mit 'f == [0 0 0]' kann die Sichtbarkeitsprüfung auch abgestellt werden.
%
% Parameter:
% 'S'                 Mx5 Matrix. Jede Zeile beschreibt eine Kugel in der
%                     Form (cx, cy, cz, r, numDesired).
% 'P'                 Nx5 Matrix. Jede Zeile beschreibt eine Ebene in der
%                     Form (nx, ny, nz, d, numDesired).
% 'B'                 2x3 Matrix mit minimalen und maximalen Koordinaten.
% 'f'                 3d Zeilenvektor beschreibt Brennpunkt des Sensors.
%
% Rückgabewerte:
% 'Points'            Mx3 Matrix mit Punktkoordinaten als Zeilenvektoren.
% 'SOut'              Kx5 Matrix. Jede Zeile beschreibt eine Kugel in der
%                     Form (cx, cy, cz, r, numReal).
% 'POut'              Jx5 Matrix. Jede Zeile beschreibt eine Ebene in der
%                     Form (nx, ny, nz, d, numReal).

% Initialisiere Variablen.
SOut = S;
POut = P;
numSpheres = size(S, 1);
numPlanes = size(P, 1);
numDesiredPoints = 0;
if numSpheres > 0
    numDesiredPoints = numDesiredPoints + sum(S(:,5));
end
if numPlanes > 0
    numDesiredPoints = numDesiredPoints + sum(P(:,5));
end
Points = zeros(numDesiredPoints, 3);

% Erstelle Kugeln.
numPoints = uint32(0);
for i=1:numSpheres
    [SpherePoints SOut(i,:)] = irpGenSpherePoints(S(i,:), S, P, B, f);
    j = numPoints+1;
    numPoints = numPoints + SOut(i,5);
    k = numPoints;
    Points(j:k,:) = SpherePoints;
end

% Erstelle Ebenen.
for i=1:numPlanes    
    [PlanePoints POut(i,:)] = irpGenPlanePoints(P(i,:), S, P, B, f);
    j = numPoints+1;
    numPoints = numPoints + POut(i,5);
    k = numPoints;
    Points(j:k,:) = PlanePoints;
end

% Entferne alle nicht verwendeten Punkte.
Points = Points(1:numPoints,:);
