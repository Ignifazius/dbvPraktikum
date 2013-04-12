function irpTestMorph(Bb, Bs, morph)
% irpTestMorph(Bb, Bs, morph)
% Testet die morphologischen Operationen. Die jeweiligen Ausgangsbilder und 
% Ergebnisbilder werde in einem einzigen subplot dargestellt.
%
% Parameter:
% 'Bb'                Bin�rbild der Bauteile
% 'Bs'                Bin�rbild des Schlittens
% 'morph'             St�rke der Filterung: 0(aus), 1(leicht), 2(stark)
%
% R�ckgabewerte:
% -

% Berechne Bin�rbilder nach morphologischen Operationen.
Mb = irpMorph(Bb, morph);
Ms = irpMorph(Bs, morph);

% Stelle Ergebnisse dar.
figure;
subplot(1,2,1);
imshow(Mb);

subplot(1,2,2);
imshow(Ms);


