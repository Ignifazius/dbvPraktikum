function [Bm] = irpMorph(B, morph)
% [Bm] = irpMorph(B, morph)
% F�hrt morphologische Operationen auf einem Bin�rbild durch, um kleinere
% Artefakte zu entfernen und fehlerhaft getrennte Regionen wieder 
% zusammenzuf�hren.
%
% Parameter:
% 'B'                 Bin�rbild
% 'morph'             St�rke der Filterung: 0(aus), 1(leicht), 2(stark)
%
% R�ckgabewerte:
% 'Bm'                Bin�rbild nach morphologischen Operationen

% F�r die morphologischen Operationen muss ein Strukturelement definiert
% werden. Hier wird z.B. folgendes vorgegeben:
%
%      | 0 1 0 |
% SR = | 1 1 1 |
%      | 0 1 0 |
%
SR = strel('diamond', 1);

% Speichere das Bin�rbild in 'Bm'.
Bm = B;

% F�hre morphologische Operation auf 'Bm' aus und speichere sie in 'Bm'.
TODO
