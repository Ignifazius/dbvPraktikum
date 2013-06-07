%% irpVersuch3.m
% In einigen Aufgabenteilen ist in dieser Skriptdatei kein Programmcode erforderlich.
% Die Antworten hierauf können aber als Kommentare stichwortartig eingebunden werden.
% Dieses kann später beim Kolloquium hilfreich sein.

%% Initialisierung einiger Variablen:
I = imread('aufnahme1.bmp');             % Hole irgendein Bild, z.B. von der Kamera
figure(1);
imshow(I, []);
title('Ausgangsbild');

drill1 = 60/2;
drill2 = 40/2;

%% Vorbereitungen
%% 1.a)

%% 1.b)

%% 1.c)

%% Gradientenoperatoren
%% 2.a) 
I2 = double(imread('testmuster1.bmp'));
if max(max(I2)) > 1 %imnoise kann nicht mit 255 umgehen, sondern nur mit 1
    I2 = I2/max(max(I2));
end

% Gradienten
Roberts1 = [1 0; 0 -1];
Roberts2 = [0 1; -1 0];
%IGraB = gradient(image(I2));
IRobX = imfilter(I2, Roberts1);
IRobY = imfilter(I2, Roberts2);

IGraB = sqrt(IRobX .*IRobX + IRobY .*IRobY);
IGraW = atan2(IRobY, IRobX);

figure(2);
subplot(2,2,1);
imshow(IRobX, []);
title('Roberts, X');
subplot(2,2,2);
imshow(IRobY, []);
title('Roberts, Y');
subplot(2,2,3);
imshow(IGraB, []);
title('Roberts, Gradienten');
subplot(2,2,4);
imshow(IGraW, []);
title('Roberts, Gradientenwinkel');


%% 2.b)

% Sobel
SobelX = [1 0 -1; 2 0 -2; 1 0 -1];
SobelY = SobelX';
ISoX = imfilter(I2, SobelX);
ISoY = imfilter(I2, SobelY);

IGraBS = sqrt(ISoX .*ISoX + ISoY .*ISoY);
IGraWS = atan2(ISoY, ISoX);

figure(3);
subplot(2,2,1);
imshow(ISoX, []);
title('Sobel, X');
subplot(2,2,2);
imshow(ISoY, []);
title('Sobel, Y');
subplot(2,2,3);
imshow(IGraBS, []);
title('Sobel, Gradienten');
subplot(2,2,4);
imshow(IGraWS, []);
title('Sobel, Gradientenwinkel');

%% 2.c)

% LaPlace
Laplace = [0 -1 0; -1 4 -1; 0 -1 0];
ILap = imfilter(I2, Laplace);
IAbs = abs(ILap);

figure(4);
subplot(2,1,1);
imshow(ILap, []);
title('Laplace');
subplot(2,1,2);
imshow(IAbs, []);
title('Laplace, Abs');

%% 2.d)
IGauss = imnoise(I2, 'gaussian');
ISalt = imnoise(I2, 'salt & pepper');

%IRoberts Gauss
IRobX1 = imfilter(IGauss, Roberts1);
IRobY1 = imfilter(IGauss, Roberts2);
IGraW1 = atan2(IRobY1, IRobX1)-pi/4;
%IRoberts SnP
IRobX2 = imfilter(ISalt, Roberts1);
IRobY2 = imfilter(ISalt, Roberts2);
IGraW2 = atan2(IRobY2, IRobX2)-pi/4;

%ISobel Gauss
ISoX1 = imfilter(IGauss, SobelX);
ISoY1 = imfilter(IGauss, SobelY);
IGraWS1 = atan2(ISoY1, ISoX1);

%ISobel SnP
ISoX2 = imfilter(ISalt, SobelX);
ISoY2 = imfilter(ISalt, SobelY);
IGraWS2 = atan2(ISoY2, ISoX2);


figure(5);
subplot(2,2,1);
imshow(IGraW1, []);
title('Roberts, Gauss');
subplot(2,2,2);
imshow(IGraW2, []);
title('Roberts, Salt & Pepper');
subplot(2,2,3);
imshow(IGraWS1, []);
title('Sobel, Gauss');
subplot(2,2,4);
imshow(IGraWS2, []);
title('Sobel, Salt & Pepper');

%% 2.e)
%Roberts
IGraBRG = sqrt(IRobX1 .*IRobX1 + IRobY1 .*IRobY1);
IGraBRS = sqrt(IRobX2 .*IRobX2 + IRobY2 .*IRobY2);
%Sobel
IGraBSoG = sqrt(ISoX1 .*ISoX1 + ISoY1 .*ISoY1);
IGraBSoS = sqrt(ISoX2 .*ISoX2 + ISoY2 .*ISoY2);
% LaPlace
Laplace = [0 -1 0; -1 4 -1; 0 -1 0];
ILapG = imfilter(IGauss, Laplace);
ILapS = imfilter(ISalt, Laplace);
IAbsG = abs(ILapG);
IAbsS = abs(ILapS);

