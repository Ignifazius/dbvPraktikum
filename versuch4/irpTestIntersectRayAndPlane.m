%
% irpTestIntersectRayAndPlane is used to test function irpIntersectRayAndPlane.
% If an error occurs, this function will tell you and ask you to change the
% corresponding part of irpIntersectRayAndPlane.
% If the calculation of the intersection point is correct, this function will 
% congratulate you.

function irpTestIntersectRayAndPlane

testpoint = irpIntersectRayAndPlane([30,300],[1,1,0],55,700,[1 0.97],[315 248]);

if size(testpoint) ~= [1 3]
    disp(' ');
    disp('Please check vector dimensions. Should be 1 x 3.');
    disp(' ');
else
    if round(testpoint*1000) ~= [66827  -11827 -164137]
        disp(' ');
        disp('Point coordinates not calculated correctly.');
        disp('Please change computation of intersection coordinates!');
        disp(' ');
    else
        disp(' ');
        disp('Congratulations! Intersection coordinates calculated correctly!');
        disp('Great job, guys. On to the next step!');
        disp(' ');
    end
end,
