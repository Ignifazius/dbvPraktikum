%
% irpGetStripeImages generates "stripe patterns" from Gray-Code
% These patterns are displayed in fullscreen and for each pattern an image is
% captured with the attached camera.
%
% The captured images are saved in the variable "striped".
% A particular image (index i) can be accessed via striped{i}.
%

% max_stripes determines the maximum resolution, should be power of 2
% due to characteristic of graycode actually only max_stripes/2 stripes can be
% seen in the finest pattern
max_stripes = 256;
delay = 0.5; % Zeit in s zwischen Fullscreen-Anzeige und Bildaufnahme
display = 2; % display number (1 for primary, 2 for secondary)

power = round(log2(max_stripes));

ge = java.awt.GraphicsEnvironment.getLocalGraphicsEnvironment();
gds = ge.getScreenDevices();
y_res = uint16(gds(display).getDisplayMode().getHeight());
x_res = uint16(gds(display).getDisplayMode().getWidth());

if ~exist('S')

    S{1} = uint8(255*ones(y_res,x_res,3));

    for i=2:power+2  %2 extra images needed (white, black)
        S{i} = uint8(zeros(y_res,x_res,3));
    end

    str_width = x_res/max_stripes;
    left = 1;
    for i=0:max_stripes-1
        graycode = floor(bitxor(i*2,i)/2); % determine graycode of dezimal number

        for j=0:power-1
            if bitand(graycode,2^j)==2^j
                S{power+1-j}(:,left:left+str_width-1,:) = 255; % store backwards for GetGrayCode
            end
        end

        left = left+str_width;
    end
end

for i=1:power+2
    fullscreen(S{i},display);
    pause(delay);
    striped{i} = rgb2gray(irpCapOneImage());
end
% wait to ensure that last image gets captured correctly
pause(3*delay);

% clean up
clear max_stripes delay ge gds y_res x_res power shift_size left shift_size
clear first_stripe graycode str_width

closescreen
