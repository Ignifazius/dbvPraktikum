function I = irpInverseFFT(amplitude, phase)
% I = irpInverseFFT(amplitude, phase)
% Inverse Fast Fourier Transformation.
%
% Parameter:
% 'amplitude'         Amplitudenspektrum von I
% 'phase'             Phasespektrum von I
%
% R�ckgabewerte:
% 'I'                 Eingabebild

tmp = exp(i*phase).*amplitude;
I = real(ifft2(tmp));



