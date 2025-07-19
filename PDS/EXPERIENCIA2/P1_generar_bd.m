%Programa para grabar audio
clear variables;    %Elimina todas las variables
close all;          %Cierra todas las ventanas de gráficos
clc;                %Elimina el comand window

%Párametros de Captura
Fs = 8000;  %Frecuencia de muestreo en Hz o muestras/segundo
T = 1/Fs;  %Periodo de muestreo en segundos
Tc = 12;     %Tiempo de captura en segundos
r = 24;      %Número de bits para codificar la señal (8, 14 o 24)

%Puertos de Entrada y Salida del Computador
A = audiodevinfo();
ID_I = 2;   %Dispositivo de grabación de Renzo Reymundo
ID_O = 9;   %Dispositivo de reproducción Renzo Reymundo
n_c = 1;    %número de canales: 1 mono - 2 estereo

%Despliegue grabadora
grabadora = audiorecorder(Fs,r,n_c,ID_I);
record(grabadora, Tc);
pause(Tc+1);
x = getaudiodata(grabadora,'double');

t = 0:T:Tc-T;

figure();
plot(t,x);title("Señal Capturada");

%Reproducción de audio
reproductor = audioplayer(x,Fs,r,ID_O);
play(reproductor)
% 
%Calculo del espectrograma
tiempo_ventana = 30*1e-3;    %Tamaño de la venta en tiempo (ms)
tiempo_traslape = 0;   %Tiempo de traslape entre bloque y bloque en ms

tam_ventana = Fs*tiempo_ventana; %Tamaño en número de muestras del bloque
tam_traslape = Fs*tiempo_traslape; %Tamaño en número de muestra del traslape

nfft = 2^nextpow2(tam_ventana);

figure()

spectrogram(x,tam_ventana,tam_traslape,nfft,Fs,'yaxis');
title('Espectrograma de la Señal');

%Transformada de fourier 1
[X,FREC] = fourier(x,Fs);

figure()
subplot(2,1,1);plot(FREC, abs(X));title('Espectro de Magnitud');
xlabel('Frecuencia (Hz)'); ylabel('Amplitud');
grid on;    %cuadricula
subplot(2,1,2);plot(FREC,20*log10(abs(X)));title('Espectro de Magnitud - dB');
xlabel('Frecuencia (Hz)'); ylabel('Amplitud');
grid on;    %cuadricula

audiowrite("u2.wav",x,Fs);