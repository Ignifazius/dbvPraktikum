function [Bm] = irpMorph(B, morph)
% [Bm] = irpMorph(B, morph)
% Führt morphologische Operationen auf einem Binärbild durch, um kleinere
% Artefakte zu entfernen und fehlerhaft getrennte Regionen wieder 
% zusammenzuführen.
%
% Parameter:
% 'B'                 Binärbild
% 'morph'             Stärke der Filterung: 0(aus), 1(leicht), 2(stark)
%
% Rückgabewerte:
% 'Bm'                Binärbild nach morphologischen Operationen

% Für die morphologischen Operationen muss ein Strukturelement definiert
% werden. Hier wird z.B. folgendes vorgegeben:
%
%      | 0 1 0 |
% SR = | 1 1 1 |
%      | 0 1 0 |
%
SR = strel('diamond', 1);

% Speichere das Binärbild in 'Bm'.
Bm = B;

% Führe morphologische Operation auf 'Bm' aus und speichere sie in 'Bm'.
TODO
