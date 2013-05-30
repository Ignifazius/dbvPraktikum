function H = irpHough(B, r)
% H = irpHough(B, r)
% Berechnet einen 2d Hough-Raum 'H' für Kreise mit Radius 'r' mit Hilfe
% eines binarisierten Bildes 'B'.
%
% Parameter:
% 'B'                 Binarisiertes Bild
% 'r'                 Radius der Kreise
%
% Rückgabewerte:
% 'H'                 2d Hough-Raum
[numrow, numcol] = size(B);
H = zeros(numrow, numcol);

for i = 1: numrow
   for j= 1: numcol
       if B(i,j) == 1
       [ C ] = irpCircle(j, i, 0, r, pi, [numrow, numcol]);
       H(C) = H(C) +1;
       end
   end
end















