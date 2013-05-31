function peak = irpFindPeak(H)
% peak = irpFindPeak(H)
% Findet den H�hepunkt in einem 2d Hough-Raum.
%
% Parameter:
% 'H'                 2d Hough-Raum
%
% R�ckgabewerte:
% 'peak'              3d Zeilenvektor der Form (x, y, value)

% Suche Maximum samt Koordinaten.



[x y] = max(H);
[maxV,index_x] = max(x);

index_y = y(index_x);
peak = [index_x index_y maxV];