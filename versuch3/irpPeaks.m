function P = irpPeaks(H, r, threshold, maxNumPeaks)
% P = irpPeaks(H, r, threshold, maxNumPeaks)
% Berechnet die Höhepunkte eines 2d Hough-Raums für Kreise.
%
% Parameter:
% 'H'                 2d Hough-Raum
% 'r'                 Radius des Kreises
% 'threshold'         Nur Höhepunkte oberhalb des Thresholds sind gültig
% 'maxNumPeaks'       Maximale Anzahl der zu findenden Kreise
%
% Rückgabewerte:
% 'P'                 Mx3 Matrix mit Zeilenvektoren der Form (x,y,value)

Htmp(H<threshold) = 0;



%Votgehen: druch bild laufen bis weißer pixel gefunden, dann maximum im
%radiusumkreis suchen, maximum = einer der zu suchenden Werte. Weitermachen
%für restliches bild
%-> irpCut();












