%
% irpGetGrayMask extracts a gray code mask from a sequence of "stripe images"
% which were created by irpGetStripeImages.
% 
% Usage:
%   grayMask = irpGetGrayMask(striped);

% images{1} = bright
% images{2} .. images{last-1} = projector
% images{last} = dark
function GrayMask = irpGetGrayMask(images)

last = size(images,2);

if size(images{1},3) == 3
    for i=1:last
        images{i} = rgb2gray(images{i});
    end
end

tresh = (images{1}-images{last})/2;

for i=2:last-1
    mask{i} = (images{i} - images{last}) > tresh;
%    mask{i} = images{i} > tresh;
end

% Create grayMask
GrayMask = bitshift(uint8(mask{2}), 1);

for i=3:last-2
    GrayMask = bitshift(bitor(GrayMask, uint8(mask{i})), 1);
end

GrayMask = bitor(GrayMask, uint8(mask{last-1}));

GrayMask = GrayMask.*uint8(im2bw(images{1}-images{last},0.1));
