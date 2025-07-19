%Programa para generar la Base de Datos de Descriptores
clear variables;      %Elimina todas las variables del Workspace
close all;      %Cierra todas las ventanas de Matlab (todas las figuras)
clc;            %Limpia el Command Window

%Si desean en este programa unifican los archivos de audio o en P3 unifican
%los archivos de datos

% ---------- LOCUTOR 1 (P1) ----------
[subir1_1,Fs] = audioread("subir1_P1.wav");
[subir2_1,~] = audioread("subir2_P1.wav");
[subir3_1,~] = audioread("subir3_P1.wav");
subir_P1 = [subir1_1' subir2_1' subir3_1']';  %Ejemplo de como concatenar 3 señales de audio

[bajar1_1,~] = audioread("bajar1_P1.wav");
[bajar2_1,~] = audioread("bajar2_P1.wav");
[bajar3_1,~] = audioread("bajar3_P1.wav");
bajar_P1 = [bajar1_1' bajar2_1' bajar3_1']';  %Ejemplo de como concatenar 3 señales de audio

[ir1_1,~] = audioread("ir1_P1.wav");
[ir2_1,~] = audioread("ir2_P1.wav");
[ir3_1,~] = audioread("ir3_P1.wav");
ir_P1 = [ir1_1' ir2_1' ir3_1']';  %Ejemplo de como concatenar 3 señales de audio

[primer1_1,~] = audioread("primer1_P1.wav");
[primer2_1,~] = audioread("primer2_P1.wav");
[primer3_1,~] = audioread("primer3_P1.wav");
primer_P1 = [primer1_1' primer2_1' primer3_1']';  %Ejemplo de como concatenar 3 señales de audio

[segundo1_1,~] = audioread("segundo1_P1.wav");
[segundo2_1,~] = audioread("segundo2_P1.wav");
[segundo3_1,~] = audioread("segundo3_P1.wav");
segundo_P1 = [segundo1_1' segundo2_1' segundo3_1']';  %Ejemplo de como concatenar 3 señales de audio

[Tercer1_1,~] = audioread("tercer1_P1.wav");
[Tercer2_1,~] = audioread("tercer2_P1.wav");
[Tercer3_1,~] = audioread("tercer3_P1.wav");
Tercer_P1 = [Tercer1_1' Tercer2_1' Tercer3_1']';  %Ejemplo de como concatenar 3 señales de audio

[cuarto1_1,~] = audioread("cuarto1_P1.wav");
[cuarto2_1,~] = audioread("cuarto2_P1.wav");
[cuarto3_1,~] = audioread("cuarto3_P1.wav");
cuarto_P1 = [cuarto1_1' cuarto2_1' cuarto3_1']';  %Ejemplo de como concatenar 3 señales de audio

[quinto1_1,~] = audioread("quinto1_P1.wav");
[quinto2_1,~] = audioread("quinto2_P1.wav");
[quinto3_1,~] = audioread("quinto3_P1.wav");
quinto_P1 = [quinto1_1' quinto2_1' quinto3_1']';  %Ejemplo de como concatenar 3 señales de audio

[sexto1_1,~] = audioread("sexto1_P1.wav");
[sexto2_1,~] = audioread("sexto2_P1.wav");
[sexto3_1,~] = audioread("sexto3_P1.wav");
sexto_P1 = [sexto1_1' sexto2_1' sexto3_1']';  %Ejemplo de como concatenar 3 señales de audio

[sotano1_1,~] = audioread("sotano1_P1.wav");
[sotano2_1,~] = audioread("sotano2_P1.wav");
[sotano3_1,~] = audioread("sotano3_P1.wav");
sotano_P1 = [sotano1_1' sotano2_1' sotano3_1']';  %Ejemplo de como concatenar 3 señales de audio

[piso1_1,~] = audioread("piso1_P1.wav");
[piso2_1,~] = audioread("piso2_P1.wav");
[piso3_1,~] = audioread("piso3_P1.wav");
piso_P1 = [piso1_1' piso2_1' piso3_1']';  %Ejemplo de como concatenar 3 señales de audio

[test1_1,~] = audioread("test1_P1.wav");
[test2_1,~] = audioread("test2_P1.wav");
[test3_1,~] = audioread("test3_P1.wav");
[test4_1,~] = audioread("test4_P1.wav");
test_P1 = [test1_1' test2_1' test3_1' test4_1']';  %Ejemplo de como concatenar 4 señales de audio

% ---------- LOCUTOR 2 (P2) ----------
[subir1_2,Fs] = audioread("subir1_P2.wav");
[subir2_2,~] = audioread("subir2_P2.wav");
[subir3_2,~] = audioread("subir3_P2.wav");
subir_P2 = [subir1_2' subir2_2' subir3_2']';  %Ejemplo de como concatenar 3 señales de audio

[bajar1_2,~] = audioread("bajar1_P2.wav");
[bajar2_2,~] = audioread("bajar2_P2.wav");
[bajar3_2,~] = audioread("bajar3_P2.wav");
bajar_P2 = [bajar1_2' bajar2_2' bajar3_2']';  %Ejemplo de como concatenar 3 señales de audio

[ir1_2,~] = audioread("ir1_P2.wav");
[ir2_2,~] = audioread("ir2_P2.wav");
[ir3_2,~] = audioread("ir3_P2.wav");
ir_P2 = [ir1_2' ir2_2' ir3_2']';  %Ejemplo de como concatenar 3 señales de audio

[primer1_2,~] = audioread("primer1_P2.wav");
[primer2_2,~] = audioread("primer2_P2.wav");
[primer3_2,~] = audioread("primer3_P2.wav");
primer_P2 = [primer1_2' primer2_2' primer3_2']';  %Ejemplo de como concatenar 3 señales de audio

[segundo1_2,~] = audioread("segundo1_P2.wav");
[segundo2_2,~] = audioread("segundo2_P2.wav");
[segundo3_2,~] = audioread("segundo3_P2.wav");
segundo_P2 = [segundo1_2' segundo2_2' segundo3_2']';  %Ejemplo de como concatenar 3 señales de audio

[Tercer1_2,~] = audioread("tercer1_P2.wav");
[Tercer2_2,~] = audioread("tercer2_P2.wav");
[Tercer3_2,~] = audioread("tercer3_P2.wav");
Tercer_P2 = [Tercer1_2' Tercer2_2' Tercer3_2']';  %Ejemplo de como concatenar 3 señales de audio

[cuarto1_2,~] = audioread("cuarto1_P2.wav");
[cuarto2_2,~] = audioread("cuarto2_P2.wav");
[cuarto3_2,~] = audioread("cuarto3_P2.wav");
cuarto_P2 = [cuarto1_2' cuarto2_2' cuarto3_2']';  %Ejemplo de como concatenar 3 señales de audio

[quinto1_2,~] = audioread("quinto1_P2.wav");
[quinto2_2,~] = audioread("quinto2_P2.wav");
[quinto3_2,~] = audioread("quinto3_P2.wav");
quinto_P2 = [quinto1_2' quinto2_2' quinto3_2']';  %Ejemplo de como concatenar 3 señales de audio

[sexto1_2,~] = audioread("sexto1_P2.wav");
[sexto2_2,~] = audioread("sexto2_P2.wav");
[sexto3_2,~] = audioread("sexto3_P2.wav");
sexto_P2 = [sexto1_2' sexto2_2' sexto3_2']';  %Ejemplo de como concatenar 3 señales de audio

[sotano1_2,~] = audioread("sotano1_P2.wav");
[sotano2_2,~] = audioread("sotano2_P2.wav");
[sotano3_2,~] = audioread("sotano3_P2.wav");
sotano_P2 = [sotano1_2' sotano2_2' sotano3_2']';  %Ejemplo de como concatenar 3 señales de audio

[piso1_2,~] = audioread("piso1_P2.wav");
[piso2_2,~] = audioread("piso2_P2.wav");
[piso3_2,~] = audioread("piso3_P2.wav");
piso_P2 = [piso1_2' piso2_2' piso3_2']';  %Ejemplo de como concatenar 3 señales de audio

[test1_2,~] = audioread("test1_P2.wav");
[test2_2,~] = audioread("test2_P2.wav");
[test3_2,~] = audioread("test3_P2.wav");
[test4_2,~] = audioread("test4_P2.wav");
test_P2 = [test1_2' test2_2' test3_2' test4_2']';  %Ejemplo de como concatenar 4 señales de audio

%Señal de Audio:
[x,Fs] = audioread("ascensor.wav");
x(14.2*Fs:end)=0;
%sound(x,Fs)
figure(); plot(x); title("Señal de Entrada");

% Inicialización
labels = [];    %Vector donde almaceno las etiquetas
DESCRIPTORES = []; %Vector donde almaceno los descriptores de cada bloque
locutores = [];

%Calculo Energia para empezar a detectar inicio y fin
Tam_Ventana = round(0.03*Fs); %Ventana de 30 ms
Tam_Traslape = round(0*Fs);   %Sobrelapamiento de 0 ms - No existe
energia = cal_energia(x,Tam_Ventana,Tam_Traslape);
num_bloques = length(energia);
vetor_bloques = 0:(num_bloques-1);   %Vector número de bloques

figure();
subplot(2,1,1);plot(x);title('Señal Original');
subplot(2,1,2);stem(vetor_bloques,energia);title('Energía por bloque');

umbral = 0.001; %En base a la gráfica que tengo selecciono el umbral que más se adecua
% umbral = 0.004; %En base a la gráfica que tengo selecciono el umbral que más se adecua
figure(); stem(vetor_bloques,double(energia>umbral),LineWidth=2);

%De existir huecos entre palabra, relleno

energia_mayor = double(energia>umbral);
energia_mayor = rellenar(energia_mayor);

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

feautureMap = info(lista_descriptores);      %Características a ser extraídas del vector audio


%El número de bloques a analizar debe ser par.
bloques_analizar = 8;
mitad_bl_analizar = bloques_analizar/2;

% ----------------------------------------------
% FUNCIONES PARA PROCESAR
procesar_audio = @(x, etiqueta, locutor) ...
    procesarBloques(x, etiqueta, locutor, Tam_Ventana, Tam_Traslape, ...
    mitad_bl_analizar, lista_descriptores);


% ---------- P1 ----------
[d,y,l] = procesar_audio(ir_P1,4,1);        DESCRIPTORES = [DESCRIPTORES; d]; labels = [labels y]; locutores = [locutores l];
[d,y,l] = procesar_audio(subir_P1,2,1);     DESCRIPTORES = [DESCRIPTORES; d]; labels = [labels y]; locutores = [locutores l];
[d,y,l] = procesar_audio(bajar_P1,3,1);     DESCRIPTORES = [DESCRIPTORES; d]; labels = [labels y]; locutores = [locutores l];
[d,y,l] = procesar_audio(sotano_P1,6,1);    DESCRIPTORES = [DESCRIPTORES; d]; labels = [labels y]; locutores = [locutores l];
[d,y,l] = procesar_audio(primer_P1,7,1);    DESCRIPTORES = [DESCRIPTORES; d]; labels = [labels y]; locutores = [locutores l];
[d,y,l] = procesar_audio(segundo_P1,8,1);   DESCRIPTORES = [DESCRIPTORES; d]; labels = [labels y]; locutores = [locutores l];
[d,y,l] = procesar_audio(Tercer_P1,9,1);    DESCRIPTORES = [DESCRIPTORES; d]; labels = [labels y]; locutores = [locutores l];
[d,y,l] = procesar_audio(cuarto_P1,10,1);   DESCRIPTORES = [DESCRIPTORES; d]; labels = [labels y]; locutores = [locutores l];
[d,y,l] = procesar_audio(quinto_P1,11,1);   DESCRIPTORES = [DESCRIPTORES; d]; labels = [labels y]; locutores = [locutores l];
[d,y,l] = procesar_audio(sexto_P1,12,1);    DESCRIPTORES = [DESCRIPTORES; d]; labels = [labels y]; locutores = [locutores l];
[d,y,l] = procesar_audio(piso_P1,13,1);     DESCRIPTORES = [DESCRIPTORES; d]; labels = [labels y]; locutores = [locutores l];

% ---------- P2 ----------
[d,y,l] = procesar_audio(ir_P2,4,2);        DESCRIPTORES = [DESCRIPTORES; d]; labels = [labels y]; locutores = [locutores l];
[d,y,l] = procesar_audio(subir_P2,2,2);     DESCRIPTORES = [DESCRIPTORES; d]; labels = [labels y]; locutores = [locutores l];
[d,y,l] = procesar_audio(bajar_P2,3,2);     DESCRIPTORES = [DESCRIPTORES; d]; labels = [labels y]; locutores = [locutores l];
[d,y,l] = procesar_audio(sotano_P2,6,2);    DESCRIPTORES = [DESCRIPTORES; d]; labels = [labels y]; locutores = [locutores l];
[d,y,l] = procesar_audio(primer_P2,7,2);    DESCRIPTORES = [DESCRIPTORES; d]; labels = [labels y]; locutores = [locutores l];
[d,y,l] = procesar_audio(segundo_P2,8,2);   DESCRIPTORES = [DESCRIPTORES; d]; labels = [labels y]; locutores = [locutores l];
[d,y,l] = procesar_audio(Tercer_P2,9,2);    DESCRIPTORES = [DESCRIPTORES; d]; labels = [labels y]; locutores = [locutores l];
[d,y,l] = procesar_audio(cuarto_P2,10,2);   DESCRIPTORES = [DESCRIPTORES; d]; labels = [labels y]; locutores = [locutores l];
[d,y,l] = procesar_audio(quinto_P2,11,2);   DESCRIPTORES = [DESCRIPTORES; d]; labels = [labels y]; locutores = [locutores l];
[d,y,l] = procesar_audio(sexto_P2,12,2);    DESCRIPTORES = [DESCRIPTORES; d]; labels = [labels y]; locutores = [locutores l];
[d,y,l] = procesar_audio(piso_P2,13,2);     DESCRIPTORES = [DESCRIPTORES; d]; labels = [labels y]; locutores = [locutores l];


% ------------------------ GUARDAR BASE ------------------------
DATA.X = DESCRIPTORES;
DATA.Y = labels;
DATA.L = locutores;
save("BD_final.mat", "DATA");

% save('u1.mat','DATA')
figure()
plot(DATA.X(:,2*5))  %Plote el descriptor 14 de todos los numeros