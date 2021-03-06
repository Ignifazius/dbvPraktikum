function RGB = irpThresholdsGray2RGB(I, low, high)
% RGB = irpThresholdsGray2RGB(I, low, high)
% Konvertiert ein Graustufenbild in ein RGB-Bild mit folgenden
% Farbwerten (R,G,B): 
% - (0,   0,  255) Hintergrund (blau)
% - (0,   255,  0) Bauteile (gr�n) 
% - (255, 0,    0) Schlitten (rot)
% - (0,   0,    0) Sonst (schwarz)   
%
% Parameter:
% 'I'                 Graustufenbild
% 'low'               Niedriger Schwellwert
% 'high'              Hoher Schwellwert
%
% R�ckgabewerte:
% 'RGB'               Klassifiziertes RGB-Bild

% Erstelle Farbbild.
% Die Farbkan�le werden zuerst getrennt erstellt und dann zusammengef�hrt.
% 1. Tipp: Logische Operatoren lassen sich auf Matrizen anwenden. Bsp.:
%    A = [1 2; 3 4];
%    A > 2 liefert das 'Bin�rbild' [0 0; 1 1]
% 2. Tipp: Verkn�pfung von Bin�rbildern z.B. �ber .*
% 3. Tipp: Multiplikation mit einem Skalar. Bsp.:
%    B = [0 1; 1 1];
%    B * 255 liefert die Matrix [0 255; 255 255];
B = (I < low)*255;
G = ((I > low).*(I < high)) *255;
R = (I > high)*255;
RGB = cat(3, R, G, B);
