function Yf = radaptivo(x,rp,T_v,Fs)

Yf=[];
fe=1;%valor inicial

P = T_V*Fs; %Tamaño del bloque en número de muestras
bloques = buffer(x,P);
[~,num_bloques] = size(bloques);

for i=1:num_bloques
    V = bloques(:,i); %Extraigo el bloque de tamaño de ventana
    fe=max(abs(V)); % Cálculo del factor de escala del bloque
    if(fe==0)
      V=round(V*0)*0; % Cuantización del bloque a un rp fijo
      Yf=[Yf;V]; %Vector resultante recuantizado que será reproducido.
    else
        V=round(V*((2^(rp-1))-1)/fe); % Cuantización del bloque a un rp fijo
        V=V*fe/((2^(rp-1))-1); % Descuantización
        Yf=[Yf;V]; %Vector resultante recuantizado que será reproducido.
     end
end
end
