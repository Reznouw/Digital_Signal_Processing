%Parametros de Onda
A= 0.7; %Amplitud
Fo = 150; %Frecuencias de la onda
To= 1/Fo; %Periodo de la Onda (s -Tiempo que demora en completar un

%Parametos del Muestreador
Fs=5*Fo; %Frecuencia de muestreo (Hz -o muestras por segundo)
T=1/Fs; %Periodo de muestreo (s - tiempo entre muestra)

t = 0:T:9*T;

x=A*cos(2*pi*Fo*t+phi);

figuree();
subplot(3,1,1);plot(t,x);title("Señal en el tiempo");xlabel("Tiempo (s)");ylabel("Amplitud (v)");
subplot(3,1,2);plot(t,x);title("Señal en el tiempo");xlabel("Tiempo (s)");ylabel("Amplitud (v)");
subplot(3,1,3);plot(t,x);title("Señal en el tiempo");xlabel("Tiempo (s)");ylabel("Amplitud (v)");