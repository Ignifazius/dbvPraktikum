% Skript-Datei f�r Versuch 0 des Bildverarbeitungs-Praktikums

clear all;
%%%%%% ERSTER AUFGABENTEIL: Arbeiten mit Matrizen
%% (a) 
M = [0 0 0 0 2 0 0 0 0;0 0 0 0 3 0 0 0 0;1 1 2 3 4 3 2 1 1;0 0 0 0 3 0 0 0 0;0 0 0 0 2 0 0 0 0];



%% (b)

N = zeros(5,9);
for i=1:5
    N(i,i) = 1;
end

K = M + N;

%% (c)
K_3 = 3*K;

%% (d)
K_3(4,8) = 1000;


%% (e)
K_3(2:4, 4:6) = 5.8;


%% (f)
for i=4:5
    for j=1:4
        K_3(i,j) = i*j;
    end
end


%%%%% ZWEITER AUFGABENTEIL: Arbeiten mit Bildern
%% (a) Nullmatrix erstellen
A = zeros(240,320);

%% (b) Rechteck einf�gen und als Bin�rbild anzeigen
A(1:5, 310:320) = 1;

%% (c) Bild laden und anzeigen
Cap1 = imread('capture1.bmp');
imshow(Cap1);

%% (d) Bild in Graubild umwandeln und anzeigen
I = rgb2gray(Cap1);
imshow(I);

%% (e) Bild aufnehmen und anzeigen


%% (f) Bild speichern


%% (g) Bild an Hauptdiagonale spiegeln und anzeigen


%% (h) Histogramm erstellen und zusammen mit dem Bild in zwei Fenstern anzeigen


%% (i) Festen Grauwert addieren und Histogramm und Bild in einem Fenster anzeigen


%% (j) Kontrastspreizung und wieder Histogramm und Bild in einem Fenster anzeigen
