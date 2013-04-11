function c = irpClassify(h)
% c = irpClassify(h)
% Berechnet die Klasse der Region mit Hilfe der Hu-Momente.
%
% Parameter:
% 'h'                 7d Zeilenvektor mit Hu-Momenten
%
% Rückgabewerte:
% 'c'                 Index der Klasse

% Setze manuell die Referenz-Featurevektoren für jede Klasse.
R = [0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000;...
     0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000;...
     0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000];

% Setze eine initiale Maximaldistanz, die unterschritten werden muss.
% Der Wert sollte einen kleinen Spielraum zulassen, da die Hu-Momente 
% für Objekte derselben Klassen z.B. aufgrund von Rauschen leicht abweichen
% können. Allerdings sollte dieser auch nicht zu hoch sein, um robust
% gegenüber fehlerhaften Etikettierungen zu sein.
d = 

% Initialisiere Klassenzugehörigkeit.
c = 0;

% Berechne Distanz zu jedem Referenz-Featurevektor und setze die 
% entsprechende Klasse, falls der aktuell beste Distanzwert unterschritten
% wird. Der Distanzwert kann über den 'norm'-Befehl berechnet werden.
TODO
