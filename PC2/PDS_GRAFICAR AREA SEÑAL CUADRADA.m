clear variables;
close all;
clc;

%Parametos del Muestreador
T=0.01; %Frecuencia de muestreo (Hz -o muestras por segundo)
Fs= 1/T; %Periodo de muestreo (s - tiempo entre muestra)

t = 0:T:3; %Vector tiempo

x= 2*(t>=0 & t<=1.5) -2*(t>1.5 & t<=3); %Ecuacion de la onda

figure();
plot(t,x,LineWidth=2);
xlim([0 3]); ylim([-3 3]);
title("Señal x(t)");xlabel("Tiempo"); 
ylabel("Amplitud");
