function [P N] = irpPoseAll(M, Mu)
% [P N] = irpPoseAll(M, Mu)
% Berechnet für jede der insgesamt R Regionen die Pose.
%
% Parameter:
% 'M'                 Momente einer Region als Zeilenvektoren 
% 'Mu'                Zentralmomente einer Region als Zeilenvektoren
%
% Rückgabewerte:
% 'P'                 Rx2 Matrix mit 2d-Zeilenvektoren für Position. 
% 'N'                 Rx2 Matrix mit 2d-Zeilenvektoren für Orientierung.


% Hole die Anzahl der Regionen.
numRows = size(M, 1);

% Initialisiere die Matrizen.
P = zeros(
N = zeros(

% Berechne die Pose für jede einzelne Region.
for
    TODO
end
