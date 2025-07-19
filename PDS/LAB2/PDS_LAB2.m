clear variables; %Elimina todas las variables (Limpia la memoria RAM)
close all;       %Cierra todas las ventas (figure)
clc;             %Limpia el Command Window
%Parámetros del Muestreador
Fs = 44100;       %Frecuencia de muestreo (Hz - # de muestras/seg)
T = 1/Fs;        %Periodo de muestreo (s - tiempo entre muestra y muestra)
Tc = 3;          %Tiempo de captura (s)
t = 0:T:Tc;      %Vector de Tiempo

%Ecuación de la Onda
x = 0.7*cos(2*pi*17000*t+pi/8);

%Análisis gráfico en el tiempo
figure();
subplot(3,1,1);
plot(t,x,LineWidth=2);  %Plot simula continuidad, une punto 1 con punto 2
title("Señal en el Tiempo");xlabel("Tiempo (s)"); ylabel("Amplitud(V)");

subplot(3,1,2);
plot(t,x);  %Plot simula continuidad, une punto 1 con punto 2
hold on; stem(t,x,LineWidth=2);
title("Proceso de Muestreo");xlabel("Tiempo (s)"); ylabel("Amplitud(V)");

subplot(3,1,3);
stem(t,x,LineWidth=2); %Stem grafica todo como impulsos
title("Señal Muestreada");xlabel("Tiempo (s)"); ylabel("Amplitud(V)");

%Análisis en Frecuencia
[X,FREC] = fourier(x,Fs);

figure();
subplot(2,1,1);plot(FREC,abs(X));title("Espectro de Magnitud Señal de Entrada");
xlabel("Frecuencia (Hz");

subplot(2,1,2);plot(FREC,angle(X));title("Espectro de Fase");
xlabel("Frecuencia (Hz");ylabel("radianes");

%Reproducción de la señala
A = audiodevinfo();
ID_O = 4;   %Reviso donde estan mis parlantes SOLO FUNCIONA EN LAPTOP DEL PROF. ERWIN

reproductor = audioplayer(x,Fs,24,ID_O);
play(reproductor)


[x,Fs] = audioread("musica_ejemplo.wav");
T