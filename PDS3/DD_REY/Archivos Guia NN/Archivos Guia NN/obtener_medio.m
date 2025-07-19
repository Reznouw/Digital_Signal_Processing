function bloques = obtener_medio(energia_mayor,num_bloques)
b=1;
c=1;
bloque_inicial = [];
bloque_final = [];

%Detección de inicio y fin de segmentos de voz
%%%%0000001111111100000011111000001111100000
for i=4:1:num_bloques-4
  
    if( (energia_mayor(i-3)==0) && (energia_mayor(i-2)==0) && ...
            (energia_mayor(i-1)==0) && (energia_mayor(i)==1) && ...
            (energia_mayor(i+1)==1) && (energia_mayor(i+2)==1) ...
            && (energia_mayor(i+3)==1)&& (energia_mayor(i+4)==1))
        bloque_inicial(b)=i;  %Bloque donde inicia segmento de voz
        b=b+1;
    end

   if( (energia_mayor(i-3)==1) && (energia_mayor(i-2)==1) &&...
           (energia_mayor(i-1)==1) && (energia_mayor(i)==1) && ...
           (energia_mayor(i+1)==0) && (energia_mayor(i+2)==0)&& ...
           (energia_mayor(i+3)==0) && (energia_mayor(i+4)==0) )
        bloque_final(c)=i; %Bloque donde termina segmento de voz
        c=c+1;
   end  
end

bloques.inicio = bloque_inicial;
bloques.medio =  round((bloque_final+bloque_inicial)./2);
bloques.final = bloque_final;