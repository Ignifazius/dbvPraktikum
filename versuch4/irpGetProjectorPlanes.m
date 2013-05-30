%
% irpGetProjectorPlanes determines the normals and distances of every
% projector plane. The following variables need to be present in memory to
% execute successfully:
%   - striped_calib1+2: the stripe images of the calibration planes
%   - CTW1+2: the transformations from calibration coordinates to camera
%             coordinates of the calibration planes
%   - f: focal length of the camera
%   - s: pixel ratio
%   - cc: principal point of the camera
%
% newly created in this script are:
%   - PlaneNormals: normals of projector planes
%   - PlaneDs: distances of projector planes from origin
%  These variables are look-up tables: the row numbers represent the gray
%  codes, the columns contain the normals/distances of the corresponding
%  projector planes.

% determine gray code mask for calibration plane 1 and 2
GrayMask1 = irpGetGrayMask(striped_calib1);
GrayMask2 = irpGetGrayMask(striped_calib2);

% get n and d of calibration planes
[n1, d1] = irpGetCalibrationPlane(CTW1);
[n2, d2] = irpGetCalibrationPlane(CTW2);

% calculate 3d positions of points along scanlines
disp(' ');
disp('Three scanlines have to be selected in the gray mask images.');
disp('Use left mouse button to mark the beginning of the scanline and');
disp('right mouse button to mark the end.');
disp('Two scanlines will be selected in the gray mask of the first calibration');
disp('plane, the third one in the gray mask of the second calibration plane.');
disp(' ');
input('Please press enter to start.');
[PlanePoints1,GrayLine1] = irpGetPointsOnCalibrationPlane(GrayMask1,n1,d1,f,s,cc);
input('First scanline selected. Press enter to select second one.');
[PlanePoints2,GrayLine2] = irpGetPointsOnCalibrationPlane(GrayMask1,n1,d1,f,s,cc);
input('Second scanline selected. Press enter to select third one.');
[PlanePoints3,GrayLine3] = irpGetPointsOnCalibrationPlane(GrayMask2,n2,d2,f,s,cc);
disp(' ');
disp('All scanlines have been selected.');

% determine normals and distances of the projector planes
[PlaneNormals, PlaneDs] = irpCalculateNormalsAndDs(GrayLine1,GrayLine2,GrayLine3,PlanePoints1,PlanePoints2,PlanePoints3);
disp('The "PlaneNormals" and "PlaneDs" have been calculated.');
disp(' ');
