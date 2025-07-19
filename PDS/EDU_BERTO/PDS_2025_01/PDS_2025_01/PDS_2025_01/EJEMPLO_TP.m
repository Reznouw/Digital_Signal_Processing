clear variables;
close all;
clc;

[x, Fs] = audioread("-------"); 


T = 1/Fs;
N = length(x);% tamañototal del vector
Tc = N/Fs;

t = 0:T:Tc-T; 




%Analisis grafico en el tiempo
figure();
plot(t,x,LineWidth=2);

rp = [2 4 8 16 32 64 128];

xr.fijo1 = rfijo(x,rp(1));
xr.fijo2 = rfijo(x,rp(2));
xr.fijo3 = rfijo(x,rp(3));
xr.fijo4 = rfijo(x,rp(4));
xr.fijo5 = rfijo(x,rp(5));
xr.fijo6 = rfijo(x,rp(6));
xr.fijo7 = rfijo(x,rp(7));



%FIJO
xr.fijotsnr1 = fsnr(x,xr.fijo1);
xr.fijotsnr2 = fsnr(x,xr.fijo2);
xr.fijotsnr3 = fsnr(x,xr.fijo3);
xr.fijotsnr4 = fsnr(x,xr.fijo4);
xr.fijotsnr5 = fsnr(x,xr.fijo5);
xr.fijotsnr6 = fsnr(x,xr.fijo6);
xr.fijotsnr7 = fsnr(x,xr.fijo7);




%SNR BLOQUE
T_V = 30/1000; %tiemnpo de duracion del bloque en ms 
xr.fijobsnr1 = snr_bloque(x,xr.fijo1,T_V,Fs);
xr.fijobsnr2 = snr_bloque(x,xr.fijo2,T_V,Fs);
xr.fijobsnr3 = snr_bloque(x,xr.fijo3,T_V,Fs);
xr.fijobsnr4 = snr_bloque(x,xr.fijo4,T_V,Fs);
xr.fijobsnr5 = snr_bloque(x,xr.fijo5,T_V,Fs);
xr.fijobsnr6 = snr_bloque(x,xr.fijo6,T_V,Fs);
xr.fijobsnr7 = snr_bloque(x,xr.fijo7,T_V,Fs);

%mas alto snr // por bloques
vsnrfijo = [xr.fijotsnr1 xr.fijotsnr2 xr.fijotsnr3...
    xr.fijotsnr4 xr.fijotsnr5 xr.fijotsnr6 xr.fijotsnr7];

figure();
subplot(3,3,1);plot(t,xr.fijo1);title(["rp:" num2str(rp(1))]);
subplot(3,3,2);plot(t,xr.fijo2);title(["rp:" num2str(rp(2))]);
subplot(3,3,3);plot(t,xr.fijo3);title(["rp:" num2str(rp(3))]);
subplot(3,3,4);plot(t,xr.fijo4);title(["rp:" num2str(rp(4))]);
subplot(3,3,5);plot(t,xr.fijo5);title(["rp:" num2str(rp(5))]);
subplot(3,3,6);plot(t,xr.fijo6);title(["rp:" num2str(rp(6))]);
subplot(3,3,7);plot(t,xr.fijo7);title(["rp:" num2str(rp(7))]);

subplot(3,3,8);stem(rp,vsnrfijo);title("SNR Total");

subplot(3,3,9);plot(xr.fijobsnr1);title("SNR por Bloques");hold on;
plot(xr.fijobsnr2);
plot(xr.fijobsnr3);
plot(xr.fijobsnr4);
plot(xr.fijobsnr5);
plot(xr.fijobsnr6);
plot(xr.fijobsnr7);

%%Adaptivo
xr.adaptivo1 = radaptivo(x,rp(1),T_V,Fs);
xr.adaptivo2 = radaptivo(x,rp(2),T_V,Fs);
xr.adaptivo3 = radaptivo(x,rp(3),T_V,Fs);
xr.adaptivo4 = radaptivo(x,rp(4), T_V,Fs);
xr.adaptivo5 = radaptivo(x,rp(5),T_V,Fs);
xr.adaptivo6 = radaptivo(x,rp(6),T_V,Fs);
xr.adaptivo7 = radaptivo(x,rp(7),T_V,Fs);

NA = length(xr.adaptivo7);
ta = (0:NA-1)*T;

xr.adaptivotsnr1 = fsnr(x,xr.adaptivo1(1:N));
xr.adaptivotsnr2 = fsnr(x,xr.adaptivo2(1:N));
xr.adaptivotsnr3 = fsnr(x,xr.adaptivo3(1:N));
xr.adaptivotsnr4 = fsnr(x,xr.adaptivo4(1:N));
xr.adaptivotsnr5 = fsnr(x,xr.adaptivo5(1:N));
xr.adaptivotsnr6 = fsnr(x,xr.adaptivo6(1:N));
xr.adaptivotsnr7 = fsnr(x,xr.adaptivo7(1:N));

vsnrfijo = [xr.adaptivotsnr1 xr.adaptivotsnr2 xr.adaptivotsnr3...
    xr.adaptivotsnr4 xr.adaptivotsnr5 xr.adaptivotsnr6 xr.adaptivotsnr7];

xr.adaptivobsnr1 = snr_bloque(x,xr.adaptivo1(1:N),T_V,Fs);
xr.adaptivobsnr2 = snr_bloque(x,xr.adaptivo2(1:N),T_V,Fs);
xr.adaptivobsnr3 = snr_bloque(x,xr.adaptivo3(1:N),T_V,Fs);
xr.adaptivobsnr4 = snr_bloque(x,xr.adaptivo4(1:N),T_V,Fs);
xr.adaptivobsnr5 = snr_bloque(x,xr.adaptivo5(1:N),T_V,Fs);
xr.adaptivobsnr6 = snr_bloque(x,xr.adaptivo6(1:N),T_V,Fs);
xr.adaptivobsnr7 = snr_bloque(x,xr.adaptivo7(1:N),T_V,Fs);

figure();
subplot(3,3,1);plot(ta,xr.adaptivo1);title(["rp:" num2str(rp(1))]);
subplot(3,3,2);plot(ta,xr.adaptivo2);title(["rp:" num2str(rp(2))]);
subplot(3,3,3);plot(ta,xr.adaptivo3);title(["rp:" num2str(rp(3))]);
subplot(3,3,4);plot(ta,xr.adaptivo4);title(["rp:" num2str(rp(4))]);
subplot(3,3,5);plot(ta,xr.adaptivo5);title(["rp:" num2str(rp(5))]);
subplot(3,3,6);plot(ta,xr.adaptivo6);title(["rp:" num2str(rp(6))]);
subplot(3,3,7);plot(ta,xr.adaptivo7);title(["rp:" num2str(rp(7))]);
subplot(3,3,8);stem(rp,vsnradaptivo);title("SNR Total");

subplot(3,3,9);plot(xr.adaptivobsnr1);title("SNR por Bloques");hold on;
plot(xr.adaptivobsnr2);
plot(xr.adaptivobsnr3);
plot(xr.adaptivobsnr4);
plot(xr.adaptivobsnr5);
plot(xr.adaptivobsnr6);
plot(xr.adaptivobsnr7);