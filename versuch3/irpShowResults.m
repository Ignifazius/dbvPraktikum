function irpShowResults(P1, P2, r1, r2, I)
% irpShowResults(P1, P2, r1, r2, I)
% Stellt die Ergebnisse dar.
%
% Parameter:
% 'P1'                Mx3 Matrix mit Zeilenvektoren in der Form (x,y,value)
% 'P2'                Nx3 Matrix mit Zeilenvektoren in der Form (x,y,value)
% 'r1'                Radius für Bohrungen vom Typ 1
% 'r2'                Radius für Bohrungen vom Typ 2
% 'I'                 Grauwertbild
%
% Rückgabewerte:
% -

% Hole die Anzahl der Höhepunkte.
numPeaks1 = size(P1,1);
numPeaks2 = size(P2,1);

% Initialisiere RGB-Kanäle.
R = I;
G = I;
B = I;

% Zeichne Kreise für Bohrungen vom Typ 1 ein.
for i = 1:numPeaks1,
  C = irpCircle(P1(i,1), P1(i,2), 0, r1, pi, size(I));
  R(C) = 255;
  G(C) = 0;
  B(C) = 0;
end

% Zeichne Kreise für Bohrungen vom Typ 2 ein.
for i = 1:numPeaks2,
  C = irpCircle(P2(i,1), P2(i,2), 0, r2, pi, size(I));
  R(C) = 0;
  G(C) = 255;
  B(C) = 0;
end

% Füge RGB-Kanäle zusammen und stelle Bild dar.
RGB = cat(3, R, G, B);
imshow(RGB);

% Zeichne zusätzlich noch Marker ein.
hold on;
for i = 1:numPeaks1,
  x = P1(i,1);
  y = P1(i,2);
  plot(x, y, 'kx',...
             'MarkerEdgeColor','r',...
             'MarkerSize', 8, 'LineWidth', 2);
end
for i=1:numPeaks2,
  x = P2(i,1);
  y = P2(i,2);
  plot(x, y, 'kx',...
             'MarkerEdgeColor','g',...
             'MarkerSize', 8, 'LineWidth', 2);
end
hold off;
