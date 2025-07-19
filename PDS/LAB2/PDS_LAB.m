clear variables;    %Elimina toda las variables
close all;  %Cierra todas las ventanas/figure
clc;

%Parametros del Muestreo
Fs = 8000;       %Frecuencia (Hz - #de muestras/seg)
T = 1/Fs;         %Periodo de muestreo (s - tiempo entre muestra y muestra)
r = 24;               %# de bits por muestra
Tc = 5;             %Tiempo de captura
NC = 1;                %Mono

%comando para conocer puertos de entrada y salida de audio para computadora
%A.input.Name para saber las entradas
%A.output.Name para saber las salidas
A = audiodevinfo();
ID_Input = 2;
ID_Output = 9;

%Se crea objetos para grabación
grabadora = audiorecorder(Fs,r,NC,ID_Input);

%Se empieza a grabar
record(grabadora,Tc);
pause(Tc+1);
%Se guardar el audio en formato double
x = getaudiodata(grabadora,"double");
N = length(x); %Cantidad de Muestras Totales de x
fprintf('El vector de entrada tiene %4d\n', N);
%Vector de tiempo
t = 0:T:Tc-T;
figure();
subplot(3,1,1);
plot(t,x,"LineWidth",2);%Simulamos una onda continua
xlabel("Tiempo (s)");ylabel("Amplitud (V)");title("Señal en el tiempo ");

subplot(3,1,2);
plot(t,x,"LineWidth",2);hold on; stem(t,x,"LineWidth",2);
xlabel("Tiempo (s)");ylabel("Amplitud (V)");title("Proceso de muestreo ");

subplot(3,1,3);
stem(t,x,'r',"LineWidth",2);
xlabel("Tiempo (s)");ylabel("Amplitud (V)");title("Señal muestreada ");

%Reproduccion de la señal
%Creo un objeto de reprouccion, una reproductora
reproductor = audioplayer(x,Fs,r,ID_Output);
play(reproductor)

%Transformada de Fouier
[X,FREC] = fourier(x,Fs);

figure();
plot(FREC,abs(X));title("Espectro de la Señal de Entrada");
xlabel("Frecuencia (Hz)");