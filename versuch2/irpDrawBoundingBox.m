function RGB = irpDrawBoundingBox(I, x, y, dx, dy, t, col_R, col_G, col_B)
% RGB = DrawBoundingBox(I, x, y, dx, dy, t, col_R, col_G, col_B)
% Zeichnet ein umschreibendes Rechteck ins Bild I.
%
% Parameter:
% 'I'                 Grauwertbild
% 'x'                 x-Koordinate der oberen linken Ecke
% 'y'                 y-Koordinate der oberen linken Ecke
% 'dx'                Rechteckgröße in x-Richtung
% 'dy'                Rechteckgröße in y-Richtung
% 't'                 Kantenbreite
% 'col_R'             Farbwert der Kante (Rot-Anteil)
% 'col_G'             Farbwert der Kante (Grün-Anteil)
% 'col_B'             Farbwert der Kante (Blau-Anteil)
%
% Rückgabewerte:
% 'RGB'               Ausgabebild

B = uint8(I);
G = uint8(I);
R = uint8(I);

R(y:y+dy+t,x:x+t)       =col_R;
R(y:y+dy+t,x+dx:x+dx+t) =col_R;
R(y:y+t,x:x+dx+t)       =col_R;
R(y+dy:y+dy+t,x:x+dx+t) =col_R;

G(y:y+dy+t,x:x+t)       =col_G;
G(y:y+dy+t,x+dx:x+dx+t) =col_G;
G(y:y+t,x:x+dx+t)       =col_G;
G(y+dy:y+dy+t,x:x+dx+t) =col_G;

B(y:y+dy+t,x:x+t)       =col_B;
B(y:y+dy+t,x+dx:x+dx+t) =col_B;
B(y:y+t,x:x+dx+t)       =col_B;
B(y+dy:y+dy+t,x:x+dx+t) =col_B;

RGB = cat(3, R, G, B);
