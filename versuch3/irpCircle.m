function C = irpCircle(cx, cy, omega, r, alpha, imgSize)
% C = irpCircle(cx, cy, omega, r, alpha, imgSize)
% Berechnet eine Liste von Pixelindizes, 
% die zwei gegen�berliegende Kreissegmente beschreiben. Pixel au�erhalb
% der Bilddimensionen 'imgSize' werden ignoriert. (cx, cy) bildet 
% den Mittelpunkt des Kreises. Mit 'omega' k�nnen die Kreissegmente auf dem
% Kreis rotiert werden.
%
% Ein vollst�ndiger Kreis wird berechnet, wenn 'alpha' auf pi und 'omega' 
% auf 0 gesetzt werden, wobei die Wahl von 'omega' hier prinzipiell keine 
% Bedeutung hat, da zwei rotierte, gegen�berliegende Halbkreise immer einen 
% vollst�ndigen Kreis bilden.
%
% Die Indizes 'C' k�nnen direkt zur Indizierung in ein Array verwendet 
% werden. Z.B. setzt I(C) = 255 alle Pixel C von I auf den Wert 255.
%
% Parameter:
% 'cx'                x-Koordinate des Kreismittelpunktes
% 'cy'                y-Koordinate des Kreismittelpunktes
% 'omega'             Winkel zur x-Achse in RAD
% 'r'                 Radius des Kreises
% 'alpha'             Gr��e eines Kreissegmentes in RAD
% 'imgSize'           Zeilenvektor f�r Bilddimensionen: [sy sx]
%
% R�ckgabewerte:
% 'C'                 Spaltenvektor mit g�ltigen Pixelindizes.

% Initialisiere einige Parameter.
sy = imgSize(1);                   % Gr��e des Bildes in y-Richtung
sx = imgSize(2);                   % Gr��e des Bildes in x-Richtung
num = uint16(round(r*alpha));      % Anzahl der Pixel pro Kreissegment
C = uint32(zeros(num*2, 1));       % Initialisiere Indizes
numCoords = 0;                     % Aktuelle Anzahl g�ltiger Indizes
delta = omega - alpha * 0.5;       % Offset-Winkel

% Generiere Pixelindizes.
% Hinweis: round k�nnte evtl. erforderlich sein.
for i=1:num
    % Berechne Winkel zur x-Achse.
    phi = double(i-1) / double(num) * alpha + delta;
    cosphi = cos(phi);
    sinphi = sin(phi);
    
    % Berechnung f�r 1. Kreissegment.
    
    % Berechne gerundete x- und y-Koordinate.
    x = 
    y = 
        
    % Berechne Index nach �berpr�fung.
    if (x > 0 && y > 0 && x <= sx && y <= sy)
       numCoords = numCoords + 1;
       C(numCoords) = (x-1) * sy + y;        
    end
    
    % Berechnung f�r gegen�berliegendes 2. Kreissegment.
    
    % Berechne gerundete x- und y-Koordinate f�r Kreissegment gegen�ber.
    x = 
    y = 
        
    % Berechne Index nach �berpr�fung.
    if (x > 0 && y > 0 && x <= sx && y <= sy)
       numCoords = numCoords + 1;
       C(numCoords) = (x-1) * sy + y;        
    end
end

% Ignoriere restliche Koordinaten.
C = uint32(C(1:numCoords));
