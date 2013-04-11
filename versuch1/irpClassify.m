function c = irpClassify(h)
% c = irpClassify(h)
% Berechnet die Klasse der Region mit Hilfe der Hu-Momente.
%
% Parameter:
% 'h'                 7d Zeilenvektor mit Hu-Momenten
%
% R�ckgabewerte:
% 'c'                 Index der Klasse

% Setze manuell die Referenz-Featurevektoren f�r jede Klasse.
R = [0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000;...
     0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000;...
     0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000];

% Setze eine initiale Maximaldistanz, die unterschritten werden muss.
% Der Wert sollte einen kleinen Spielraum zulassen, da die Hu-Momente 
% f�r Objekte derselben Klassen z.B. aufgrund von Rauschen leicht abweichen
% k�nnen. Allerdings sollte dieser auch nicht zu hoch sein, um robust
% gegen�ber fehlerhaften Etikettierungen zu sein.
d = 

% Initialisiere Klassenzugeh�rigkeit.
c = 0;

% Berechne Distanz zu jedem Referenz-Featurevektor und setze die 
% entsprechende Klasse, falls der aktuell beste Distanzwert unterschritten
% wird. Der Distanzwert kann �ber den 'norm'-Befehl berechnet werden.
TODO
