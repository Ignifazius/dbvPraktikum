function [PointsOut] = irpAddNoise(Points, noise)
% [PointsOut] = irpAddNoise(Points, noise)
% F�gt den Punkten Rauschen hinzu.
% 
% Parameter:
% 'Points'            Mx3 Matrix mit 3d Punkten als Zeilenvektoren
% 'noise'             St�rke des Rauschens (z.B. 0.01)
%
% R�ckgabewerte:
% 'PointsOut'         Mx3 Matrix mit 3d Punkten als Zeilenvektoren

PointsOut = Points + randn(size(Points)) * noise;
