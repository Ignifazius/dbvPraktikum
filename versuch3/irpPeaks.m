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










