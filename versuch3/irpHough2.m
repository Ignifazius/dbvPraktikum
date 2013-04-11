function H = irpHough2(B, O, r, alpha)
% H = irpHough(B, O, r, alpha)
% Berechnet einen 2d Hough-Raum 'H' für Kreise mit Radius 'r' mit Hilfe
% eines binarisiertes Bildes 'B'. Zusätzlich wird für jeden Kantenpunkt
% eine Gradientenrichtung durch 'O' angegeben. Diese werden genutzt, um 
% nicht einen vollständigen Kreis zu zeichnen, sondern zwei Kreissegmente. 
% Die Größe eines Kreissegmentes ist mittels 'alpha' einstellbar.
%
% Parameter:
% 'B'                 Binarisiertes Bild
% 'O'                 Gradientenwinkel zur x-Achse für jeden Pixel
% 'r'                 Radius der Kreise
% 'alpha'             Jeweilige Größe der beiden Kreissegmente in RAD
%
% Rückgabewerte:
% 'H'                 2d Hough-Raum