figure(6);
subplot(3,2,1);
imshow(IGraBRG, []);
title('Roberts, Gauss, Gradient');
subplot(3,2,2);
imshow(IGraBRS, []);
title('Roberts, Salt & Pepper, Gradient');
subplot(3,2,3);
imshow(IGraBSoG , []);
title('Sobel, Gauss, Gradient');
subplot(3,2,4);
imshow(IGraBSoS , []);
title('Sobel, Salt & Pepper, Gradient');
subplot(3,2,5);
imshow(IAbsG, []);
title('LaPlace, Gauss');
subplot(3,2,6);
imshow(IAbsS, []);
title('LaPlace, Salt & Pepper');

%% 2.f)
Kern1 = [2 1 0; 1 0 -1; 0 -1 -2]; % Sobel gedreht
IKern1 = imfilter(I2, Kern1);
IKernG = imfilter(imnoise(I2, 'gaussian'), Kern1);
IKernS = imfilter(imnoise(I2, 'salt & pepper'), Kern1);
figure(7);
subplot(1,3,1);
imshow(IKern1);
title('Custom Kern');
subplot(1,3,2);
imshow(IKernG);
title('Custom Kern, Gauss');
subplot(1,3,3);
imshow(IKernS);
title('Custom Kern, Salt & Pepper');

%% Kantenbild
%% 3.a)
I3 = double(imread('aufnahme2.bmp'));
[E O] = irpEdges(I3);
figure(8);
subplot(1,3,1);
imshow(I3, []);
title('Ausgangsbild');
subplot(1,3,2);
imshow(E, []);
title('E');
subplot(1,3,3);
imshow(O, []);
title('O');

%% 3.b) 
%check
%% Hough-Transformation für Kreise
%% 4.a)
%check
%% 4.b)
bild = zeros(100,100);
[ C ] = irpCircle ( 50, 50, 70, 20, pi/2, [100 100] ); %(cx, cy, omega, r, alpha, imgSize)
bild(C) = 255;
figure(9);
imshow (bild, []);
title('Testbild irpCircle');
%% 4.c)
%check

%% 4.d)
[H1] = irpHough(E, drill1);
[H2] = irpHough(E, drill2);
figure(10);
subplot(1,2,1);
imshow(H1, []);
title('Hough, Lochgröße a');
subplot(1,2,2);
imshow(H2, []);
title('Hough, Lochgröße b');
%% 4.e)
%check
%% 4.f)
%check
%% Suche nach Höhepunkten in den Hough-Räumen
%% 5.a) 

%% 5.b)
figure(11);
P1 = irpPeaks(H1, drill1, 70, 4);
bild1 = H1;
[g ~]= size(P1);
for i=1:g
    [ C ] = irpCircle ( P1(i,1), P1(i,2), 0, drill1, pi, size(bild1) );
    bild1(C) = 255;
end
subplot(1,2,1);
imshow(bild1, []);
title('Lochgröße a');

P2 = irpPeaks(H2, drill2, 2, 3);
bild2 = H2;
[g ~]= size(P2);
for i=1:g
    [ C ] = irpCircle ( P2(i,1), P2(i,2), 0, drill2, pi, size(bild2) );
    bild2(C) = 255;
end
subplot(1,2,2);
imshow(bild2, []);
title('Lochgröße b');
%% Subpixel-Genauigkeit
%% 6.a) 



%% 6.b)
S1 = irpSubPixel(H1, P1);
S2 = irpSubPixel(H2, P2);
figure(12);
irpTestSubPixel(H1, P1, S1);
%% 6.c)
irpShowResults(P1, P2, drill1, drill2, I3/255);

%% Ausnutzung der Gradientenorientierung
%% 7.a)

%% 7.b)
H1 = irpHough2(E, O, drill1, pi/42);
H2 = irpHough2(E, O, drill2, pi/42);
P1 = irpPeaks(H1, drill1, 2, 4);
P2 = irpPeaks(H2, drill2, 2, 3);



figure(13);
subplot(1,2,1);
imshow(H1, []);
title('Lochgröße a');
subplot(1,2,2);
imshow(H2, []);
title('Lochgröße b');
figure;
irpShowResults(P1, P2, drill1, drill2, I3/255);
%% 7.c)

%% 7.d)

%% 7.e)
