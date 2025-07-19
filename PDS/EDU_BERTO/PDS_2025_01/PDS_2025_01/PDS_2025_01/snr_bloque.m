function vector_snr = snr_bloque(x,y,T_V,Fs)
% T_V = 30/1000; %Tiempo de duración del bloque en ms
P = T_V*Fs; %Tamaño del bloque en número de muestras
bloques_x = buffer(x,P);
bloques_y = buffer(y,P);

[~,num_bloques] = size(bloques_x);
vector_snr = zeros(1,num_bloques);

for i=1:num_bloques
x1 = bloques_x(:,i); %Extraigo el bloque de tamaño de ventana
y1 = bloques_y(:,i); %Extraigo el bloque de tamaño de ventana

valor_snr_bloque_actual=fsnr(x1,y1);
vector_snr(i)=valor_snr_bloque_actual; %Vector resultante de la SNR en el
tiempo
end