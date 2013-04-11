function irpShowResults(P, N, C, Mh, Lb, Bs, I)
% irpShowResults(P, N, C, Mh, Lb, Bs, I)
% Stellt die Ergebnisse dar.
%
% Parameter:
% 'P'                 Kx2 Matrix mit Bauteilpositionen
% 'N'                 Kx2 Matrix mit Bauteilorientierungen
% 'C'                 K dim. Spaltenvektor mit Bauteilklassen
% 'Mh'                Kx7 Matrix mit Hu-Momenten
% 'Lb'                Labelbild für Bauteile
% 'Bs'                Binärbild für Schlitten
% 'I'                 Quellbild
%
% Rückgabewerte:
% -

% Hole die Anzahl der Regionen.
numRows = size(P, 1);

% Erstelle für jede Klasse eine eigene Farbe.
colors = [0.5 0.5 0.5; ... % Hintergrund
          1.0 0.5 0.0; ... % Klasse 1
          0.0 0.8 0.5; ... % Klasse 2
          0.0 0.5 1.0; ... % Klasse 3
          0.8 0.9 0.8];    % Schlitten

% Überprüfe Einträge in C.
for i=1:numRows
    if (C(i) < 0 || C(i) > 3)
        C(i) = 0;
    end
end

% Erstelle colormap für die Umwandlung in RGB-Bild.
colormap = zeros(256+numRows+1, 3);
% Für das Quellbild:
for i=0:255
   % Hier wird durch 256 (und nicht 255) geteilt,
   % um die ZEROCOLOR-Warning zu vermeiden.
   colormap(i+1,:) = [i/256.0 i/256.0 i/256.0];  
end
% Für die Bauteile:
for i=1:numRows
   colormap(i+256,:) = colors(C(i)+1,:); 
end
% Für den Schlitten:
colormap(numRows+1+256,:) = colors(5,:);

% Kombiniere Ursprungsbild, Labelbild für Bauteile
% und Binärbild des Schlittens zu neuem Labelbild.
L = ones(size(I));%uint16(I)+1;
L(Bs > 0) = 256+numRows+1;
L(Lb > 0) = Lb(Lb > 0) + 256;

% Konvertiere Labelbild in RGB-Bild.
RGB = label2rgb(L, colormap);

% Zeige RGB-Bild.
imshow(RGB);

% Zeichne alle Marker in das Bild ein.
hold on
for i=1:numRows
    % Berechne Markerpositionen.
    x = P(i, 1);
    y = P(i, 2);
    a = N(i, 1);
    b = N(i, 2);
    s = 50;
    %if a > 0, s = -s; end; % Pfeil zeigt möglichst nach links
    X = [x - a * s; x + a * s];
    Y = [y - b * s; y + b * s];
    
    % Zeichne Marker.
    if C(i) > 0
        plot(X, Y,'-', ...
            'Color', [0.2 0.2 0.2],...
            'MarkerFaceColor','w',...
            'MarkerEdgeColor','k');
    end
    plot(x, y, 'ko',...
        'MarkerFaceColor','w',...
        'MarkerEdgeColor','k',...
        'MarkerSize', 8, 'LineWidth', 2);
    if C(i) == 0
        plot(x, y, 'kx',...
            'MarkerEdgeColor','r',...
            'MarkerSize', 8, 'LineWidth', 2);
    end
    
    % Erstelle Textbaustein.
    str = strcat(num2str(i), '-');
    str = strcat(str, num2str(C(i)));

    % Zeichne Text.      
    if C(i) > 0, text(x+10, y, str); end
end
hold off

% Gebe Objekteeigenschaften als Text aus.
disp('-------------------- Ergebnisse für Versuch1 --------------------');
disp('Objektklasse (c), Position (x,y) und Orientierung (u,v):');
str = sprintf('id  c  x      y      u      v');
disp(str);
for i=1:numRows
    str = sprintf('%2d  %1d  %3.1f  %3.1f  %+1.2f  %+1.2f',...
        i, C(i), P(i,1), P(i,2), N(i,1), N(i,2));
    disp(str);
end
disp(' ');
disp('Hu-Momente:');
str = sprintf('id  1        2        3        4        5        6        7');
disp(str);
for i=1:numRows
    str = sprintf('%2d  %+1.4f  %+1.4f  %+1.4f  %+1.4f  %+1.4f  %+1.4f  %+1.4f',...
        i, Mh(i,1), Mh(i,2), Mh(i,3), Mh(i,4), Mh(i,5), Mh(i,6) ,Mh(i,7));
    disp(str);
end
disp('-----------------------------------------------------------------');
 