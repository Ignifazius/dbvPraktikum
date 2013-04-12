function irpTestThresholds(I, m, n, p)
% irpTestThreshold(I, m, n, p)
% Testet die Funktion irpThreshold, indem Originalbild, klassifiziertes
% RGB-Bild und Histogramm nebeneinander angezeigt werden.
%
% Parameter:
% 'I'                 Graustufenbild
% 'm'                 Gesamtzahl der Spalten im subplot
% 'n'                 Gesamtzahl der Zeilen im subplot
% 'p'                 Index für nächsten Plot
%
% Rückgabewerte:
% -

% Berechne die Schwellwerte.
[low high] = irpThresholds(I);

% Zeichne das Originalbild.
subplot(n,m,p); % subplot selektieren
p = p + 1; % inkrementiert die aktuelle Position im subplot
imshow(I); % Originalbild darstellen

% Zeichne das RGB-Bild.
subplot(n,m,p); % subplot selektieren
p = p + 1;
RGB = irpThresholdsGray2RGB(I, low, high);
imshow(RGB); % RGB-Bild darstellen

% Zeichne Histogramm.
subplot(n,m,p); % subplot selektieren
imhist(I); % Histogramm darstellen
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


