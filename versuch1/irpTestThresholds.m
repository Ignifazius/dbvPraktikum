function irpTestThresholds(I, m, n, p)
% irpTestThreshold(I, m, n, p)
% Testet die Funktion irpThreshold, indem Originalbild, klassifiziertes
% RGB-Bild und Histogramm nebeneinander angezeigt werden.
%
% Parameter:
% 'I'                 Graustufenbild
% 'm'                 Gesamtzahl der Spalten im subplot
% 'n'                 Gesamtzahl der Zeilen im subplot
% 'p'                 Index f�r n�chsten Plot
%
% R�ckgabewerte:
% -

% Berechne die Schwellwerte.
[low high] = 

% Zeichne das Originalbild.
TODO % subplot selektieren
p = p + 1; % inkrementiert die aktuelle Position im subplot
TODO % Originalbild darstellen

% Zeichne das RGB-Bild.
TODO % subplot selektieren
p = p + 1;
RGB = 
TODO % RGB-Bild darstellen

% Zeichne Histogramm.
TODO % subplot selektieren
TODO % Histogramm darstellen
ylim([0 4000]);

% Zeichne Schwellwerte in das Histogramm.
hold on
C = [low; high];
R = [C, zeros(2,1)];
plot(R(:,1), R(:,2),'kx',...
     'MarkerSize',12,'LineWidth',2)
plot(R(:,1), R(:,2),'ko',...
     'MarkerSize',12,'LineWidth',2)
hold off


