clear variables;
close all;
clc;
%% Datos del sistema
Ka = 50;
num1 = 1;
den1 = [0.002 4];
Kt = 0.140;
num3 = 1;
den3 = [10 0.01];
Kb = 0.140;
num4 = 1;
den4 = [1 0];
num5 = 1.6;
den5 = [1 1];

%Kt = 0.140;
%Jeq = 0.01;
%La = 0.002;
%Kb = 0.140;
%feq= 0.01;

%% Pregunta: Simplificacion

[numec,denec]=series(num1,den1,Kt,num1,num3,den3);
[numvc,denvc]=feedback(kb,num1,numec,denec,-1);
[num,den]=series(Ka,num1,numvc,denvc,num4,den4,num5,den5);

Planta = tf(num,den)