function [MU, SIGMA, WEIGHT] = irp3Gaussians1d(H)
% C = irp3Gaussians1d(H)
% Berechnet auf Basis des Grauwerthistogramms drei Gaussverteilungen.
%
% Parameter:
% 'H'                 Grauwerthistogramm
%
% Rückgabewerte:
% 'MU'                 3d Spaltenvektor mit Mittelwerten der Gaussverteilungen
% 'SIGMA'              3d Spaltenvektor mit Standardabweichungen der Gaussverteilungen
% 'WEIGHT'             3d Spaltenvektor mit Gewichten der Gaussverteilungen

% Generiere Trainingsvektor aus Histogramm
num = size(H,1);
train = [];
for i=1:num,
  train = [train; i * ones(min(round(sum(H,1)/100),H(i)),1)];
end

% Schätze Gaussverteilungen mit Hilfe des EM-Algorithmus
success = 0;
while success == 0
  try
    est = gmmb_em(double(train), 'init', 'cmeans1', 'components', 3, 'thr', 1e-8);
    success = 1;
  catch
    success = 0;
  end
end

% Generiere Rückgabewerte
MU     = est.mu';
SIGMA  = sqrt(squeeze(est.sigma));
WEIGHT = est.weight;
