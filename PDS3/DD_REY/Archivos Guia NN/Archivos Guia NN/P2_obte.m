%Programa para generar la Base de Datos de Descriptores
clear variables;      %Elimina todas las variables del Workspace
close all;      %Cierra todas las ventanas de Matlab (todas las figuras)
clc;            %Limpia el Command Window

%Si desean en este programa unifican los archivos de audio o en P3 unifican
%los archivos de datos

% [x1,Fs] = audioread("subir.wav");  %10 de subir
% [x2,~] = audioread("subir.wav");  %10 de subir
% [x3,~] = audioread("subir.wav");  %10 de subir
% x = [x1;x2;x3];

% ---------- LOCUTOR 1 (P1) ----------
[subir1_1,Fs] = audioread("Subir1_P3.wav");
[subir2_1,~] = audioread("Subir2_P3.wav");
[subir3_1,~] = audioread("Subir3_P3.wav");
%x = [subir1_1' subir2_1' subir3_1']';  %Ejemplo de como concatenar 3 señales de audio

[bajar1_1,~] = audioread("Bajar1_P3.wav");
[bajar2_1,~] = audioread("Bajar2_P3.wav");
[bajar3_1,~] = audioread("Bajar3_P3.wav");
%x = [bajar1_1' bajar2_1' bajar3_1']';  %Ejemplo de como concatenar 3 señales de audio
% 
[ir1_1,~] = audioread("Ir1_P3.wav");
[ir2_1,~] = audioread("Ir2_P3.wav");
[ir3_1,~] = audioread("Ir3_P3.wav");
%x = [ir1_1' ir2_1' ir3_1']';  %Ejemplo de como concatenar 3 señales de audio
% 
[primer1_1,~] = audioread("Primer1_P3.wav");
[primer2_1,~] = audioread("Primer2_P3.wav");
[primer3_1,~] = audioread("Primer3_P3.wav");
%x = [primer1_1' primer2_1' primer3_1']';  %Ejemplo de como concatenar 3 señales de audio
% 
[segundo1_1,~] = audioread("Segundo1_P3.wav");
[segundo2_1,~] = audioread("Segundo2_P3.wav");
[segundo3_1,~] = audioread("Segundo3_P3.wav");
%x = [segundo1_1' segundo2_1' segundo3_1']';  %Ejemplo de como concatenar 3 señales de audio
% 
[Tercer1_1,~] = audioread("Tercer1_P3.wav");
[Tercer2_1,~] = audioread("Tercer2_P3.wav");
[Tercer3_1,~] = audioread("Tercer3_P3.wav");
%x = [Tercer1_1' Tercer2_1' Tercer3_1']';  %Ejemplo de como concatenar 3 señales de audio
% 
[cuarto1_1,~] = audioread("Cuarto1_P3.wav");
[cuarto2_1,~] = audioread("Cuarto2_P3.wav");
[cuarto3_1,~] = audioread("Cuarto3_P3.wav");
%x = [cuarto1_1' cuarto2_1' cuarto3_1']';  %Ejemplo de como concatenar 3 señales de audio
% 
[quinto1_1,~] = audioread("Quinto1_P3.wav");
[quinto2_1,~] = audioread("Quinto2_P3.wav");
[quinto3_1,~] = audioread("Quinto2_P3.wav");
%x = [quinto1_1' quinto2_1' quinto3_1']';  %Ejemplo de como concatenar 3 señales de audio
% 
[sexto1_1,~] = audioread("Sexto1_P3.wav");
[sexto2_1,~] = audioread("Sexto2_P3.wav");
[sexto3_1,~] = audioread("Sexto1_P3.wav");
%x = [sexto1_1' sexto2_1' sexto3_1']';  %Ejemplo de como concatenar 3 señales de audio
% 
[sotano1_1,~] = audioread("Sotano1_P3.wav");
[sotano2_1,~] = audioread("Sotano2_P3.wav");
[sotano3_1,~] = audioread("Sotano3_P3.wav");
%x = [sotano1_1' sotano2_1' sotano3_1']';  %Ejemplo de como concatenar 3 señales de audio
% 
[piso1_1,~] = audioread("Piso1_P3.wav");
[piso2_1,~] = audioread("Piso2_P3.wav");
[piso3_1,~] = audioread("Piso3_P3.wav");
x = [piso1_1' piso2_1' piso3_1']';  %Ejemplo de como concatenar 3 señales de audio
% 
% [test1_1,~] = audioread("Test1_P3.wav");
% [test2_1,~] = audioread("Test2_P3.wav");
% [test3_1,~] = audioread("Test3_P3.wav");
% [test4_1,~] = audioread("Test4_P3.wav");
%x = [test1_1' test2_1' test3_1' test4_1']';  %Ejemplo de como concatenar 4 señales de audio


%[x,Fs] = audioread("ascensor.wav");

%x(14.2*Fs:end)=0;
% sound(x,Fs)

figure(); plot(x); title("Señal de Entrada");

%Calculo Energia para empezar a detectar inicio y fin
Tam_Ventana = round(0.03*Fs); %Ventana de 30 ms
Tam_Traslape = round(0*Fs);   %Sobrelapamiento de 0 ms - No existe

energia = cal_energia(x,Tam_Ventana,Tam_Traslape);

num_bloques = length(energia);
vetor_bloques = 0:(num_bloques-1);   %Vector número de bloques

figure();
subplot(2,1,1);plot(x);title('Señal Original');
subplot(2,1,2);stem(vetor_bloques,energia);title('Energía por bloque');
%0.029

umbral = 0.009; %En base a la gráfica que tengo selecciono el umbral que más se adecua
% umbral = 0.004; %En base a la gráfica que tengo selecciono el umbral que más se adecua
figure(); stem(vetor_bloques,double(energia>umbral),LineWidth=2);

%De existir huecos entre palabra, relleno

intervalos = [0 7;1486 1500];
energia_mayor = rellenar2(energia > umbral, intervalos);

energia_mayor = rellenar2(energia_mayor);

figure();
stem(vetor_bloques,energia_mayor,LineWidth=2);

% Solamente me quedo con los bloques que representan voz
posiciones = obtener_medio(energia_mayor,num_bloques);

tamano_palabras = posiciones.final-posiciones.inicio;
fprintf("tamano palabras:");
fprintf(" %2d",tamano_palabras);

C_V = length(posiciones.medio);    %Cantidad de vocales identificadas en el audio

ventana = hamming(Tam_Ventana); %Ventana de Hamming

lista_descriptores = audioFeatureExtractor(SampleRate=Fs,Window=ventana, ...
                        OverlapLength=Tam_Traslape,...
                        mfcc=true);

feautureMap = info(lista_descriptores)      %Características a ser extraídas del vector audio

labels = [];    %Vector donde almaceno las etiquetas
DESCRIPTORES = []; %Vector donde almaceno los descriptores de cada bloque

%El número de bloques a analizar debe ser par.
bloques_analizar = 32;
mitad_bl_analizar = bloques_analizar/2;

for i =1:1:C_V
    
    p_i = Tam_Ventana*(posiciones.medio(i)-mitad_bl_analizar)+1;   %Agregro un bloque a la izquierda
    p_f = Tam_Ventana*(posiciones.medio(i)+mitad_bl_analizar);

    segmento_audio = x(p_i:p_f);

    %Ya tengo segmento de audio
    %Acá obtengo los descriptores de la señal
    vec_caracteristicas = extract(lista_descriptores,segmento_audio);
    vec_2 = vec_caracteristicas';
    vec_2=[vec_2(:)]';
    DESCRIPTORES = [DESCRIPTORES;vec_2];
    
    labels(i) = 11;      %Etiquetas
end

DATA.X = DESCRIPTORES;
DATA.Y = labels;

save('Piso_P3.mat','DATA')
% figure()
% plot(DATA.X(:,2*5))  %Plote el descriptor 14 de todos los numeros