%% Fouriertransformation 
%% 1.a) - 1.c)


% Laden von 'Lena.bmp' und iRP-Logo.bmp'. 
I1 = rgb2gray(imread('Lena.bmp'));
I2 = imread('iRP-Logo.bmp');


% Visualisierung der Amplituden- und Phasenspektren.
% Hinweis: imshow(I, []) kann recht nützlich sein.
[amp, pha] = irpFFT(I1);
figure(1);
subplot(3,3,1);
imshow(I1);
subplot(3,3,2);
imshow(log2(fftshift(amp)), []);
subplot(3,3,3);
imshow((pha), []);


[amp2, pha2] = irpFFT(I2);
figure;
subplot(3,1,1);
imshow(I2);
subplot(3,1,2);
imshow(log2(fftshift(amp2)), []);
subplot(3,1,3);
imshow((pha2), []);


%% 1.d)

% Amplitudenspektrum auf Konstante setzen.
[m,n] = size(amp);
ampConst = ones(m,n) * 100;

% Visualisierung des Amplituden- und Phasenspektrums.
figure(1);
subplot(3,3,4);
imshow(irpInverseFFT(ampConst, pha), []);


% Phasenspektrum auf Konstante setzen.
[m,n] = size(pha);
phaConst = ones(m,n) * 100;


% Visualisierung des Amplituden- und Phasenspektrums.
figure(1);
subplot(3,3,7);
imshow(irpInverseFFT(amp, phaConst), []);


%% 1.e)

% Phasenspektren vertauschen.
tmp1 = pha;
pha = pha2;
pha2 = tmp1;

% Visualisierung der Amplituden- und Phasenspektren.
figure(1);
subplot(3,3,8);
imshow(irpInverseFFT(amp, pha), []);
subplot(3,3,9);
imshow(irpInverseFFT(amp2, pha2), []);




%% Hoch- und Tiefpassfilterung
%% 2.a) - 2.b)

% Hoch - und Tiefpassfilterung mehrerer Testbilder.



% Visualisierung der Ergebnisse.



%% 2.c)

% Addition von Bildrauschen.



% Visualisierung der verrauschten Bilder.



%% 2.d)

% Tiefpassfilterung.



% Visualisierung der Ergebnisse.



%% Abtastung
%% 3.a) - 3.c)

% Laden von 'Sonnet_for_Lena.bmp'.



% Abtastung mit unterschiedlichen Abtständen delta_x und delta_y.



% Visualisierung der abgetasteten Bilder.



%% 3.d)

% Visualisierung der Spektren der abgetasteten Bilder.



%% 3.f)

% Rekonstruktion des abgetasteten Bildes durch Tiefpassfilterung.



% Visualisierung des Ergebnisses.



%% Ausrichten des Textes
%% 4.a)

% Visualisierung der Spektren für verschiedene gedrehte Texte.



%% 4.b)

% Bestimmung des Verdrehungswinkels mit Hilfe des Amplitudenspektrum.



%% 4.c)

% Ausrichtung der verdrehten Texte mit Hilfe von 'imrotate'.



%% 4.d)

% Ausrichtung eines verdrehten Textes mit Hilfe der Funktion 'irpAlignText'.



% Visualisierung des Ergebnisses.



%% Textzeichenerkennung
%% 5.a) - 5.b)

% Textzeichenerkennung.



% Visualisierung der Korrelationsfunktionen.



%% 5.e)

% Bestimmung der Maxima der Korrelationsfunktionen.



% Visualisierung der Maxima durch umschreibende Rechtecke.


