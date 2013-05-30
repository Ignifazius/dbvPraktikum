function P = irpPeaks(H, r, threshold, maxNumPeaks)
% P = irpPeaks(H, r, threshold, maxNumPeaks)
% Berechnet die H�hepunkte eines 2d Hough-Raums f�r Kreise.
%
% Parameter:
% 'H'                 2d Hough-Raum
% 'r'                 Radius des Kreises
% 'threshold'         Nur H�hepunkte oberhalb des Thresholds sind g�ltig
% 'maxNumPeaks'       Maximale Anzahl der zu findenden Kreise
%
% R�ckgabewerte:
% 'P'                 Mx3 Matrix mit Zeilenvektoren der Form (x,y,value)

Htmp(H<threshold) = 0;



%Votgehen: druch bild laufen bis wei�er pixel gefunden, dann maximum im
%radiusumkreis suchen, maximum = einer der zu suchenden Werte. Weitermachen
%f�r restliches bild
%-> irpCut();












