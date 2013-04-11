function R = irpCut(H, cx, cy, r)
% R = irpCut(H, cx, cy, r)
% Schneidet eine kreisrunde Fläche aus dem Hough-Raum heraus bzw. setzt
% innerhalb einer kreisrunden Fläche alle Werte auf null.
%
% Parameter:
% 'H'                 2d Hough-Raum
% 'cx'                x-Koordinate des Kreismittelpunktes
% 'cy'                y-Koordinate des Kreismittelpunktes
%
% Rückgabewerte:
% 'R'                 Modifizierter Hough-Raum

% Kopiere Hough-Raum.
R = H;

% Initialisiere einige Variablen.
[sy sx] = size(H);
minx = floor(cx-r);
miny = floor(cy-r);
maxx = ceil(cx+r);
maxy = ceil(cy+r);
rr = r^2;

% Überprüfe Grenzen.
if minx < 1, minx = 1; end
if miny < 1, miny = 1; end
if maxx > sx, maxx = sx; end
if maxy > sy, maxy = sy; end

% Setze Pixel innerhalb des Kreises auf null.
for x=minx:maxx
    for y=miny:maxy
        dd = (x-cx)^2 + (y-cy)^2;
        if dd <= rr
            R(y, x) = 0; 
        end
    end
end
