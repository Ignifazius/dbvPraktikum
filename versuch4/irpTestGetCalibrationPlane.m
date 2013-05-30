%
% irpTestGetCalibrationPlane is used to test function irpGetCalibrationPlane.
% If an error occurs, this function will tell you and ask you to change the
% corresponding part of irpGetCalibrationPlane.
% If the calculation of n and d is correct, this function will congratulate
% you.

function irpTestGetCalibrationPlane

CTW = [ 0.5253    0.4470   -0.7240  50;
       -0.8509    0.2760   -0.4470  100;
             0    0.8509    0.5253  400;
             0         0         0  1];
         
[n,d] = irpGetCalibrationPlane(CTW);

if size(n) ~= [1 3]
    disp(' ');
    disp('Please check vector dimensions of n. Should be 1 x 3.');
    disp(' ');
else
    if (round(n*1000) == [-724  -447  525])
        if (round(d*10) == 1292)
            disp(' ');
            disp('Congratulations: plane normal and distance are calculated correctly.');
            disp('This means your implementation of irpGetCalibrationPlane works!');
            disp('Well done! On to the next step!');
            disp(' ');
        else
            disp(' ');
            disp('Plane normal calculated correctly');
            disp('Plane distance NOT correct. Please change computation of d!');
            disp(' ');
        end
    else
        if (round(d*10) == 1292)
            disp(' ');
            disp('Plane distance calculated correctly');
            disp('Plane normal NOT correct. Please change computation of n!');
            disp(' ');
        else
            disp(' ');
            disp('Plane normal and plane distance NOT correct.');
            disp('Please change computation of n and d!');
            disp(' ');
        end
    end
end
