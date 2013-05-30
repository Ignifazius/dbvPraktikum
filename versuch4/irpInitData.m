%
% irpInitData is used to define the data needed for extrinsic calibration.
% Defined are:
%   f: camera focal length
%   s: pixel ratio
%   cc: camera principal point
%   kc: camera distortion parameters
%   calib_dist: distance of the calibration points on the calibration planes

f = 849.25423;
s = [1; 853.76693/849.25423];
cc = [353.69360;257.31276];
kc = [-0.22811; 0.20878; -0.00944; -0.00010; 0.00000];
calib_dist = [0; 0]; %% insert measured values here
