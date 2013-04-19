function [M, Mu, Mh] = irpMomentsAll(L)
% [M, Mu, Mh] = irpMomentsAll(L)
% Berechnet auf Basis eines Labelbildes die Momemte, Zentralmomente und
% Hu-Momente f�r jede einzelne Region. Die Momente werden dabei jeweils in
% einer eigenen Matrix abgespeichert. Eine einzelne Zeile in einer Matrix
% repr�sentiert die jeweiligen Momente einer Region. Zeilenindex und Label
% einer Region sollen 1:1 �bereinstimmen. Die Matrizen sind folgenderma�en
% definiert:
%
%         1   2   3   4   5   6   7   8   9   10   --> Spaltenindex 
%
% M =  | m00 m01 m02 m03 m10 m11 m12 m20 m21 m30 | --> Region mit Label 1
%      |              ...                        |
%      | m00 m01 m02 m03 m10 m11 m12 m20 m21 m30 | --> Region mit Label k
% 
% Mu = | u00 u01 u02 u03 u10 u11 u12 u20 u21 u30 | --> Region mit Label 1
%      |              ...                        |
%      | u00 u01 u02 u03 u10 u11 u12 u20 u21 u30 | --> Region mit Label k
% 
% Mh = | h1  h2  h3  h4  h5  h6  h7  |             --> Region mit Label 1
%      |              ...            |
%      | h1  h2  h3  h4  h5  h6  h7  |             --> Region mit Label k
%
% HINWEISE: 
% - Z.B. m00 in Zeile 1 ist nicht identisch mit m00 in Zeile k!
% - F�r die Spaltenindizes der Matrizen M und Mu existiert die 
%   Hilfsfunktion irpM!
%
%
% Parameter:
% 'L'                  Labelbild
%
% R�ckgabewerte:
% 'M'                  Momente f�r jede Region
% 'Mu'                 Zentralmomente f�r jede Region
% 'Mh'                 Hu-Momente f�r jede Region


% Ermittle Anzahl an Regionen.
% Die Region mit dem Label 0 wird ignoriert.
numRegions = max(max(L));

% Initialisiere Matrizen.
M  = zeros(numRegions, 10);
Mu = zeros(numRegions, 10);
Mh = zeros(numRegions, 7);

% Berechne die Momente
for i=1:numRegions
    % Berechne Kx2 Koordinatenliste f�r Region.
    % In der Koordinatenliste (bzw. Koordinatenmatrix) sollen alle
    % Pixelkoordinaten enthalten sein derjenigen Pixel, die zu dieser 
    % Region geh�ren. 
    % 'find' ist hier sehr n�tzlich.
    % Bitte darauf achten, dass in 'Lc' die Koordinaten in der Form
    % (Spalte, Zeile)=(x,y) abgespeichert werden m�ssen und nicht in der
    % Form (Zeile, Spalte).
    [I J] = find(L == i);
    Lc = [J I]; % x und y tauschen
   
    % Berechne Momente f�r jede Region.
    M(i,:) = irpMoments(Lc);
    Mu(i,:)= irpCentralMoments(M(i,:));
    Mh(i,:)= irpHuMoments(Mu(i,:));
end
