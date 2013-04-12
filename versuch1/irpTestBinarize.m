function irpTestBinarize(I, low, high)
% irpTestBinarize(I, low, high)
% Testet die Funktion irpBinarize. Es werden in einem subplot das 
% Ausgangsbild und die beiden Bin�rbilder untereinander dargestellt.
%
% Parameter:
% 'I'                 Grauwertbild
% 'low'               Niedriger Schwellwert
% 'high'              Hoher Schwellwert
%
% R�ckgabewerte:
% -

% Binarisiere das Bild.
[Bb Bs] = irpBinarize(I, low, high);

% Stelle das Ergebnis dar.
figure;
subplot(1,2,1);
imshow(Bb);
subplot(1,2,2);
imshow(Bs);
