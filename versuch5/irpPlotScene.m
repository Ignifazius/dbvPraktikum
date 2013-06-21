function irpPlotScene(Points, Labels)
% irpPlotScene(Points, Labels)
% Stellt die Punktwolke farblich (in Abhängigkeit von den Labels) in 3d
% dar.
%
% Parameter:
% 'Points'            Mx3 Matrix für Punktwolke (pro Zeile ein 3d Punkt)
% 'Labels'            Mx1 Spaltenvektor mit Labels für jeden Punkt

% Berechne die Anzahl der Regionen und hole die minimale und maximale
% Koordinate.
numRegions = max(Labels)+1;
limmin = min(min(Points));
limmax = max(max(Points));

% Berechne Farbwerte aus den Labels.
ls = ones(numRegions);
ls = cumsum(ls);
RGB = double(label2rgb(ls));
RGB = RGB / 255;
RGB(1,1,:) = [0 0 0];

% Zeichne Punkte.
hold on
for i=1:numRegions
    C = find(Labels == (i-1));
    X = Points(C,1);
    Y = Points(C,2);
    Z = Points(C,3);

    plot3(X, Y, Z, '.', ...
        'MarkerFaceColor', RGB(i,1,:), ...
        'MarkerEdgeColor', RGB(i,1,:));
    
    xlim([limmin limmax]);
    ylim([limmin limmax]);
    zlim([limmin limmax]);
    daspect([1 1 1]);
end
hold off
