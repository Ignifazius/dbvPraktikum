function [P N] = irpPoseAll(M, Mu)
% [P N] = irpPoseAll(M, Mu)
% Berechnet f�r jede der insgesamt R Regionen die Pose.
%
% Parameter:
% 'M'                 Momente einer Region als Zeilenvektoren 
% 'Mu'                Zentralmomente einer Region als Zeilenvektoren
%
% R�ckgabewerte:
% 'P'                 Rx2 Matrix mit 2d-Zeilenvektoren f�r Position. 
% 'N'                 Rx2 Matrix mit 2d-Zeilenvektoren f�r Orientierung.


% Hole die Anzahl der Regionen.
numRows = size(M, 1);

% Initialisiere die Matrizen.
P = zeros(
N = zeros(

% Berechne die Pose f�r jede einzelne Region.
for
    TODO
end
