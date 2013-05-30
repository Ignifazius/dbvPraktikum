%
% irpInterPolateRows interpolates linearly between two points within a row
% that have a gap with value 0 between them.
%
% Usage:
%    interpolated = irpInterpolateRows(image);

function r = irpInterpolateRows(I)
for y = 1:size(I, 1)
    j = 1;
    for x = 1:size(I, 2)
        if (I(y,x)~= 0)
            if(j ~=1 && x-j-1 < 5) % only close gaps smaller than 5 pixels
                for z = 0: x-j-1
                 I(y, j+z) = I(y, j) + (I(y, x)-I(y, j))*z/(x-j);
                end
            end
            j = x;
        end   
    end
end
r = I;
