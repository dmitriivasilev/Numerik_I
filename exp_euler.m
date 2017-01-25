function [solution] = exp_euler(f, x0, t0, t1, tau)
% Universit�t T�bingen, WS16/17, Numerik I (Prof. Dr. Christian Lubich)
% Programmierungsaufgabe 6.a)
%
% Die Funktion benutzt das explizite Euler-Verfahren um das
% Anfangswertproblem numerisch zu berechnen.
%
% Input:
% f(t,x(t)) = x'(t) - Anfangswertbedingung
% x0                - L�sung zum Zeitpunkt t0
% t0                - Startwert
% t1                - Endwert
% tau               - Schrittweite des Verfahrens
%
% Output:
% L�sungsvektor im Punkt t1
%
% Von: Eva Zymelka: eva.zymelka@student.uni-tuebingen.de
%      Jakub Sowula: jakub.sowula@student.uni-tuebingen.de
%      Dmitrii Vasilev: dmitrii.vasilev@student.uni-tuebingen.de
%
% Datum: 22.01.17
%%

%   Erstelle einen Vektor mit Intervallzerlegung von [t0,t1] mit
%   Schrittweite tau.
    t = [t0];
    while max(t) + tau < t1;
       t = [t, (t(length(t)) + tau)];        
    end
    t = [t, t1];

    % Erstelle den Vektor xstar mit Approximationsl�sungen zu verschiedenen
    % Zeitpunkten
    xstar = zeros(size(x0, 1), size(t, 2)); 
    
    % Erhalte die L�sung in t0 mit Anfangswertbedingung
    xstar(1 : size(x0,1)) = x0;
    
    % for-Schleife zum Berechnen der L�sungen mit Hilfe des
    % Euler-Verfahrens
    for i = 1 : (length(t) - 1)
        
        k1 = f(t(:, i), xstar(:, i));
        
        xstar(:, i + 1) = xstar(:, i) + k1 * (t(:, i + 1) - t(:, i));
        
    end
    
    % L�sungsvektor zum Zeitpunkt t1
    solution = xstar(:,end)';

end