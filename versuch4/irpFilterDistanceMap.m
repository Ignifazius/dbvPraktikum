%
% irpFilterDistanceMap uses various filters (median, average) to smooth the
% distance map.
% 
% Usage:
%   FilteredMap = irpFilterDistanceMap(DistanceMap);

function FilteredMap = irpFilterDistanceMap(DistanceMap)

DistanceMap = irpInterpolateRows(DistanceMap);
DistanceMap = medfilt2(DistanceMap,[3,3]);

% set all zeros in DistanceMap to mean to prevent artifacts at borders when
% averaging
mean_pos = mean(nonzeros(DistanceMap));

mask = DistanceMap==0;
DistanceMap = DistanceMap+mask*mean_pos;
DistanceMap = imfilter(DistanceMap,fspecial('average',[5 5]));

% erode and dilate to get rid of last border artifacts
mask = imerode(mask,strel('disk',4));
mask = imdilate(mask,strel('disk',6));
FilteredMap = DistanceMap.*(~mask);
