%% Fouriertransformation 
%% 1.a) - 1.c)


% Laden von 'Lena.bmp' und iRP-Logo.bmp'. 
I1 = rgb2gray(imread('Lena.bmp'));
I2 = imread('iRP-Logo.bmp');

% Visualisierung der Amplituden- und Phasenspektren.
% Hinweis: imshow(I, []) kann recht nützlich sein.
[amp, pha] = irpFFT(I1);
figure(1);
subplot(1,3,1);
imshow(I1);
subplot(1,3,2);
imshow(log2(fftshift(amp)), []);
subplot(1,3,3);
imshow((pha), []);


[amp2, pha2] = irpFFT(I2);
figure;
subplot(1,3,1);
imshow(I2);
subplot(1,3,2);
imshow(log2(fftshift(amp2)), []);
subplot(1,3,3);
imshow((pha2), []);


%% 1.d)

% Amplitudenspektrum auf Konstante setzen.
[m,n] = size(amp);
ampConst = ones(m,n) * 100;

% Visualisierung des Amplituden- und Phasenspektrums.
figure(6);
subplot(1,2,1);
imshow(irpInverseFFT(ampConst, pha), []);


% Phasenspektrum auf Konstante setzen.
[m,n] = size(pha);
phaConst = ones(m,n) * 100;


% Visualisierung des Amplituden- und Phasenspektrums.
figure(6);
subplot(1,2,2);
imshow(irpInverseFFT(amp, phaConst), []);


%% 1.e)

% Phasenspektren vertauschen.
tmp1 = pha;
pha = pha2;
pha2 = tmp1;

% Visualisierung der Amplituden- und Phasenspektren.
figure(7);
subplot(1,2,1);
imshow(irpInverseFFT(amp, pha), []);
subplot(1,2,2);
imshow(irpInverseFFT(amp2, pha2), []);




%% Hoch- und Tiefpassfilterung
%% 2.a) - 2.b)

% Hoch - und Tiefpassfilterung mehrerer Testbilder.
% Visualisierung der Ergebnisse.

% Bild 1
figure(3);
subplot(2,3,1);
imshow(I1);
subplot(2,3,2);
[a p] = irpHochpass(amp, pha2, 10);
imshow(irpInverseFFT(a, p), []);
subplot(2,3,3);
[a2 p2] = irpTiefpass(amp, pha2, 30);
imshow(irpInverseFFT(a2, p2), []);

% Bild 2
figure(3);
subplot(2,3,4);
imshow(I2);
subplot(2,3,5);
[a p] = irpHochpass(amp2, pha, 10);
imshow(irpInverseFFT(a, p), []);
subplot(2,3,6);
[a2 p2] = irpTiefpass(amp2, pha, 30);
imshow(irpInverseFFT(a2, p2), []);




%% 2.c)

% Addition von Bildrauschen.
% Gauß'sches Rauschen
 I1R = imnoise(I1, 'gaussian');
 
% Salt'n'Pepper Noise
 I2R = imnoise(I2, 'salt & pepper');

[amp, pha] = irpFFT(I1R);
[amp2, pha2] = irpFFT(I2R);
% Visualisierung der verrauschten Bilder.
% Bild 1
figure(4);
subplot(2,3,1);
imshow(I1R);
subplot(2,3,2);
[a p] = irpHochpass(amp, pha, 10);
imshow(irpInverseFFT(a, p), []);
subplot(2,3,3);
[a2 p2] = irpTiefpass(amp, pha, 30);
imshow(irpInverseFFT(a2, p2), []);

% Bild 2
figure(4);
subplot(2,3,4);
imshow(I2R);
subplot(2,3,5);
[a p] = irpHochpass(amp2, pha2, 10);
imshow(irpInverseFFT(a, p), []);
subplot(2,3,6);
[a2 p2] = irpTiefpass(amp2, pha2, 30);
imshow(irpInverseFFT(a2, p2), []);


%% 2.d)

% Tiefpassfilterung.
figure(5);
subplot(2,1,1);
[a2 p2] = irpTiefpass(amp, pha, 70);
imshow(irpInverseFFT(a2, p2), []);

subplot(2,1,2);
[a2 p2] = irpTiefpass(amp2, pha2, 50);
imshow(irpInverseFFT(a2, p2), []);


% Visualisierung der Ergebnisse.



%% Abtastung
%% 3.a) - 3.c)

% Laden von 'Sonnet_for_Lena.bmp'.
I3 = rgb2gray(imread('Sonnet_for_Lena.bmp'));


% Abtastung mit unterschiedlichen Abtständen delta_x und delta_y.
O1 = irpAbtastung(I3, 1, 1);
O2 = irpAbtastung(I3, 2, 2);
O3 = irpAbtastung(I3, 3, 3);


% Visualisierung der abgetasteten Bilder.
figure(8);
subplot(3,3,1);
imshow(O1, []);
subplot(3,3,2);
imshow(O2, []);
subplot(3,3,3);
imshow(O3, []);


%% 3.d)

