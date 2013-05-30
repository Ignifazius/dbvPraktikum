%
% irpGetPointsOnCalibrationPlane is used to determine 3d positions of
% points on a plane along a scanline, which is selected manually in the gray
% code mask. Only positions for pixel values different from zero are calculated.
%
% inputs:
%   GrayMask: the gray code mask
%   N: normal vector of the calibration plane
%   D: distance of the calibration plane
%   f: focal length of the camera
%   s: pixel ratio
%   cc: principal point of the camera
%
% returned variable:
%   PlanePoints: matrix [dimension: (RES x 3)] with x, y and z coordinates 
%                of determined points for each pixel along the scanline.
%                For gray code zero, all coordinates are also zero.
%   profile: color values along the selected scanline

function [PlanePoints,profile] = irpGetPointsOnCalibrationPlane(GrayMask,N,D,f,s,cc)

figure(45)
imshow(GrayMask);
[xpositions,ypositions,profile] = improfile;
close(45);

profile = profile';
% round positions, because they are returned with subpixel accuracy
xpositions = round(xpositions);
ypositions = round(ypositions);

PlanePoints = zeros(size(xpositions, 1), 3);

for i = 1:size(xpositions,1)
    if(GrayMask(ypositions(i),xpositions(i))~=0)
        PlanePoints(i,:) = irpIntersectRayAndPlane([xpositions(i),ypositions(i)],N,D,f,s,cc);
    end
end
