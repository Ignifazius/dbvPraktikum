function [a n] = irpCalcCenterAxis(q1, q2, q3)
% [a n] = irpCalcCenterAxis(q1, q2, q3)
% Berechnet den Mittelpunkt des Umkreises von dem Dreieck, das durch die
% Punkte 'q1', 'q2' und 'q3' beschrieben wird.
%
% Parameter:
% 'q1'                1x3 Zeilenvektor für ersten Dreieckspunkt
% 'q2'                1x3 Zeilenvektor für zweiten Dreieckspunkt
% 'q3'                1x3 Zeilenvektor für dritten Dreieckspunkt
%
% Rückgabewerte:
% 'a'                 1x3 Zeilenvektor für Mittelpunkt des Umkreises
% 'n'                 1x3 Normalenvektor (steht senkrecht auf dem Dreieck)
delta = 2 * norm( cross((q1-q2), (q2-q3)))^2;

alpha = (norm(q2-q3))^2 * (q1-q2) * (q1-q3)';
alpha = alpha / delta;

beta = (norm(q1-q3))^2 * (q2-q1) * (q2-q3)';
beta = beta / delta;

gamma = (norm(q1-q2))^2 * (q3-q1) * (q3-q2)';
gamma = gamma / delta;


a = alpha * q1 + beta * q2 + gamma * q3;

n_temp = irpCalcPlane([q1; q2; q3]);

n = n_temp(1:3);





