function [Bb, Bs] = irpBinarize(I, low, high)
% [Bb, Bs] = irpBinarize(I, low, high)
% Binarisiert ein Grauwertbild mit Hilfe eines niedrigen und hohen 
% Schwellwertes in zwei Bin�rbilder. 
%
% Parameter:
% 'I'                 Grauwertbild
% 'low'               Niedriger Schwellwert
% 'high'              Hoher Schwellwert
%
% R�ckgabewerte:
% 'Bb'                Binarisiertes Bild f�r Bauteile
% 'Bs'                Binarisiertes Bild f�r Schlitten

% Binarisiere Bauteile.
Bb = ((I > low).*(I < high));

% Binarisiere Schlitten.
Bs = (I > high);
