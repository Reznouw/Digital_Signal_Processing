clear variables;    %Elimina toda las variables
close all;  %Cierra todas las ventanas/figure
clc;        %Limpia el Command Window    

%Parametros del Muestreo
N = 81; %Orden del filtro
tc = pi/4;  %Frecuencia de Corte

n = 0:N;

ho = sin(tc*(n-(N/2)))./(pi*(n-(N/2)));
%w = ones(1,N+1);   %Rectangular
w = hamming(N+1);
hf = ho'.*w;

figure();
subplot(3,1,1);plot(n,ho);title("ho");xlabel("numero de muestra");ylabel("amplitud");
subplot(3,1,2);plot(n,w);title("w");xlabel("numero de muestra");ylabel("amplitud");
subplot(3,1,3);plot(n,hf);title("hf");xlabel("numero de muestra");ylabel("amplitud");

%Frecuencia

[HO,FREC] = freqz(ho,1,8192,2*pi);
[W,~] = freqz(w,1,8192,2*pi);
[HF,~] = freqz(hf,1,8192,2*pi);


figure();
subplot(3,1,1);plot(FREC,abs(HO));title("HO");xlabel("Frecuencia (rad)");ylabel("amplitud");
subplot(3,1,2);plot(FREC,abs(W));title("W");xlabel("Frecuencia (rad)");ylabel("amplitud");
subplot(3,1,3);plot(FREC,abs(HF));title("HF");xlabel("Frecuencia (rad)");ylabel("amplitud");
