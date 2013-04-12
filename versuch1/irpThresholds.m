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
H = imhist (I);

% Als Zwischenschritt kann hier die Funktion 'irp3Gaussians1d' verwendet
% werden, die 3 gewichtete Gaussverteilungen aus dem Histogramm schätzt.
irp3Gaussians1d(H);
[MU, SIGMA, WEIGHT] = irp3Gaussians1d (H);
MU = sort(MU);
% Berechne die Schwellwerte.
low = (MU(2)+MU(1))/2;
high =(MU(2)+MU(3))/2;



