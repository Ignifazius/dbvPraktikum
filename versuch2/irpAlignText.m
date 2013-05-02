function O = irpAlignText(I)
% O = irpAlignText(I)
% Richtet das Textbild I aus.
%
% Parameter:
% 'I'                 Verdrehtes Textbild
%
% Rückgabewerte:
% 'O'                 Ausgerichtets Textbild




[amp pha] = irpFFT(I);
[a p] = irpHochpass(amp, pha, 120);
Iflip = flipud(fftshift(a));
[x y] = max(Iflip);
[i j] = max(x);
vec = [y(j), j];

[angle, ~]= cart2pol(vec(1), vec(2));
angle = angle*180/pi;

O = imrotate(I, angle);






