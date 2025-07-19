clear variables;
close all;
clc;

%Parámetros del muestreador

Fs = 8000;      %Freuencia de muestreo
T = 1/Fs;       %Periodo de muestreo
Tc = 60/1000;   %Tiempo de captura
t = 0:T:Tc-T;   %Vector Tiempo

%t = nT;
%n=t/T;
nx = t./T;      %Vector de muestras

x = cos(2*pi*1000*t)+cos(2*pi*3000*t);  %Señal Discreta

%Filtro FIR
Nh = 101;   %Orden del Filtro  FIR
nh = 0:Nh;  %Vector de posiciones del Filtro
tetha_c = pi/2; %Frecuencia de corte en relativo
pa = (-1).^nh;
h_sin_w = pa.*sin(tetha_c*(nh-Nh/2))./(pi*(nh-Nh/2));
% w = ones(Nh+1,1);
w = hamming(Nh+1);
h = h_sin_w.*w';

%Filtro IIR
N_IIR = 10; %Orden del Filtro IIR
tetha_c_n = (tetha_c/pi);   %Frecuencia de corte normalizada de 0-1 es 0-pi
[b,a] = butter(N_IIR,tetha_c_n,"high");


%Proceso de Filtrado
y1 = conv(x,h); %Método Tradicional con filtro FIR 
y2 = filter(h,1,x); %Forma Directa Nº1 con filtro FIR - No agrega muestras
y3 = filter(b,a,x); %Forma Directa Nº1 con filtro IIR - No agrega muestras

ny1 = 0:length(y1)-1;

% figure();
% subplot(5,1,1);stem(nx,x);title("Señal Discreta de Entrada");xlabel("n(Numero de muestra)");ylabel("Amplitud");
% subplot(5,1,2);stem(nh,h);title("Respuesta al Impulso - Filtro Fir");xlabel("n(Numero de muestra)");ylabel("Amplitud");
% subplot(5,1,3);stem(ny1,y1);title("Señal Discreta de Salida Conv Normal (Filtro FIR)");xlabel("n(Numero de muestra)");ylabel("Amplitud");
% subplot(5,1,4);stem(nx,y2);title("Señal Discreta de Salida FD Nº 1 (Filtro FIR)");xlabel("n(Numero de muestra)");ylabel("Amplitud");
% subplot(5,1,5);stem(nx,y3);title("Señal Discreta de Salida FD Nº 1 (Filtro IIR)"); xlabel("n(Numero de muestra)");ylabel("Amplitud");
figure();
subplot(4,1,1);stem(nx,x);title("Señal Discreta de Entrada");xlabel("n(Numero de muestra)");ylabel("Amplitud");
subplot(4,1,2);stem(nh,h);title("Respuesta al Impulso - Filtro Fir");xlabel("n(Numero de muestra)");ylabel("Amplitud");
subplot(4,1,3);stem(ny1,y1);title("Señal Discreta de Salida Conv Normal (Filtro FIR)");xlabel("n(Numero de muestra)");ylabel("Amplitud");
subplot(4,1,4);stem(nx,y2);title("Señal Discreta de Salida FD Nº 1 (Filtro FIR)");xlabel("n(Numero de muestra)");ylabel("Amplitud");


figure();
subplot(3,1,1);stem(nx,x);title("Señal Discreta de Entrada");xlabel("n(Numero de muestra)");ylabel("Amplitud");
subplot(3,1,2);impz(b, a, 10);title("Respuesta al Impulso - Filtro IIR");xlabel("n(Numero de muestra)");ylabel("Amplitud");
subplot(3,1,3);stem(nx,y3);title("Señal Discreta de Salida FD Nº 1 (Filtro IIR)"); xlabel("n(Numero de muestra)");ylabel("Amplitud");

%Frecuencias
[X,FRECX] = fourier(x,2*pi);

[H1,FRECH1] = freqz(h,1,8192,2*pi);
[Y1,FRECY1] = fourier(y1,2*pi);
[Y2,~] = fourier(y2,2*pi);

[H2,FRECH2] = freqz(b,a,8192,2*pi);
[Y3,~] = fourier(y3,2*pi);

figure();
subplot(4,1,1);plot(FRECX,abs(X));title("Espectro de Magnitud Señal de Entrada");xlabel("Frecuencia (rad)");
subplot(4,1,2);plot(FRECH1,abs(H1));title("Respuesta en Frecuencia Filtro FIR");xlabel("Frecuencia (rad)");
subplot(4,1,3);plot(FRECY1,abs(Y1));title("Espectro de Magnitud Señal de Salida - Conv FIR");xlabel("Frecuencia (rad)");
subplot(4,1,4);plot(FRECX,abs(Y2));title("Espectro de Magnitud Señal de Salida - FD1 FIR");xlabel("Frecuencia (rad)");

figure();
subplot(3,1,1);plot(FRECX,abs(X));title("Espectro de Magnitud Señal de Entrada");xlabel("Frecuencia (rad)");
subplot(3,1,2);plot(FRECH2,abs(H2));title("Respuesta en Frecuencia Filtro IIR");xlabel("Frecuencia (rad)");
subplot(3,1,3);plot(FRECX,abs(Y3));title("Espectro de Magnitud Señal de Salida - FD1 IIR");xlabel("Frec(rad)");ylabel("Amplitud");
