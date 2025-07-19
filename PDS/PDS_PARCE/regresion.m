clear variables;    %Elimina toda las variables
close all;  %Cierra todas las ventanas/figure
clc;        %Limpia el Command Window   
warning off;

%Lee la base de datos
[a,Fs] = audioread("equipos_peru.wav");
[e,~] = audioread("equipos_peru.wav");
[i,~] = audioread("equipos_peru.wav");
[o,~] = audioread("equipos_peru.wav");
[u,~] = audioread("equipos_peru.wav");

%Consejo siempre grabar como maximo 10 reps por archivo
[a1,~] = audioread("equipos_peru.wav");
[a2,~] = audioread("equipos_peru.wav");
ac = [a1' a2'];  %Ejemplo de como concatenar 2 señales de audio
[e1,~] = audioread("equipos_peru.wav");
[e2,~] = audioread("equipos_peru.wav");
ec = [e1' e2'];  %Ejemplo de como concatenar 2 señales de audio
[i1,~] = audioread("equipos_peru.wav");
[i2,~] = audioread("equipos_peru.wav");
ic = [i1' i2'];  %Ejemplo de como concatenar 2 señales de audio
[o1,~] = audioread("equipos_peru.wav");
[o2,~] = audioread("equipos_peru.wav");
oc = [o1' o2'];  %Ejemplo de como concatenar 2 señales de audio
[u1,~] = audioread("equipos_peru.wav");
[u2,~] = audioread("equipos_peru.wav");
uc = [u1' u2'];  %Ejemplo de como concatenar 2 señales de audio

plot(a);

A=audiodevinfo();
%Puertos de Entrada y Salida del Computador
ID_O = 9;   %Dispositivo de reproducción de Renzo Reymundo
n_c = 1;    %Numero de canales: 1 mono - 2 stereo
%Reproduccion de audio
reproductor = audioplayer(a,Fs,24,ID_O);
%play(reproductor)

%Calculo bloques de inicio y fin de cada vocal
umbral = 0.13; %SOLAMENTE FUNCIONA PARA EL PROFE
T_V = 30/1000; %Tiempo de ventana

medio.a = obtener_pos(a,Fs,umbral,T_V);
medio.e = obtener_pos(e,Fs,umbral,T_V);
medio.i = obtener_pos(i,Fs,umbral,T_V);
medio.o = obtener_pos(o,Fs,umbral,T_V);
medio.u = obtener_pos(u,Fs,umbral,T_V);

%Obtencion de descriptores
BD.a = descriptores(a,Fs,medio.a,T_V);
BD.e = descriptores(e,Fs,medio.e,T_V);
BD.i = descriptores(i,Fs,medio.i,T_V);
BD.o = descriptores(o,Fs,medio.o,T_V);
BD.u = descriptores(u,Fs,medio.u,T_V);

%a.rp4 = rfijo(a,4);

Bd.a.fijo.rp4 = descriptores(a.rp4,Fs,medio.a,T_V);
Bd.a.fijo.rp5 = descriptores(a.rp5,Fs,medio.a,T_V);
Bd.a.fijo.rp6 = descriptores(a.rp6,Fs,medio.a,T_V);

Bd.e.fijo.rp4 = descriptores(e.rp4,Fs,medio.e,T_V);
Bd.e.fijo.rp5 = descriptores(e.rp5,Fs,medio.e,T_V);
Bd.e.fijo.rp6 = descriptores(e.rp6,Fs,medio.e,T_V);

Bd.i.fijo.rp4 = descriptores(i.rp4,Fs,medio.i,T_V);
Bd.i.fijo.rp5 = descriptores(i.rp5,Fs,medio.i,T_V);
Bd.i.fijo.rp6 = descriptores(i.rp6,Fs,medio.i,T_V);

Bd.o.fijo.rp4 = descriptores(o.rp4,Fs,medio.o,T_V);
Bd.o.fijo.rp5 = descriptores(o.rp5,Fs,medio.o,T_V);
Bd.o.fijo.rp6 = descriptores(o.rp6,Fs,medio.o,T_V);

Bd.u.fijo.rp4 = descriptores(u.rp4,Fs,medio.u,T_V);
Bd.u.fijo.rp5 = descriptores(u.rp5,Fs,medio.u,T_V);
Bd.u.fijo.rp6 = descriptores(u.rp6,Fs,medio.u,T_V);

%Regresion Lineal
RL.a = entrenar(Bd.a,Bd.e,Bd.i,Bd.o,Bd.u);
RL.e = entrenar(Bd.e,Bd.a,Bd.i,Bd.o,Bd.u);
RL.i = entrenar(Bd.i,Bd.a,Bd.e,Bd.o,Bd.u);
RL.o = entrenar(Bd.o,Bd.a,Bd.e,Bd.i,Bd.u);
RL.u = entrenar(Bd.u,Bd.a,Bd.e,Bd.i,Bd.o);

Rl.umbral = umbral;
RL.T_V = T_V;

%RL.a.rp4 = entrenar(Bd.a.rp4,Bd.e.rp4,Bd.i.rp4,Bd.o.rp4,Bd.u.rp4);

%Ahora se predice el nuevo archivo
[x,~] = audioread("equipos_peru.wav");
medio.x = obtener_pos(x,Fs,umbral,T_V);
x_test = descriptores(x,Fs,medio.x,T_V); %x_test es lo que se va a predecir con
num_vocales_identificar = length(medio.x);

for i=1:num_vocales_identificar
    sal_RL.a = x_test(i,:)*RL.a;
    sal_RL.e = x_test(i,:)*RL.e;
    sal_RL.i = x_test(i,:)*RL.i;
    sal_RL.o = x_test(i,:)*RL.o;
    sal_RL.u = x_test(i,:)*RL.u;
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

%Comando para guardar la red
% save('Red_RL_M.mat','RL')