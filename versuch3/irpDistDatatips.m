function d = irpDistDatatips(fig)
% r = irpDistDatatips(fig)
% Berechnet die Distanz zwischen zwei datatips im gew�nschten figure.
% Damit die Funktion erfolgreich die Distanz berechnen kann, m�ssen im 
% gew�nschten Anzeigefenster mindestens zwei datatips enthalten sein.
% Die Distanz wird dann zwischen den ersten beiden datatips berechnet.
%
% Beispiel:
% radius = irpDistDatatips(gcf) / 2;
%
% Parameter:
% 'fig'               Handle auf ein figure. F�r aktuelles figure: 'gcf'
%
% R�ckgabewerte:
% 'd'                 Euklidische Distanz zwischen den datatips

% Hole einen Handle auf die Cursor.
dcm_obj = datacursormode(gcf);

% Extrahiere Cursor-Information.
c_info = getCursorInfo(dcm_obj);

% Berechne den Radius mit Hilfe der Cursor-Positionen.
if size(c_info, 2) >= 2
    d = norm(c_info(1).Position - c_info(2).Position);
else
    d = 0;
end
