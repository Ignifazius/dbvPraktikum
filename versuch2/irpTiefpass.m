function [amplitude_t phase_t]= irpTiefpass(amplitude, phase, tsize)
% [amplitude_h phase_h]= irpTiefpass(amplitude, phase, tsize)
% Führt eine Tiefpassfilterung im Ortfrequenzbereich durch.
%
% Parameter:
% 'amplitude'         Amplitudenspektrum von I
% 'phase'             Phasespektrum von I
% 'tsize'             Größe des Hochpasskernels
%
% Rückgabewerte:
% 'amplitude_t'       tiefpassgefiltertes Amplitudenspektrum
% 'phase_t'           tiefpassgefiltertes Phasespektrum

[amplitude_hoch, phase_hoch] = irpHochpass(amplitude, phase, tsize);

amplitude_t = amplitude - amplitude_hoch;
phase_t = phase - phase_hoch;

