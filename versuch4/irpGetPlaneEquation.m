%
% irpGetPlaneEquation determines the normal and the distance the origin of
% a plane. This plane is defined by three points.
%
% usage:
%   [PlaneNormal PlaneD] = irpGetPlaneEquation(point1, point2, point3);
%
% inputs:
%   - point1-3: points [x,y,z] lying on the plane
%
% returned variables:
%   - PlaneNormal: 1 x 3 normal vector of the plane
%   - PlaneD: distance of the plane from the origin of the coordinate system

function [PlaneNormal PlaneD] = irpGetPlaneEquation(point1, point2, point3)

PlaneNormal = cross(point3-point2,point3-point1);
PlaneNormal = PlaneNormal/norm(PlaneNormal);
PlaneD = PlaneNormal*point1';