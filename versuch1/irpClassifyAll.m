function C = irpClassifyAll(Mh)
% C = irpClassifyAll(Mh)
% Berechnet f�r jede Region die Klasse.
%
% Parameter:
% 'Mh'                Hu-Momente einer Region als Zeilenvektoren
%
% R�ckgabewerte:
% 'C'                 Spaltenvektor mit Klassenzuordnungen. 

% Hole die Anzahl der Regionen.
numRegions = size(Mh, 1);

% Initialisiere die Matrizen.
C = zeros(numRegions, 1);

% Berechne die Klasse f�r jede einzelne Region.
for i = 1:numRegions
    C(i) = irpClassify(Mh(i,:)); 
end
