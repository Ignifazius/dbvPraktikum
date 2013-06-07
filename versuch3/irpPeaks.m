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
% 'P'    Mx3 Matrix mit Zeilenvektoren der Form (x,y,value)

%H(H<threshold) = 0;
P = [-1 -1 -1]; % x y value

for i=1:maxNumPeaks
    peak = irpFindPeak(H);
    if (peak(3) < threshold)
        break;
    end
    P(i,1:3) = peak;
    H = irpCut(H,P(i,1), P(i,2), r);
end










