function i = irpM(p, q)
% i = irpM(p, q)
% Liefert den Index f�r die Spalte des gew�hlten Moments zur�ck.
% Diese Funktion kann f�r die Momente mpq aus Matrix M und 
% upq aus Matrix CM verwendet werden.
%
% Beispiele:
% m10 = irpM(1, 0);
% u12 = irpM(1, 2);
%
% Parameter:
% 'p'                 Exponent f�r x-Werte
% 'q'                 Exponent f�r y-Werte
%
% R�ckgabewerte:
% 'i'                 Spaltenindex f�r Matrix

I = [1 2 3 4; 5 6 7 0; 8 9 0 0; 10 0 0 0];
i = I(p+1, q+1);