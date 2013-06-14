%
% irpGetCalibrationPlane determines n and d of a plane with equation n*x=d
% which is the xy plane of the world coordinate system.
%
% Usage:
%   [n,d] = irpGetCalibrationPlane(CTW);
%
% return values:
%   n: 1 x 3 normal vector of the plane
%   d: distance of plane from origin
%   
% input:
%   CTW: the matrix which transforms world coordinates to camera
%        coordinates with the equation x_c = CTW*x_w.

function [n,d] = irpGetCalibrationPlane(CTW)

pw = [0 0 1 0]';     
n = CTW * pw;
pw2 = [1 1 0 1]';
pc2 = CTW * pw2;
d = n'* pc2;
n = n(1:3)';