function energia_mayor = rellenar2(energia_binaria, intervalos_a_eliminar)
    % Primero: Eliminar intervalos no deseados
    if nargin > 1 && ~isempty(intervalos_a_eliminar)
        for k = 1:size(intervalos_a_eliminar, 1)
            inicio = max(1, intervalos_a_eliminar(k,1)+1); % +1 porque MATLAB indexa desde 1
            fin = min(length(energia_binaria), intervalos_a_eliminar(k,2)+1);
            energia_binaria(inicio:fin) = 0;
        end
    end
    
    % Segundo: Rellenar huecos cortos (1-10 muestras)
    energia_mayor = energia_binaria;
    num_bloques = length(energia_binaria);
    
    i = 2; % Empezamos en 2 para comparar con anterior
    while i <= num_bloques-1
        if energia_mayor(i) == 0
            % Detectar longitud del hueco
            inicio = i;
            fin = i;
            while fin <= num_bloques && energia_mayor(fin) == 0
                fin = fin + 1;
            end
            fin = fin - 1;
            longitud = fin - inicio + 1;
            
            % Rellenar si el hueco es <= 10 y está entre actividad vocal
            if longitud <= 11 && (energia_mayor(inicio-1) == 1) && (fin < num_bloques && energia_mayor(fin+1) == 1)
                energia_mayor(inicio:fin) = 1;
                i = fin + 1; % Saltar al final del hueco rellenado
            else
                i = i + 1;
            end
        else
            i = i + 1;
        end
    end
    
    % Tercero: Eliminar segmentos de voz demasiado cortos (<3 muestras)
    i = 1;
    while i <= num_bloques
        if energia_mayor(i) == 1
            inicio = i;
            fin = inicio;
            while fin <= num_bloques && energia_mayor(fin) == 1
                fin = fin + 1;
            end
            fin = fin - 1;
            
            if (fin - inicio + 1) < 3
                energia_mayor(inicio:fin) = 0;
            end
            i = fin + 1;
        else
            i = i + 1;
        end
    end
end