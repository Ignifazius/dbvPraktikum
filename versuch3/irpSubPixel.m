function S = irpSubPixel(H, P)
% S = irpSubPixel(H, P)
% Optimiert alle Höhepunkte auf Subpixel-Genauigkeit.
%
% Parameter:
% 'H'                 2d Hough-Raum
% 'P'                 Mx3 Matrix mit Zeilenvektoren der Form (x,y,value)
%
% Rückgabewerte:
% 'S'                 Mx3 Matrix mit Zeilenvektoren der Form (x,y,value)
[x ~] = size(P);
mx = 0;
my = 0;
sum_x = 0;
sum_y = 0;
for i=1:x
    for j =-3:3
        sum_x = sum_x + P(i,3);
        sum_y = sum_y + P(i,3);
    end
    for j =-3:3
        mx = mx + P(i,1)+j * P(i,3);
        my = my + P(i,2)+j * P(i,3);
    end
    mx = mx/sum_x;
    my = my/sum_y;
    
    rx = round(mx+ P(i,1));
    ry = round(mx+ P(i,2));
    S(i, 1:3) = [rx ry H(ry, rx)];
end


    


% indices mit offset, mit fenster durch bild laufen

















