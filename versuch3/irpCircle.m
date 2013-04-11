function C = irpCircle(cx, cy, omega, r, alpha, imgSize)
% C = irpCircle(cx, cy, omega, r, alpha, imgSize)
% Berechnet eine Liste von Pixelindizes, 
% die zwei gegenüberliegende Kreissegmente beschreiben. Pixel außerhalb
% der Bilddimensionen 'imgSize' werden ignoriert. (cx, cy) bildet 
% den Mittelpunkt des Kreises. Mit 'omega' können die Kreissegmente auf dem
% Kreis rotiert werden.
%
% Ein vollständiger Kreis wird berechnet, wenn 'alpha' auf pi und 'omega' 
% auf 0 gesetzt werden, wobei die Wahl von 'omega' hier prinzipiell keine 
% Bedeutung hat, da zwei rotierte, gegenüberliegende Halbkreise immer einen 
% vollständigen Kreis bilden.
%
% Die Indizes 'C' können direkt zur Indizierung in ein Array verwendet 
% werden. Z.B. setzt I(C) = 255 alle Pixel C von I auf den Wert 255.
%
% Parameter:
% 'cx'                x-Koordinate des Kreismittelpunktes
% 'cy'                y-Koordinate des Kreismittelpunktes
% 'omega'             Winkel zur x-Achse in RAD
% 'r'                 Radius des Kreises
% 'alpha'             Größe eines Kreissegmentes in RAD
% 'imgSize'           Zeilenvektor für Bilddimensionen: [sy sx]
%
% Rückgabewerte:
% 'C'                 Spaltenvektor mit gültigen Pixelindizes.

% Initialisiere einige Parameter.
sy = imgSize(1);                   % Größe des Bildes in y-Richtung
sx = imgSize(2);                   % Größe des Bildes in x-Richtung
num = uint16(round(r*alpha));      % Anzahl der Pixel pro Kreissegment
C = uint32(zeros(num*2, 1));       % Initialisiere Indizes
numCoords = 0;                     % Aktuelle Anzahl gültiger Indizes
delta = omega - alpha * 0.5;       % Offset-Winkel

% Generiere Pixelindizes.
% Hinweis: round könnte evtl. erforderlich sein.
for i=1:num
    % Berechne Winkel zur x-Achse.
    phi = double(i-1) / double(num) * alpha + delta;
    cosphi = cos(phi);
    sinphi = sin(phi);
    
    % Berechnung für 1. Kreissegment.
    
    % Berechne gerundete x- und y-Koordinate.
    x = 
    y = 
        
    % Berechne Index nach Überprüfung.
    if (x > 0 && y > 0 && x <= sx && y <= sy)
       numCoords = numCoords + 1;
       C(numCoords) = (x-1) * sy + y;        
    end
    
    % Berechnung für gegenüberliegendes 2. Kreissegment.
    
    % Berechne gerundete x- und y-Koordinate für Kreissegment gegenüber.
    x = 
    y = 
        
    % Berechne Index nach Überprüfung.
    if (x > 0 && y > 0 && x <= sx && y <= sy)
       numCoords = numCoords + 1;
       C(numCoords) = (x-1) * sy + y;        
    end
end

% Ignoriere restliche Koordinaten.
C = uint32(C(1:numCoords));
