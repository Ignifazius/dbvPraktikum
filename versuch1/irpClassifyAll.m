function C = irpClassifyAll(Mh)
% C = irpClassifyAll(Mh)
% Berechnet für jede Region die Klasse.
%
% Parameter:
% 'Mh'                Hu-Momente einer Region als Zeilenvektoren
%
% Rückgabewerte:
% 'C'                 Spaltenvektor mit Klassenzuordnungen. 

% Hole die Anzahl der Regionen.
numRegions = size(Mh, 1);

% Initialisiere die Matrizen.
C = zeros(numRegions, 1);

% Berechne die Klasse für jede einzelne Region.
for i = 1:numRegions
    C(i) = irpClassify(Mh(i,:)); 
end
