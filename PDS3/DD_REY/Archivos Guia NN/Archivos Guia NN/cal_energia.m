function energia = cal_energia(x,N_T_V,N_T_T)
% N_T_V - Tamaño de la ventana en número de muestras

%Separo la señal en ventanas de 30ms, calculo la energia 

%bloques = buffer(x,N_T_V);
bloques = buffer(x, N_T_V,N_T_T, 'nodelay');

[~,num_bloques] = size(bloques);

energia = zeros(1,num_bloques); %Vector que almacena la energía de los bloques

for i = 1:num_bloques
    bloque_actual = bloques(:,i);   %Extraigo el bloque de tamaño de ventana
    energia(i) = sum(abs(bloque_actual).^2);  %Fórmula de la Energia
end