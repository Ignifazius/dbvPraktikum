function C = irpOCR(I, T)
% C = irpOCR(I, T)
% Bestimmt die Korrelationsfunktion von I und T.
%
% Parameter:
% 'I'                 Eingabebild
% 'T'                 Template
%
% Rückgabewerte:
%  'C'                Korrelationsfunktion

% Hinweis: In welchem Wertebereich und Datentyp müssen 'I' und 'T' 
% vorliegen bzw. gebracht werden, damit eine korrekte Korrelation 
% möglich ist?

%I = rgb2gray(I);
T = imrotate(T,180);

% einheitliche Definitionsmenge
[size_Ix, size_Iy] = size(I);
[size_Tx, size_Ty] = size(T);

I2 = ones(size_Ix + size_Tx, size_Iy + size_Ty)*255;
T2 = ones(size_Ix + size_Tx, size_Iy + size_Ty)*255;

I2(1:size_Ix, 1:size_Iy) =  I;
T2(1:size_Tx, 1:size_Ty) =  T;

% Multiplikation im Ortsfrequenzbereich

com_i = fft2(I2);
com_t = fft2(T2);

C = ifft2(com_i .* com_t);












