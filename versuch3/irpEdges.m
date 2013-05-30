function [E O] = irpEdges(I)
% [E O] = irpEdges(I)
% Liefert ein binarisiertes Kantenbild und ein Gradientenwinkelbild zurück.
% 
% Parameter:
% 'I'                 8bit Grauwertbild
% 
% Rückgabewerte:
% 'E'                 Binarisiertes Kantenbild
% 'O'                 Winkel zwischen Gradienten und x-Achse in RAD

SobelX = [1 0 -1; 2 0 -2; 1 0 -1];
SobelY = SobelX';

ISoX = imfilter(I, SobelX);
ISoY = imfilter(I, SobelY);

Etmp = sqrt(ISoX .* ISoX + ISoY .* ISoY);
O = atan2(ISoY, ISoX);

med = mean(mean(Etmp))+80;
Etmp(Etmp<med) = 0.0;
Etmp(Etmp>med) = 1.0;

E = Etmp;
end





