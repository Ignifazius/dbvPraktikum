function H = irpHough2(B, O, r, alpha)
% H = irpHough(B, O, r, alpha)
% Berechnet einen 2d Hough-Raum 'H' f�r Kreise mit Radius 'r' mit Hilfe
% eines binarisierten Bildes 'B'. Zus�tzlich wird f�r jeden Kantenpunkt
% eine Gradientenrichtung durch 'O' angegeben. Diese werden genutzt, um
% nicht einen vollst�ndigen Kreis zu zeichnen, sondern zwei Kreissegmente.
% Die Gr��e eines Kreissegmentes ist mittels 'alpha' einstellbar.
%
% Parameter:
% 'B'                 Binarisiertes Bild
% 'O'                 Gradientenwinkel zur x-Achse f�r jeden Pixel
% 'r'                 Radius der Kreise
% 'alpha'             Jeweilige Gr��e der beiden Kreissegmente in RAD
%
% R�ckgabewerte:
% 'H'                 2d Hough-Raum

[numrow numcol] = size(B);
Htmp = zeros(numrow, numcol);

for x =1:numcol
    for y=1:numrow
        if B(y,x) == 0
            continue;
        end;
        angle = O(y,x);
        C = irpCircle(x, y, angle, r, alpha, size(Htmp));
        Htmp(C) = Htmp(C) + 1;
    end
end

H = Htmp;













