function O = irpDrawCircle(I, ctr_x, ctr_y, r, value)
%  O = irpDrawCircle(I, ctr_x, ctr_y, r, value)
% Zeichnet einen ausgefüllten Kreis ins Bild I.
%
% Parameter:
% 'I'                 Eingabebild
% 'ctr_x'             Bildmittelpunkt in x-Richtung
% 'ctr_y'             Bildmittelpunkt in y-Richtung
% 'r'                 Radius
% 'value'             Wert, auf den alle Punkte Element des
%                     Kreises gesetzt werden.
%
% Rückgabewerte:
% 'O'                 Ausgabebild

[size_y size_x] = size(I);
O = I;
for x=0:size_x
    for y=0:size_y
        if ( sqrt( (ctr_x - x) * (ctr_x - x) + (ctr_y - y) * (ctr_y - y) ) < r )
            O(y,x) = value;
        end
    end
end
