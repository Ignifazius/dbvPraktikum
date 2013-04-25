%% Setze einige Variablen.
% 'I' muss bekannt und ein Grauwertbild sein.
I = imread('testmuster3cn.bmp');
%I = rgb2gray(imread('testmuster3c.bmp'));
doTest    = 0;       % Führe Tests aus? 0 (nein), 1 (ja)
noise     = 1;       % Stärke des Rauschfilters: 
                     % 0 (aus), 1 (leicht), 2 (stark)
algorithm = 2;       % Auswahl des Filterverfahrens
                     % 1 (Average), 2 (Median)
morph     = 1;       % Stärke der morphologischen Filteroperation:
                     % 0 (aus), 1 (leicht), 2 (stark)

%% Filtere das Ausgangsbild.
if doTest, irpTestFilter(I, noise); end;
F = irpFilter(I, noise, algorithm);

%% Berechne automatisch die Schwellwerte.
if doTest, irpTestThresholds(F, 1, 3, 1); end;
[low high] = irpThresholds(F);

%% Binarisiere die Bilder.
if doTest, irpTestBinarize(F, low, high); end;
[Bb Bs] = irpBinarize(F, low, high);

%% Führe morphologische Operationen aus.
if doTest, irpTestMorph(Bb, Bs, morph); end;
Bb = irpMorph(Bb, morph);
Bs = irpMorph(Bs, morph);

%% Etikettiere das Binärbild für die Bauteile.
if doTest, irpTestLabel(Bb); end;
Lb = irpLabel(Bb);

%% Berechne Momente für Objekte.
[M, Mu, Mh] = irpMomentsAll(Lb);

%% Berechne Posen aller Objekte.
[P N] = irpPoseAll(M, Mu);

%% Klassifiziere alle Objekte.
C = irpClassifyAll(Mh);

%% Stelle die Ergebnisse dar.
irpShowResults(P, N, C, Mh, Lb, Bs, I);
