%
% irpCalibrateExtrinsic is used to calculate the CTW matrices of two
% calibration planes (stored as CTW1 and CTW2). Furthermore, stripe images 
% are projected onto these planes and stored as striped_calib1 and
% striped_calib2. Single images can be accessed with striped_calib1{i} with
% i being the desired image number.

% load intrinsic parameters and calib_dist
irpInitData

% CALIBRATION PLANE 1
irpCaptureImage
calib_img1 = capImg;

CTW1 = irpExtrinsic(calib_img1,calib_dist,f,s,cc,kc);

pause(1); % to prevent matlab crash
disp('Press enter key to project stripes on first plane');
input('Do not forget to adjust projector focus!');

irpGetStripeImages
striped_calib1 = striped;
    
% CALIBRATION PLANE 2
irpCaptureImage
calib_img2 = capImg;
CTW2 = irpExtrinsic(calib_img2,calib_dist,f,s,cc,kc);

pause(1); % to prevent matlab crash
disp(' ');
disp('Press enter key to project stripes on second plane');
input('Do not forget to adjust projector focus!');
disp(' ');

irpGetStripeImages
striped_calib2 = striped;
