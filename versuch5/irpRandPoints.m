function [Q] = irpRandPoints(Points, num)
% [Q] = irpRandPoints(Points, num)
% Wählt aus 'Points' zufällig 'num' Punkte aus.
%
% Parameter:
% 'Points'            Mx3 Matrix beschreibt eine Menge an 3d Punkten.
% 'num'               Anzahl der zufällig auszuwählenden Punkte.
%
% Rückgabewerte:
% 'Q'                 (num)x3 Matrix mit 3d Punkten.

i = randperm(size(Points,1));
Q = Points(i(1:num),:);



