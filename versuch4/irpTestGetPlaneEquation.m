%
% irpTestGetPlaneEquation is used to test function irpGetPlaneEquation.
% If an error occurs, this function will tell you and ask you to change the
% corresponding part of irpGetPlaneEquation.
% If the calculation of n and d is correct, this function will congratulate
% you.

function irpTestGetPlaneEquation

[n d] = irpGetPlaneEquation([0, 0, 20],[30,0,40],[0,10,10]);

if size(n) ~= [1 3]
    disp(' ');
    disp('Please check vector dimensions of n. Should be 1 x 3.');
    disp(' ');
else
    %if (round(n*10000) == [4264   -6396   -6396])
    if (norm(cross(n,[0.4264 -0.6396  -0.6396])) < 1e-10)
        if (abs(round(d*100)) == 1279)
            disp(' ');
            disp('Congratulations: plane normal and distance are calculated correctly');
            disp('This means, your implementation of irpGetPlaneEquation works');
            disp('Well done! On to the next step!');
            disp(' ');
        else
            disp(' ');
            disp('Plane normal calculated correctly');
            disp('Plane distance NOT correct. Please change computation of d!');
            disp(' ');
        end
    else
        if (abs(round(d*100)) == 1279)
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
