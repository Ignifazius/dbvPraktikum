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

% insert calculation here !!!!!
