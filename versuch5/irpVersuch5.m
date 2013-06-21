%% Parameter für Testszene 1
% - Szene besteht nur aus einer Ebene.
% - Sichteinschränkung des Sensors wird ignoriert.
num = 500;
P = [irpGetVecNormalized([1 1 2]) 4 num];  %irpGetVecNormalized bringt den Normalenvektor auf Länge 1
S = zeros(0,5);
B = [-5 -5 -5; 5 5 5];
f = [0 0 0];

%% Parameter für Testszene 2
% - Szene besteht aus drei Ebenen.
% - Sichteinschränkung des Sensors wird ignoriert.
P = [irpGetVecNormalized([1 1 1]) 2 400;...
    irpGetVecNormalized([1 0 0]) 2 300;...
    irpGetVecNormalized([0 1 3]) 3 200];
S = zeros(0,5);
B = [-5 -5 -5; 5 5 5];
f = [0 0 0];

%% Parameter für Testszene 3
% - Szene besteht nur aus einer Kugel.
% - Sichteinschränkung des Sensors wird ignoriert.
num = 500;
P = zeros(0,5);
S = [-2 3 1.5 1 num];
B = [-5 -5 -5; 5 5 5];
f = [0 0 0];

%% Parameter für Testszene 4
% - Szene besteht aus drei Kugeln.
% - Sichteinschränkung des Sensors wird ignoriert.
P = zeros(0,5);
S = [-2 3 1.5 1 400;...
    4 1 2 2 300;...
    0 -3 0 3 200];
B = [-10 -10 -10; 10 10 10];
f = [0 0 0];

%% Parameter für Testszene 5
% - Szene besteht aus drei Ebenen und einer Kugel
% - Sichteinschränkung des Sensors wird ignoriert.
num = 500;
P = [irpGetVecNormalized([0 0 1]) 0 num; ...
     irpGetVecNormalized([0 1 0]) 0 num; ...
     irpGetVecNormalized([1 0 0]) 0 num];
S = [3 4 5 1 num];
B = [0 0 0; 10 10 10];
f = [0 0 0];

%% Parameter für Testszene 6
% - Szene besteht aus drei Ebenen und zwei Kugeln
% - Sichtbeschränkung des Sensors wird berücksichtigt
num = 500;
P = [irpGetVecNormalized([0 0 1]) 0 num; ...
     irpGetVecNormalized([0 1 0]) 0 num; ...
     irpGetVecNormalized([1 0 0]) 0 num];
S = [5 4 3 3 num;...
    2 6 4 1.5 num;];
B = [0 0 0; 10 10 10];
f = [15 15 10];

%% Erstellen einer Testszene.
[Points, S2, P2] = irpGenScene(S, P, B, f);
Labels = zeros(size(Points, 1), 1);

%% Füge Rauschen hinzu und setze das Epsilon für die Kontaktumgebung.
noise = 0.25;
eps = noise * 100;
if (eps == 0)
    eps = 1;
end
Points = irpAddNoise(Points, noise);
%% Interpretiere Szene.
iter = 
minNum = 
[S3 P3 Labels] = irpInterpret(Points, iter, eps, minNum);
S3
P3

%% Stelle Szene dar.
irpPlotScene(Points, Labels);
