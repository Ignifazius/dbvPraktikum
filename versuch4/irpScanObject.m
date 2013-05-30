%
% irpScanObject is used to scan a 3d object. The following variables are 
% created:
%   striped_obj: stripe images of the scanned object
%   GrayMaskObj: gray mask of the scanned object
%   DistanceMap: distance map of the scanned object
%   Points3D: 3d points of the scanned object

disp(' ');
input('Adjust projector focus and then press enter to start scanning.');
disp(' ');

irpGetStripeImages
striped_obj = striped;

GrayMaskObj = irpGetGrayMask(striped_obj);

[DistanceMap,Points3D] = irpGetObject3D(GrayMaskObj,PlaneNormals,PlaneDs,f,s,cc);
