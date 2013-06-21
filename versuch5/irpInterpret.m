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






























































