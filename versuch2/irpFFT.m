function [amplitude phase] = irpFFT(I)
% [amplitude phase] = irpFFT(I)
% Berechnet Amplitude und Phase mit Hilfe der Fast Fourier Transformation.
%
% Parameter:
% 'I'                 Eingabebild
%
% Rückgabewerte:
% 'amplitude'         Amplitudenspektrum von I
% 'phase'             Phasespektrum von I

tmp = fft2 (double(I));
amplitude = (abs(tmp));
phase = angle(tmp);



% "Hinweise": 
% - Welchen Datentyp hat I?
% - Ist evtl. ein Cast notwendig?