% Visualisierung der Spektren der abgetasteten Bilder.
[amp, pha] = irpFFT(O1);
[amp2, pha2] = irpFFT(O2);
[amp3, pha3] = irpFFT(O3);

figure(8);
subplot(3,3,4);
imshow(log2(fftshift(amp)), []);
subplot(3,3,7);
imshow((pha), []);

subplot(3,3,5);
imshow(log2(fftshift(amp2)), []);
subplot(3,3,8);
imshow((pha2), []);

subplot(3,3,6);
imshow(log2(fftshift(amp3)), []);
subplot(3,3,9);
imshow((pha3), []);


%% 3.f)

% Rekonstruktion des abgetasteten Bildes durch Tiefpassfilterung.
[a2 p2] = irpTiefpass(amp2, pha2, 140);
[a3 p3] = irpTiefpass(amp3, pha3, 110);
[a3h p3h] = irpHochpass(amp3, pha3, 110);

% Visualisierung des Ergebnisses.
imshow(irpInverseFFT(a2, p2), []);
figure;
subplot(1,3,1);
imshow(irpInverseFFT(a3, p3), []);
subplot(1,3,2);
imshow(log2(fftshift(a3)), []);
subplot(1,3,3);
imshow(log2(fftshift(a3h)), []);


%% Ausrichten des Textes
%% 4.a)

% Visualisierung der Spektren für verschiedene gedrehte Texte.
I4 = rgb2gray(imread('Sonnet_for_Lena.bmp'));
I5 = rgb2gray(imread('Sonnet_for_Lena_verdreht.bmp'));
[amp, pha] = irpFFT(I4);
[amp2, pha2] = irpFFT(I5);
figure;
subplot(2,3,1);
imshow(I4);
subplot(2,3,2);
imshow(log2(fftshift(amp)), []);
subplot(2,3,3);
imshow((pha), []);

subplot(2,3,4);
imshow(I5);
subplot(2,3,5);
imshow(log2(fftshift(amp2)), []);
subplot(2,3,6);
imshow((pha2), []);

%% 4.b)

% Bestimmung des Verdrehungswinkels mit Hilfe des Amplitudenspektrum.
% [a6 p6] = irpFFT(log2(fftshift(amp2)));
% [a p] = irpHochpass(a6, p6, 1);
% imshow(irpInverseFFT(a, p), []);

[a p] = irpHochpass(amp2, pha2, 120);
imshow(log2(fftshift(a)), []);
Iflip = flipud(fftshift(a));
[x y] = max(Iflip);
[i j] = max(x);
vec = [y(j), j];

[angle, ~]= cart2pol(vec(1), vec(2));
angle = angle*180/pi;
imshow(Iflip, []);


%% 4.c)

% Ausrichtung der verdrehten Texte mit Hilfe von 'imrotate'.
imshow(imrotate(I5, angle));



%% 4.d)

% Ausrichtung eines verdrehten Textes mit Hilfe der Funktion 'irpAlignText'.
I6 = irpAlignText(I5);


% Visualisierung des Ergebnisses.
figure;
imshow(I6, []);


%% Textzeichenerkennung
%% 5.a) - 5.b)
I7 = rgb2gray(imread('Sonnet_for_Lena.bmp'));
tmpL = rgb2gray(imread('Template_L.bmp'));
tmpN = rgb2gray(imread('Template_n.bmp'));
tmpS = rgb2gray(imread('Template_S.bmp'));
% Textzeichenerkennung.
I7cL = irpOCR(I7, tmpL);
I7cN = irpOCR(I7, tmpN);
I7cS = irpOCR(I7, tmpS);


% Visualisierung der Korrelationsfunktionen.

figure(12);
subplot(4,1,2);
imshow(I7cL,[]);
subplot(4,1,3);
imshow(I7cN,[]);
subplot(4,1,4);
imshow(I7cS,[]);

%% 5.e)

% Bestimmung der Maxima der Korrelationsfunktionen.



% Visualisierung der Maxima durch umschreibende Rechtecke.
figure(13)

[numrow, numcol] = size(rgb2gray(template_l));
[Y ZEILEN] = max(ocr_l);
[A D] = max(Y);
bildmitbox_l = irpDrawBoundingBox(rgb2gray(sonnet), D, ZEILEN(D), numrow, numcol, 3, 0, 255, 0);

subplot(3,1,1);
imshow(bildmitbox_l, []);

[numrow, numcol] = size(rgb2gray(template_n));
[Y ZEILEN] = max(ocr_n);
[A D] = max(Y);
bildmitbox_n = irpDrawBoundingBox(rgb2gray(sonnet), D, ZEILEN(D), numrow, numcol, 3, 0, 255, 0);

subplot(3,1,2);
imshow(bildmitbox_n, []);

[numrow, numcol] = size(rgb2gray(template_s));
[Y ZEILEN] = max(ocr_s);
[A D] = max(Y);
bildmitbox_s = irpDrawBoundingBox(rgb2gray(sonnet), D, ZEILEN(D), numrow, numcol, 3, 0, 255, 0);

subplot(3,2,3);
imshow(bildmitbox_s, []);