%
% irpGetObject3D is used to scan an arbitrary object with the structured light
% approach.
%
% [DistanceMap Points3D] = 
%             irpGetObject3D(GrayMaskObj,PlaneNormals,PlaneDs,f,s,cc);
%
% Needed variables:
%   - GrayMaskObj: the gray code mask of the scanned object (from irpGetGrayMask)
%   - PlaneNormals: the normals of the projector planes (from irpGetProjectorPlanes)
%   - PlaneDs: the distances of the projector planes from the camera (from irpGetProjectorPlanes)
%   - f: focal length of the camera
%   - s: pixel ratio
%   - cc: principal point of the camera
%
% Variables that are created:
%   - DistanceMap: a matrix which contains the distance of every scanned 3d
%                  point from the camera
%   - Points3D: the actual 3d positions of the scanned points


function [DistanceMap Points3D] = irpGetObject3D(GrayMaskObj,PlaneNormals,PlaneDs,f,s,cc)

DistanceMap = zeros(size(GrayMaskObj));
Points3D = zeros(size(GrayMaskObj, 1), size(GrayMaskObj,2), 3);

for y = 1: size(GrayMaskObj, 1)
    for x = 1: size(GrayMaskObj, 2)
        if(GrayMaskObj(y, x)~=0)
        
            % determine ray at (x,y)
            b = 
            
            % determine normal of corresponding projector plane
            n =
            
            if n~=[0,0,0] % security check      
                
                % determine distance of corresponding projector plane
                d =
                
                % intersect ray and projector plane

                % save 3d point in Points3D

                % save z coordinate in DistanceMap
                
            end
        end
    end
end
