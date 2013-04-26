function D = irpDiracFeld(size_y, size_x, delta_x, delta_y)
% D = irpDiracFeld(size_y, size_x, delta_x, delta_y)
% Erstellt ein Diracfeld.
%
% Parameter:
% 'size_x'            Größe des Diracfeldes in x-Richtung
% 'size_y'            Größe des Diracfeldes in y-Richtung
% 'delta_x'           Abtastrate in x-Richtung
% 'delta_y'           Abtastrate in y-Richtung
%
% Rückgabewerte:
% 'D'                 Diracfeld

D = zeros(size_x, size_y);

for i=1:delta_x:size_x
    for j=1:delta_y:size_y
         D(i,j) = 1;
    end
end

