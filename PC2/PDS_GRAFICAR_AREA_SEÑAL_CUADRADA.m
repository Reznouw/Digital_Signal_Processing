clear variables; %Eliminar las variables generadas 
close all; %Cerrar las ventanas abiertas 
clc; %Limpia el Comnand Window 

%Parámetros del Muestreador 
T = 0.01; %Periodo de muestreo (s - tiempo entre muestra) 
Fs = 1/T; %Frecuencia de muestreo (Hz - o muestras por segundo) 
t = 0:T:3; %Vector Tiempo 
x = 2*(t>=0 & t<=1.5) -2*(t>1.5 & t<=3); 
figure(); 
plot(t,x,LineWidth=2); 
xlim([0 3]); ylim([-3 3]);
title("Señal x(t)");xlabel("Tiempo");
ylabel("Amplitud");