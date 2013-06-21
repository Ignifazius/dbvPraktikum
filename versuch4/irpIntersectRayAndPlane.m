%
% irpIntersectRayAndPlane is used to determine the 3d position of an
% intersection between a pixel ray and a plane.
%
% usage:
%   PlanePoint = irpIntersectRayAndPlane(pixel_pos,N,D,f,s,cc);
%
% inputs:
%   pixel_pos: position of the pixel [xpos,ypos]
%   N: normal vector of the calibration plane
%   D: distance of the calibration plane
%   f: focal length of the camera
%   s: pixel ratio
%   cc: principal point of the camera
%
% returned variable:
%   PlanePoint: 3d position of intersection, a (3 x 1) vector

function PlanePoint = irpIntersectRayAndPlane(pixel_pos,N,D,f,s,cc)
x = pixel_pos(1)
y = pixel_pos(2)
ray = irpPixelToRay(x,y,f,s,cc)
factor = D / (N* ray')
PlanePoint = factor * ray



