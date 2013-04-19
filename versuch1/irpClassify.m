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
R = [0.219609106718659,0.158383056300983,0.295730602732405,0.0291141332402029,0.0270149304877296,0.366402284153467,-0.000161533610003771;0.206387033376600,0.148530459812191,0,0,0,0,0;0.223348922216201,0.143937310325963,0.00152214611788045,0.0221721136077351,0.00127677302435907,0.265999477925960,0.00170205758484758;];

% Setze eine initiale Maximaldistanz, die unterschritten werden muss.
% Der Wert sollte einen kleinen Spielraum zulassen, da die Hu-Momente 
% für Objekte derselben Klassen z.B. aufgrund von Rauschen leicht abweichen
% können. Allerdings sollte dieser auch nicht zu hoch sein, um robust
% gegenüber fehlerhaften Etikettierungen zu sein.
d = 0.1;

% Initialisiere Klassenzugehörigkeit.
c = 0;

% Berechne Distanz zu jedem Referenz-Featurevektor und setze die 
% entsprechende Klasse, falls der aktuell beste Distanzwert unterschritten
% wird. Der Distanzwert kann über den 'norm'-Befehl berechnet werden.

for i=1:3
   dist = norm(h-R(i,:));
   
   if dist < d 
      c = i;
      d = dist;
   end
end