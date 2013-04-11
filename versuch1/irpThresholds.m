function [low high] = irpThresholds(I)
% [low high] = irpThresholds(I)
% Berechnet auf Basis des Grauwerthistogramms automatisch
% einen niedrigen und eine hohen Schwellwert.  
%
% Parameter:
% 'I'                 Grauwertbild mit Werten im Bereich [0 255]
%
% Rückgabewerte:
% 'low'               Niedriger Schwellwert
% 'high'              Hoher Schwellwert

% Berechne das Histogramm.
H = 

% Als Zwischenschritt kann hier die Funktion 'irp3Gaussians1d' verwendet
% werden, die 3 gewichtete Gaussverteilungen aus dem Histogramm schätzt.


% Berechne die Schwellwerte.
low = 
high = 



