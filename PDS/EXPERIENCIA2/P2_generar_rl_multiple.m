%Programa para generar regresión lineal multiple

clear variables;    %Elimina todas las variables
close all;          %Cierra todas las ventanas de gráficos
clc;                %Elimina el comand window
warning off;

%Lee la base de datos
[a,Fs] = audioread("a1.wav");
[e,~] = audioread("e1.wav");
[i,~] = audioread("i1.wav");
[o,~] = audioread("o1.wav");
[u,~] = audioread("u1.wav");
[a,Fs] = audioread("a2.wav");
[e,~] = audioread("e2.wav");
[i,~] = audioread("i2.wav");
[o,~] = audioread("o2.wav");
[u,~] = audioread("u2.wav");

%Consejo siempre grabar como máximo 10 rep por archivo
[a1,~] = audioread("a1.wav");
[a2,~] = audioread("a2.wav");
a = [a1' a2']';  %Ejemplo de como concatenar 2 señales de audio
[e1,~] = audioread("e1.wav");
[e2,~] = audioread("e2.wav");
e = [e1' e2']';  %Ejemplo de como concatenar 2 señales de audio
[i1,~] = audioread("i1.wav");
[i2,~] = audioread("i2.wav");
i = [i1' i2']';  %Ejemplo de como concatenar 2 señales de audio
[o1,~] = audioread("o1.wav");
[o2,~] = audioread("o2.wav");
o = [o1' o2']';  %Ejemplo de como concatenar 2 señales de audio
[u1,~] = audioread("u1.wav");
[u2,~] = audioread("u2.wav");
u = [u1' u2']';  %Ejemplo de como concatenar 2 señales de audio

% [e1,~] = audioread("e1.wav");
% [e2,~] = audioread("e1.wav");
% ec = [e1' e2']';  %Ejemplo de como concatenar 2 señales de audio


plot(a);

%Puertos de Entrada y Salida del Computador
ID_O = 9;   %Dispositivo de reproducción de Renzo Reymundo
n_c = 1;    %número de canales: 1 mono - 2 estereo
%Reproducción de audio
reproductor = audioplayer(e,Fs,24,ID_O);
% play(reproductor)

% Calculo bloques de inicio y fin de cada vocal
umbral = 0.13;%SOLAMENTE FUNCIONA PARA EL PROF. ERWIN DIANDERAS
T_V = 30/1000; %Tiempo de Ventana

medio.a = obtener_pos(a,Fs,umbral,T_V);
medio.e = obtener_pos(e,Fs,umbral,T_V);
medio.i = obtener_pos(i,Fs,umbral,T_V);
medio.o = obtener_pos(o,Fs,umbral,T_V);
medio.u = obtener_pos(u,Fs,umbral,T_V);

RL = genera_rl_multiple(a,e,i,o,u,medio,Fs,umbral,T_V);

%Comando para guardar la red
save('Red_RL_N.mat','RL')