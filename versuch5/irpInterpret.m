function [S P L] = irpInterpret(Points, iter, eps, minNum)
% [S P L] = irpInterpret(Points, iter, eps, minNum)
% Interpretiert die Szene, indem Kugeln und Ebenen in die 3d Punktwolke per
% RANSAC hineingefittet werden.
%
% Parameter:
% 'Points'            Mx3 Matrix f�r Punktwolke (pro Zeile ein Punkt)
% 'iter'              Maximale Zahl an Iterationen
% 'eps'               Gr��e der Epsilon-Umgebung f�r Kontaktberechnung
% 'minNum'            Minimale Anzahl an Kontaktpunkten pro Geometrie
%
% R�ckgabewerte:
% 'S'                 Nx5 Matrix beschreibt alle gefundenen Kugeln jeweils
%                     als Zeilenvektor: (cx, cy, cz, r, N)
%                     N gibt die Anzahl der Kontaktpunkte an.
% 'P'                 Kx5 Matrix beschreibt alle gefundenen Ebenen jeweils
%                     als Zeilenvektor: (nx, ny, nz, d, K)
%                     K gibt die Anzahl der Kontaktpunkte an.
% 'L'                 Spaltenvektor mit einem Label f�r jeden 3d Punkt.






























































