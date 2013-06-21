function [Q] = irpRandPoints(Points, num)
% [Q] = irpRandPoints(Points, num)
% W�hlt aus 'Points' zuf�llig 'num' Punkte aus.
%
% Parameter:
% 'Points'            Mx3 Matrix beschreibt eine Menge an 3d Punkten.
% 'num'               Anzahl der zuf�llig auszuw�hlenden Punkte.
%
% R�ckgabewerte:
% 'Q'                 (num)x3 Matrix mit 3d Punkten.

i = randperm(size(Points,1));
Q = Points(i(1:num),:);



