%
% irpCalculateNormalsAndDs calculates the normal vectors and distances
% of each projector plane. These values are returned in the variables
% PlaneNormals and PlaneDs.
%
% Usage:
%   [PlaneNormals,PlaneDs] =
%       irpCalculateNormalsAndDs(GrayLine1,GrayLine2,GrayLine3,
%                                PlanePoints1,PlanePoints2,PlanePoints3);
%
% The following variables are needed:
%   - GrayLine1-3: rows of the GrayMasks that were used to determine the PlanePoints
%   - PlanePoints1-3: the points in 3d space along the scanlines which belong to the 
%                     projector planes

function [PlaneNormals,PlaneDs] = irpCalculateNormalsAndDs(GrayLine1,GrayLine2,GrayLine3,PlanePoints1,PlanePoints2,PlanePoints3)

% most likely 128 or 256 are the maximum number of stripes
if max(max(GrayLine1)) > 128 
    max_val = 256;
else
    max_val = 128;
end

PlaneNormals = zeros(max_val,3);
PlaneDs = zeros(max_val,1);

for i = 1:size(GrayLine1, 2)
    p1 = i;
    if(GrayLine1(1,i)~=0)
        p2 = find(GrayLine2==GrayLine1(1,i));
        if(size(p2, 2)>0)
            dif = p2 - mean(p2); % find position closest to mean position
            [r s] = min(abs(dif));
            p2 = p2(1,s);
            
            p3 = find(GrayLine3==GrayLine1(1,i));
            if(size(p3,2)>0)
                dif = p3 - mean(p3);
                [r s] = min(abs(dif));
                p3 = p3(1,s);

%                 n1 = PlanePoints2(p2,:) - PlanePoints1(p1,:);
%                 n2 = PlanePoints2(p2,:) - PlanePoints3(p3,:);
%                 N = cross(n1,n2);
% 
%                 N = N/norm(N);
                [N,D] = irpGetPlaneEquation(PlanePoints1(p1,:),PlanePoints2(p2,:),PlanePoints3(p3,:));

                PlaneNormals(GrayLine1(1,i),1:3) = N;
                PlaneDs(GrayLine1(1,i),1) = D;
            end            
        end
    end
end
