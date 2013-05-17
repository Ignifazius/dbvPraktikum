%% irpVersuch3.m
% In einigen Aufgabenteilen ist in dieser Skriptdatei kein Programmcode erforderlich.
% Die Antworten hierauf können aber als Kommentare stichwortartig eingebunden werden.
% Dieses kann später beim Kolloquium hilfreich sein.

%% Initialisierung einiger Variablen:
I = imread('aufnahme1.bmp');             % Hole irgendein Bild, z.B. von der Kamera
figure(1);
imshow(I, []);

drill1 = 60/2;
drill2 = 40/2;

%% Vorbereitungen
%% 1.a)

%% 1.b)

%% 1.c)

%% Gradientenoperatoren
%% 2.a) 
I2 = double(imread('testmuster1.bmp'));


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
subplot(2,2,2);
imshow(IRobY, []);
subplot(2,2,3);
imshow(IGraB, []);
subplot(2,2,4);
imshow(IGraW, []);


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
subplot(2,2,2);
imshow(ISoY, []);
subplot(2,2,3);
imshow(IGraBS, []);
subplot(2,2,4);
imshow(IGraWS, []);

%% 2.c)

% LaPlace
Laplace = [0 -1 0; -1 4 -1; 0 -1 0];
ILap = imfilter(I2, Laplace);
IAbs = abs(ILap);

figure(4);
subplot(2,1,1);
imshow(ILap, []);
subplot(2,1,2);
imshow(IAbs, [])

%% 2.d)
IGauss = imnoise(I2, 'gaussian');
ISalt = imnoise(I2, 'salt & pepper');

%IRoberts Gauss
IRobX1 = imfilter(IGauss, Roberts1);
IRobY1 = imfilter(IGauss, Roberts2);
IGraW1 = atan2(IRobY1, IRobX1);
%IRoberts SnP
IRobX2 = imfilter(ISalt, Roberts1);
IRobY2 = imfilter(ISalt, Roberts2);
IGraW2 = atan2(IRobY2, IRobX2);
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
subplot(2,2,2);
imshow(IGraW2, []);
subplot(2,2,3);
imshow(IGraWS1, []);
subplot(2,2,4);
imshow(IGraWS2, []);

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
subplot(3,2,2);
imshow(IGraBRS, []);
subplot(3,2,3);
imshow(IGraBSoG , []);
subplot(3,2,4);
imshow(IGraBSoS , []);
subplot(3,2,5);
imshow(IAbsG, []);
subplot(3,2,6);
imshow(IAbsS, []);

%% 2.f)
Kern1 = [2 1 0; 1 0 -1; 0 -1 -2]; % Sobel gedreht
Kern2 = [0 0 0 1; 0 0 1 0; 0 -1 0 0; -1 0 0 0];
IKern1 = imfilter(I2, Kern1);
IKernG = imfilter(imnoise(I2, 'gaussian'), Kern1);
IKernS = imfilter(imnoise(I2, 'salt & pepper'), Kern1);
figure(7);
subplot(1,3,1);
imshow(IKern1);
subplot(1,3,2);
imshow(IKernG);
subplot(1,3,3);
imshow(IKernS);

%% Kantenbild
%% 3.a)
I3 = imread('aufnahme1');

%% 3.b)

%% Hough-Transformation für Kreise
%% 4.a)

%% 4.b)

%% 4.c)

%% 4.d)

%% 4.e)

%% 4.f)

%% Suche nach Höhepunkten in den Hough-Räumen
%% 5.a)

%% 5.b)

%% Subpixel-Genauigkeit
%% 6.a)

%% 6.b)

%% 6.c)

%% Ausnutzung der Gradientenorientierung
%% 7.a)

%% 7.b)

%% 7.c)

%% 7.d)

%% 7.e)
