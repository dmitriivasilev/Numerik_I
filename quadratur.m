function s = quadratur(a,b,N,f,regel)
% Universit�t T�bingen, WS16/17, Numerik I (Prof. Dr. Christian Lubich)
% Programmierungsaufgabe 1.a)
%
% Diese Funktion approximiert den Wert des Integrals einer gegebener Funktion f
% mit vier verschiedenen Approximationsmethoden.
%
% Input:
% a - Untere Gr�nze des Intervals
% b - Obere Gr�nze
% N - Anzahl der Teilintervallen
% f - Funktion zum Integrieren.
% Achtung! Die funktion f muss im Voraus
% durch Anonyme Funktion (function handle) eingegeben werden,
% z.B. f = @(x)(x^2) + 5 oder f = @(x)sin(x).
% Bitte Approximationsregel mit einem String eingeben:
% 'RL' = Rechtecksregel (Funktionswert wird von der linken Seite berechnet)
% 'RR' = Rechtecksregel (Funktionswert wird von der rechten Seite berechnet)
% 'MR' = Mittelpunktsregel
% 'TR' = Trapezregel
% 'SR' = Simpsonsregel
%
% Output:
% s = Fl�cheinhalt der Funktion f auf interval [a,b].
%
% von: Dmitrii Vasilev
% Matrikelnummer: 3875096
% Datum: 29.10.16
                   
%Sei "s" unsere Integralsumme. Um sicher zu sein, definiere s = 0 am Anfang.
s = 0;

% Zerlege interval [a,b] mit MatLab Funktion linspace zwischen N+1 Punkte,
% um N Intervale zu bekommen:
x = linspace(a,b,N+1);

% Definiere L�nge des einzelnen Intervals (anwende abs, falls b<a eingegeben ist)):
h = abs(b-a)/N;

% Berechne die Integralsumme mit verschiedenen Approximationsmethoden. Formeln sind vom
% Mitschrieb w�hrend der Vorlesung genommen.

    if regel == 'RR'

      for i=1:N
          s = s + f(x(i+1))*h;
      end
      
    elseif regel == 'RL'
        for i=1:N
            s = s + f(x(i))*h;
        end
        
    elseif regel == 'MR'
        
      for i=1:N
          s = s + f((x(i)+x(i+1))/2)*h;
      end
      
    elseif regel == 'TR'
        
      for i=1:N
          s = s + (f(x(i)) + f(x(i)+h))*(h/2);
      end
    
    elseif regel == 'SR'
        for i=1:N
            s = s + (f(x(i)) + 4 * f(x(i) + (h/2)) + f(x(i)+ h)) * (h/6);
        end
      
      
    end

% Falls man Punkte der Zerlegung und L�nge des Intervals anschauen will, bitte uncomment.
% x
% h
end