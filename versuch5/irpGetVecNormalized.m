function v = irpGetVecNormalized(Vec)
% irpGetVecNormalized(Vec)
% Gibt den Vektor Vec normalisiert zurück.
%
% Parameter:
% 'Vec'         Zu normalisierender Vektor.

assert(min(size(Vec)) == 1, 'Vec is a matrix not a vector.')
v = Vec ./ norm(Vec);

end
