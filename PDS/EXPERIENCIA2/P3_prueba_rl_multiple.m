%Programa para probar la regresión lineal multiple

clear variables;    %Elimina todas las variables
close all;          %Cierra todas las ventanas de gráficos
clc;                %Elimina el comand window
warning off;
Red_N = load('Red_RL_N.mat');
%Ahora se predice el nuevo archivo
[x,Fs] = audioread("v1.wav");
medio.x = obtener_pos(x,Fs,Red_N.RL.umbral,Red_N.RL.TV);
x_test = descriptores(x,Fs,medio.x,Red_N.RL.TV); %x_test es lo que se se va a predecir con las RL
num_vocales_identificar = length(medio.x);

for i=1:num_vocales_identificar
    sal_RL.a = x_test(i,:)*Red_N.RL.a;
    sal_RL.e = x_test(i,:)*Red_N.RL.e;
    sal_RL.i = x_test(i,:)*Red_N.RL.i;
    sal_RL.o = x_test(i,:)*Red_N.RL.o;
    sal_RL.u = x_test(i,:)*Red_N.RL.u;
    sal_RL.total = [sal_RL.a,sal_RL.e,sal_RL.i,sal_RL.o,sal_RL.u]';

    sal_RL.pred = find(sal_RL.total==max(sal_RL.total));

    switch sal_RL.pred
        case 1
            disp('La vocal es a');
        case 2
            disp('La vocal es e');
        case 3
            disp('La vocal es i');
        case 4
            disp('La vocal es o');
        case 5
            disp('La vocal es u');
    end
end