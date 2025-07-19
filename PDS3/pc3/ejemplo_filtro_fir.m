clear variables;
close all;
clc;

N = 121;     %Orden del Filtro
tc = pi/4;  %Frecuencia de Corte

n = 0:N;

ho = sin(tc*(n-(N/2)))./(pi*(n-(N/2)));
% w = ones(N+1,1);  %Rectangular
w = hamming(N+1);
h = ho'.*w.*((-1).^n)';

figure();
subplot(3,1,1);plot(n,ho);title("ho");xlabel("número de muestra");ylabel("amplitud");
subplot(3,1,2);plot(n,w);title("w");xlabel("número de muestra");ylabel("amplitud");
subplot(3,1,3);plot(n,h);title("hf");xlabel("número de muestra");ylabel("amplitud");


%Frecuencia

[HO,FREC] = freqz(ho,1,8192,2*pi);
[W,~] = freqz(w,1,8192,2*pi);
[HF,~] = freqz(h,1,8192,2*pi);

figure();
subplot(3,1,1);plot(FREC,abs(HO));title("HO");xlabel("Frecuencia (rad)");ylabel("amplitud");
subplot(3,1,2);plot(FREC,abs(W));title("W");xlabel("Frecuencia (rad)");ylabel("amplitud");
subplot(3,1,3);plot(FREC,abs(HF));title("HO");xlabel("Frecuencia (rad)");ylabel("amplitud");