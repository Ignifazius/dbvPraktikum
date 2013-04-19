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
P = zeros(numRows,2);
N = zeros(numRows,2);

% Berechne die Pose für jede einzelne Region.
for i=1:numRows
    [P(i,:) N(i,:)] = irpPose(M(i,:), Mu(i,:));
end
