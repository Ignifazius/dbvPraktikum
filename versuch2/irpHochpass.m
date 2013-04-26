function [amplitude_h phase_h]= irpHochpass(amplitude, phase, hsize)
% [amplitude_h phase_h]= irpHochpass(amplitude, phase, hsize)
% Führt eine Hochpassfilterung im Ortfrequenzbereich durch.
%
% Parameter:
% 'amplitude'         Amplitudenspektrum von I
% 'phase'             Phasespektrum von I
% 'hsize'             Größe des Hochpasskernels
%
% Rückgabewerte:
% 'amplitude_h'       hochpassgefiltertes Amplitudenspektrum
% 'phase_h'           hochpassgefiltertes Phasespektrum

% shiften damit es in die mitte zeichnet

[m,n] = size(amplitude);
ctr_y = m/2;
ctr_x = n/2;

amplitude_h = ifftshift(irpDrawCircle (fftshift(amplitude), ctr_x, ctr_y, hsize, 0 ));
phase_h = ifftshift(irpDrawCircle (fftshift(phase), ctr_x, ctr_y, hsize, 0 ));
