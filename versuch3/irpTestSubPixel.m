function irpTestSubPixel(H, p, s)
% irpTestSubPixel(H, p, s)
% Stellt einen Ausschnitt von 'H' vergrößert dar und zeichnet 'p' als rotes
% Kreuz sowie 's' als grünes Kreuz ein.
%
% Parameter:
% 'H'                 2d Hough-Raum
% 'p'                 3d Zeilenvektor der Form (x,y,value)
% 's'                 3d Zeilenvektor der Form (x,y,value)
%
% Rückgabewerte:
% -

% Initialisiere einige Variablen.
sizex = size(H,2);       % Anzahl der Pixel von 'H' in x-Richtung
sizey = size(H,1);       % Anzahl der Pixel von 'H' in y-Richtung
m = 40;                  % Vergrößerungsstufe
b = 200;                 % Größe des Bildes: b*2+1
I = zeros(b*2+1, b*2+1); % Zielbild

% Zeichne vergrößerten Bildausschnitt.
for x=-b:b
    for y=-b:b
        hx = uint32(p(1) + x / m);
        hy = uint32(p(2) + y / m);
        if hx > 0 && hx <= sizex && hy > 0 && hy <= sizey
            I(y+b+1, x+b+1) = H(hy, hx);
        end
    end
end

% Stelle Bild dar.
imshow(I, []);

% Berechne Markerpositionen.
px = b+1;
py = b+1;
sx = round((s(1)-p(1)) * m + b + 1);
sy = round((s(2)-p(2)) * m + b + 1);

% Zeichne Marker ein.
hold on
plot(px, py, 'kx',...
        'MarkerEdgeColor','r',...
        'MarkerSize', 8, 'LineWidth', 2);
plot(sx, sy, 'kx',...
        'MarkerEdgeColor','g',...
        'MarkerSize', 8, 'LineWidth', 2);
hold off
