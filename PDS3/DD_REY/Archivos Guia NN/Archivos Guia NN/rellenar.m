function resultado = rellenar(son, intervalos_a_eliminar)
    rellenado = son;
    num_bloques = length(son);
    
    % Expand the window size to better capture longer gaps
    ventana_size = 7;  % Increased from 7 to 9 for better context
    mitad_ventana = floor(ventana_size/2);
    
    for i = mitad_ventana+1:num_bloques-mitad_ventana
        ventana = son(i-mitad_ventana:i+mitad_ventana);
        
        % Existing cases
        if all(ventana([1 2 3]) == 1) && ventana(mitad_ventana+1) == 0 && ventana(mitad_ventana+2) == 1
            rellenado(i) = 1;
        end
        if son(i-2) == 1 && son(i-1) == 1 && son(i) == 0 && son(i+1) == 1
            rellenado(i) = 1;
        end
        if son(i-1) == 1 && son(i) == 0 && son(i+1) == 0 && son(i+2) == 1
            rellenado(i:i+1) = 1;
        end
        if son(i-1) == 1 && son(i) == 0 && son(i+1) == 0 && son(i+2) == 0 && son(i+3) == 1
            rellenado(i:i+2) = 1;
        end
        
        % New cases for longer gaps (up to 6 zeros)
        if son(i-1) == 1 && all(son(i:i+3) == 0) && son(i+4) == 1
            rellenado(i:i+3) = 1;
        end
        if son(i-1) == 1 && all(son(i:i+4) == 0) && son(i+5) == 1
            rellenado(i:i+4) = 1;
        end
        if son(i-1) == 1 && all(son(i:i+5) == 0) && son(i+6) == 1
            rellenado(i:i+5) = 1;
        end
        
        % Case for words like "sexto" where there might be a natural gap
        % Look for patterns where there's voice on both sides of a medium gap
        if sum(ventana(1:3)) >= 2 && sum(ventana(end-2:end)) >= 2 && sum(ventana) >= 4
            rellenado(i-mitad_ventana:i+mitad_ventana) = 1;
        end
        
        % More aggressive filling when there's strong voice activity nearby
        if sum(ventana) >= 5
            rellenado(i-mitad_ventana:i+mitad_ventana) = 1;
        end
    end
    
    % Post-processing to clean up short segments
    min_duracion = 5;  % Increased minimum duration
    resultado = rellenado;
    i = 1;
    while i <= num_bloques
        if resultado(i) == 1
            j = i;
            while j <= num_bloques && resultado(j) == 1
                j = j + 1;
            end
            duracion = j - i;
            if duracion < min_duracion
                % Only remove if not surrounded by voice activity
                if (i == 1 || resultado(i-1) == 0) && (j > num_bloques || resultado(j) == 0)
                    resultado(i:j-1) = 0;
                end
            end
            i = j;
        else
            i = i + 1;
        end
    end
    
    % Apply manual intervals to remove if provided
    if nargin > 1 && ~isempty(intervalos_a_eliminar)
        for k = 1:size(intervalos_a_eliminar, 1)
            inicio = max(1, intervalos_a_eliminar(k,1));
            fin = min(num_bloques, intervalos_a_eliminar(k,2));
            resultado(inicio:fin) = 0;
        end
    end
    
    % Final smoothing pass
    resultado = medfilt1(double(resultado), 5) > 0.5;
end