function O = irpAbtastung(I, delta_x, delta_y)
% O = irpAbtastung(I, delta_x, delta_y)
% Abtastung von I.
%
% Parameter:
% 'I'                 Bild
% 'delta_x'           Abtastrate in x-Richtung
% 'delta_y'           Abtastrate in y-Richtung
%
% Rückgabewerte:
% 'O'                 Abgetastetes Bild
[size_x size_y] = size(I);
O = zeros(size_x, size_y);
dirac = irpDiracfeld (size_y, size_x, delta_x, delta_y);

for i= 1:size_x
   for j = 1:size_y
       O(i,j) = I(i,j) * dirac(i,j);
   end
end