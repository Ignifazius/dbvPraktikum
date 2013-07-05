function [S P L] = irpInterpret(Points, iter, eps, minNum)
% [S P L] = irpInterpret(Points, iter, eps, minNum)
% Interpretiert die Szene, indem Kugeln und Ebenen in die 3d Punktwolke per
% RANSAC hineingefittet werden.
%
% Parameter:
% 'Points'            Mx3 Matrix für Punktwolke (pro Zeile ein Punkt)
% 'iter'              Maximale Zahl an Iterationen
% 'eps'               Größe der Epsilon-Umgebung für Kontaktberechnung
% 'minNum'            Minimale Anzahl an Kontaktpunkten pro Geometrie
%
% Rückgabewerte:
% 'S'                 Nx5 Matrix beschreibt alle gefundenen Kugeln jeweils
%                     als Zeilenvektor: (cx, cy, cz, r, N)
%                     N gibt die Anzahl der Kontaktpunkte an.
% 'P'                 Kx5 Matrix beschreibt alle gefundenen Ebenen jeweils
%                     als Zeilenvektor: (nx, ny, nz, d, K)
%                     K gibt die Anzahl der Kontaktpunkte an.
% 'L'                 Spaltenvektor mit einem Label für jeden 3d Punkt.



% Idee: beste berechnen, alle zugehörigen punkte entfernen (bzw labeln), nochmal suchen

Labels = zeros(size(Points, 1), 1);
labelindex = 1;

P =[]; S=[];

for i=1:iter
    OwnPoints = Points((Labels == 0),:);
    
    if (size(OwnPoints,1) < minNum)
        break;
    end
    
    
    % 's'                 1x4 Vektor (cx, cy, cz, r) beschreibt Kugel
    % 'num'               Anzahl der Kontaktpunkte
    % 'C'                 (num x 1) Vektor mit Indizes der Kontaktpunkte
    %     ISMEMBER(A,S,'rows') when A and S are matrices with the same
    %     number of columns returns a vector containing 1 where the rows of
    %     A are also rows of S and 0 otherwise.
    
    [p_plane num_plane C_plane] = irpBestPlane(OwnPoints, iter, eps);
    
    [s_sphere num_sphere C_sphere] = irpBestSphere(OwnPoints, iter, eps);
    
    if num_plane > num_sphere
        if num_plane > minNum
            P = [P;p_plane num_plane];
            ind = ismember(Points,OwnPoints(C_plane,:),'rows');
            Labels(ind) = labelindex;
            labelindex = labelindex + 1;
        end
    else
        if num_sphere > minNum
            S = [S;s_sphere num_sphere];
            ind = ismember(Points,OwnPoints(C_sphere,:),'rows');
            Labels(ind) = labelindex;
            labelindex = labelindex + 1;
        end
    end
    
end
L = Labels;

