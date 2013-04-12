function irpTestLabel(Bb)
% irpTestLabel(Bb)
% Testet die Funktion 'irpLabel' und stellt das Labelbild als
% RGB-Bild unterhalb des Binärbildes dar.
%
% Parameter:
% 'Bb'                Binärbild für Bauteile
%
% Rückgabewerte:
% -

% Berechne Labelbild.
Lb = irpLabel(Bb);

% Berechne RGB-Bild aus Labelbild (z.B. per label2rgb).
RGB = label2rgb(Lb);

% Stelle RGB-Bild unterhalb des Binärbildes dar.
figure;
subplot(2,1,1);
imshow(Bb);
subplot(2,1,2);
imshow(RGB);
