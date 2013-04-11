function irpTestFilter(I, noise)
% irpTestFilter(I, noise)
% Testet die Filterfunktionen irpAveragefilt2 und medfilt2.
%
% Parameter:
% 'I'                 Bild
% 'noise'             Stärke der Filterung: 0(aus), 1(leicht), 2(stark)
%
% Rückgabewerte:
% -

% Average-Filter.
A = 

% Median-Filter.
M = 

% Stelle Bilder dar.
irpTestThresholds(I, 3, 3, 1);
irpTestThresholds(A, 3, 3, 4);
irpTestThresholds(M, 3, 3, 7);

