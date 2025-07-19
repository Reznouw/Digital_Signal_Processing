%Programa para grabar audio
clear variables;    %Elimina todas las variables
close all;          %Cierra todas las ventanas de gráficos
clc;                %Elimina el comand window - Limpia Memoria RAM

%Párametros de Captura
Fs = 8000;  %Frecuencia de muestreo en Hz o muestras/segundo
T = 1/Fs;  %Periodo de muestreo en segundos
r = 24;      %Número de bits para codificar la señal (8, 14 o 24)

Tc = 15;     %Tiempo de captura en segundos


%Puertos de Entrada y Salida del Computador
a = audiodevinfo();
ID_I = 1;   %Dispositivo de grabación del Prof. Dianderas
ID_O = 6;   %Dispositivo de reproducción del Prof. Dianderas
n_c = 1;    %número de canales: 1 mono - 2 estereo

%Despliegue grabadora
%grabadora = audiorecorder(Fs,r,n_c,ID_I);
%record(grabadora, Tc);
%pause(Tc+1);
%x = getaudiodata(grabadora,'double');

%t = 0:T:Tc-T;

%figure();
%plot(t,x);title("Señal Capturada");

 x = audioread("test4_P1.wav");

%Gráficas
tam_x = length(x); v_t = (0:tam_x-1)*1/Fs;
figure();plot(v_t,x,'g');title('Señal Original');
xlabel('Tiempo (s)');ylabel('Amplitud (V)');

%Reproduccion de la señal
%reproductor = audioplayer(x,Fs,r,ID_O);   %Preparo el archivo a reproducir
%play(reproductor);

%Calculo Energia para empezar a detectar inicio y fin
Tam_Ventana = round(0.03*Fs); %Ventana de 30 ms
Tam_Traslape = round(0*Fs);   %Sobrelapamiento de 0 ms - No existe

energia = cal_energia(x,Tam_Ventana,Tam_Traslape);
num_bloques=length(energia);
n_vector = 0:num_bloques-1;

figure();stem(n_vector,energia);title('Energía por bloque');

%umbral = 0.0001; %En base a la gráfica que tengo selecciono el umbral que más se adecua
%umral = 0.001;
umbral = 0.005
%Si rellene en P2, acá aplico el mismo procedimiento

intervalos = [0 5];
energia_mayor = rellenar2(energia > umbral, intervalos);

energia_mayor = rellenar2(energia_mayor);

figure();
stem(n_vector,energia_mayor);

posiciones = obtener_medio(energia_mayor,num_bloques);

C_V = length(posiciones.medio);    %Cantidad de vocales identificadas en el audio

ventana = hamming(Tam_Ventana); %Ventana de Hamming
lista_descriptores = audioFeatureExtractor(SampleRate=Fs,Window=ventana,OverlapLength=Tam_Traslape,...
                        mfcc=true);

%Llamo la Red
Red=load('Red_NN_C.mat');
M=Red.RESULTADO.M;
S=Red.RESULTADO.S;
red_nn1=Red.RESULTADO.red3;
posicionesd = Red.RESULTADO.posicionesd;  %Red nn

etiqueta_predicha = zeros(1,C_V);    %Vector donde almaceno las etiquetas predichas

bloques_analizar = 32;
mitad_bl_analizar = bloques_analizar/2;

for i =1:1:C_V
    
    p_i = Tam_Ventana*(posiciones.medio(i)-mitad_bl_analizar)+1;   %Agregro un bloque a la izquierda
    p_f = Tam_Ventana*(posiciones.medio(i)+mitad_bl_analizar);

    segmento_audio = x(p_i:p_f); %Extraigo el segmento de audio

    %Ya tengo segmento de audio
    %Acá obtengo los descriptores de la señal
    vec_caracteristicas = extract(lista_descriptores,segmento_audio);

    x_test = vec_caracteristicas';
    x_test=[x_test(:)]';   %Vector de 10 bloques de descriptores - XTEST
    
    %Elimacion de lo que no sirve
    x_test(posicionesd)=[];
    
    x_test_normalizado = (x_test-M)./S;  %Normalizo la data
    
    prediction3 = (red_nn1(x_test_normalizado'));
    prediction3 = prediction3/max(prediction3);
    y_test = find(round((prediction3(:,1)==1)));

    etiqueta_predicha(i) = y_test;
end

for i =1:length(etiqueta_predicha)
    switch etiqueta_predicha(i)
        case 1
            disp('subir');
        case 2
            disp('bajar');
        case 3
            disp('ir');
        case 4
            disp('primer');
        case 5
            disp('segundo');
        case 6
            disp('tercer');
        case 7
            disp('cuarto');
        case 8
            disp('quinto');
        case 9
            disp('sexto');
        case 10
            disp('sotano');
        case 11
            disp('piso');
    end
end