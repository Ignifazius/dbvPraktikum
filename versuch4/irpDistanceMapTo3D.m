%
% irpDistanceMapTo3D generates 3D points from a distance map.
%
% Usage:
%   Points3D = irpDistanceMapTo3D(DistanceMap);

function Points3D = irpDistanceMapTo3D(DistanceMap)

[yres,xres] = size(DistanceMap);
Points3D = zeros(yres,xres,3);

for x=1:xres
    Points3D(:,x,1) = x;
end

for y=1:yres
    Points3D(y,:,2) = y;
end

Points3D(:,:,3) = DistanceMap;
