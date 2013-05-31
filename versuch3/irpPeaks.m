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








% Htmp = H;
% Htmp(H<threshold) = 0;
% imshow(H, []);
% figure;
% imshow(Htmp, []);
% [numrow numcol] = size(H);
% P = [0 0 0];
% x = 1;
% for i=1+r:numrow
%     for j=1+r:numcol
%         if Htmp(i,j) ~= 0
%             center = max(max(Htmp(i-r:i+r,j-r:j+r)));
%             [cx cy] = find(Htmp == center);
%             irpCut(Htmp, cx, cy, r);
%             P(x) = [cx cy center];
%             x= x+1;
%         end
%     end
% end


%Votgehen: druch bild laufen bis weißer pixel gefunden, dann maximum im
%radiusumkreis suchen, maximum = einer der zu suchenden Werte. Weitermachen
%für restliches bild
%-> irpCut();












