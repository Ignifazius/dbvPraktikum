function F = irpFilter(I, noise, algorithm)
% F = irpFilter(I, noise, algorithm)
% Wendet einen geeigneten Rauschfilter auf das Eingangsbild an.
%
% Parameter:
% 'I'                 Eingangsbild
% 'noise'             St�rke der Filterung: 0(aus), 1(leicht), 2(stark)
% 'algorithm'         Auswahl des Verfahrens: 1 (Average), 2 (Median)
%
% R�ckgabewerte:
% 'F'                 Gefiltertes Bild.

% Setze Filtergr��e.
fsize = (noise*2)+1;

% F�hre Filteroperation durch in Abh�ngigkeit von 'algorithm'.
if (algorithm == 1)
    F = irpAveragefilt2(I, fsize);
end

if (algorithm == 2)
    F = medfilt2(I,[fsize fsize]);
end

if (algorithm == 0)
    F = I;
end