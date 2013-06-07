%
% irpPixelToRay generates 3d vectors from 2d pixel coordinates.
%
% Usage:
%   x_r = irpPixelToRay(x,y,f,s,cc)
%
% return value:
%   x_r: 1 x 3 vector with length 1 pointing in direction of the pixel ray
%
% Variables:
%   - x: x position in image coordinates
%   - y: y position in image coordinates
%   - f: focal length (in pixels)
%   - s: pixel ratio
%   - cc: principal point in image coordinates (in pixels)

function x_r = irpPixelToRay(x,y,f,s,cc)

%umrechnung bildkoordinaten
difx = x - cc(1);
dify = y - cc(2);
%richtungsvektor
x_r = [difx*s(1) dify*s(2) f];
% normierung richtungsvektor
x_r = x_r / norm(x_r);
