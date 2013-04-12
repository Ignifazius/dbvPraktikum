function [Bb, Bs] = irpBinarize(I, low, high)
% [Bb, Bs] = irpBinarize(I, low, high)
% Binarisiert ein Grauwertbild mit Hilfe eines niedrigen und hohen 
% Schwellwertes in zwei Binärbilder. 
%
% Parameter:
% 'I'                 Grauwertbild
% 'low'               Niedriger Schwellwert
% 'high'              Hoher Schwellwert
%
% Rückgabewerte:
% 'Bb'                Binarisiertes Bild für Bauteile
% 'Bs'                Binarisiertes Bild für Schlitten

% Binarisiere Bauteile.
Bb = ((I > low).*(I < high));

% Binarisiere Schlitten.
Bs = (I > high);
