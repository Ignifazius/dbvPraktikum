function [low high] = irpThresholds(I)
% [low high] = irpThresholds(I)
% Berechnet auf Basis des Grauwerthistogramms automatisch
% einen niedrigen und eine hohen Schwellwert.  
%
% Parameter:
% 'I'                 Grauwertbild mit Werten im Bereich [0 255]
%
% R�ckgabewerte:
% 'low'               Niedriger Schwellwert
% 'high'              Hoher Schwellwert

% Berechne das Histogramm.
H = imhist (I);

% Als Zwischenschritt kann hier die Funktion 'irp3Gaussians1d' verwendet
% werden, die 3 gewichtete Gaussverteilungen aus dem Histogramm sch�tzt.
irp3Gaussians1d(H);
[MU, SIGMA, WEIGHT] = irp3Gaussians1d (H);

% Berechne die Schwellwerte.
[MU, IX] = sort(MU, 'ascend');
SIGMAB = SIGMA(IX);
WEIGHTB = WEIGHT(IX);

k1 = zeros(256,1);
k1(:,1) = gauss_distribution(1:256, MU(1), SIGMAB(1));
k2 = zeros(256,1);
k2(:,1) = gauss_distribution(1:256, MU(2), SIGMAB(2));
k3 = zeros(256,1);
k3(:,1) = gauss_distribution(1:256, MU(3), SIGMAB(3));

% addieren. minimum suchen zwischen den mu. dann mu wieder auf grenzwert
% draufaddieren

k1k2 = zeros(256,1);
k1k2(:,1) = k1(:,1)*WEIGHTB(1) + k2(:,1)*WEIGHTB(2);
[min1, min1_ind]= min(k1k2(MU(1):MU(2),1)')
low = min1_ind + MU(1);

k2k3 = zeros(256,1);
k2k3(:,1) = k2(:,1)*WEIGHTB(2) + k3(:,1)*WEIGHTB(3);
[min2, min2_ind]= min(k2k3(MU(2):MU(3),1)')
high = min2_ind + MU(2);

% % einfache Variante
%  low = (MU(2)+MU(1))/2;
%  high =(MU(2)+MU(3))/2;
end

% Methode2
function f = gauss_distribution(x, mu, s) % x... Grauwerte
p1 = -.5 * ((x - mu)/s) .^ 2;
p2 = (s * sqrt(2*pi));
f = exp(p1) ./ p2; 
end

