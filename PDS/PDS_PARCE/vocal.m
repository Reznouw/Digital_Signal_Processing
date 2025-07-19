clear variables;    %Elimina toda las variables
close all;  %Cierra todas las ventanas/figure
clc;        %Limpia el Command Window   
warning off;

%Lee la base de datos
[a,Fs] = audioread("equipos_peru.wav");

plot(a);
A=audiodevinfo();
%Puertos de Entrada y Salida del Computador
ID_O = 9;   %Dispositivo de reproducción de Renzo Reymundo
n_c = 1;    %Numero de canales: 1 mono - 2 stereo
%Reproduccion de audio
reproductor = audioplayer(a,Fs,24,ID_O);
%play(reproductor)

T_V = 30/1000;

P = T_V*Fs; %Tamaño del bloque en numero de muestras
bloques = buffer(a, P); %Separo la señal en bloques de P muestras (T_V tiempo)
[~,num_bloques] = size(bloques);
energia_bloques = zeros(1,num_bloques);
for i = 1:num_bloques
    bloque_act = bloques(:,i);  %Extraigo el bloque de tamaño de ventana
    energia_bloques(i) = sum(bloque_act.^2);
end

figure();
stem(energia_bloques);title("Energias por Bloques");
umbral = 0.13; %SOLAMENTE FUNCIONA PARA EL PROFE (CAMBIAR) 

sup_energia = energia_bloques>=umbral;

sup_energia = rellenar(sup_energia);

figure();
stem(sup_energia);title("Bloques que superan umbral");

bloq_inicio=[];
bloq_fin=[];

for i = 4:num_bloques-3
    blo_ant_3 = sup_energia(i-3);
    blo_ant_2 = sup_energia(i-2);
    blo_ant_1 = sup_energia(i-1);
    blo_act = sup_energia(i);
    blo_sup1 = sup_energia(i+1);
    blo_sup2 = sup_energia(i+2);
    blo_sup3 = sup_energia(i+3);

    if ((blo_ant_3==0)&&(blo_ant_2==0)&&(blo_ant_1==0)&&...
            (blo_act==1)&&(blo_sup1==1)&&(blo_sup2==1)&&(blo_sup3==1))
        bloq_inicio=[bloq_inicio i];
    end

    if ((blo_ant_3==1)&&(blo_ant_2==1)&&(blo_ant_1==1)&&...
            (blo_act==1)&&(blo_sup1==0)&&(blo_sup2==0)&&(blo_sup3==0))
        bloq_fin=[bloq_fin i];
    end
end

if ((sup_energia(end-3)==1)&&(sup_energia(end-2)==1)&&(sup_energia(end-1)==1)...
            &&(sup_energia(end)==1))
        bloq_fin=[bloq_fin i];
end
b_medio = round((bloq_fin+bloq_inicio)./2);

