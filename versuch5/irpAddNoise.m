function [PointsOut] = irpAddNoise(Points, noise)
% [PointsOut] = irpAddNoise(Points, noise)
% Fügt den Punkten Rauschen hinzu.
% 
% Parameter:
% 'Points'            Mx3 Matrix mit 3d Punkten als Zeilenvektoren
% 'noise'             Stärke des Rauschens (z.B. 0.01)
%
% Rückgabewerte:
% 'PointsOut'         Mx3 Matrix mit 3d Punkten als Zeilenvektoren

PointsOut = Points + randn(size(Points)) * noise;
