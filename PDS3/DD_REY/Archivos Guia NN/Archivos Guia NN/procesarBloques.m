function [DESCRIPTORES, etiquetas, locutores] = procesarBloques(x, etiqueta, locutor, Tam_Ventana, Tam_Traslape, mitad_bl_analizar, lista_descriptores)
    bloques = buffer(x, Tam_Ventana, Tam_Traslape, 'nodelay');
    num_bloques = size(bloques, 2);

    DESCRIPTORES = [];
    etiquetas = [];
    locutores = [];

    for i = mitad_bl_analizar+1 : num_bloques - mitad_bl_analizar
        segmento = bloques(:, i - mitad_bl_analizar : i + mitad_bl_analizar);
        segmento = segmento(:);

        vec_caracteristicas = extract(lista_descriptores, segmento);
        vec_2 = vec_caracteristicas';
        vec_2 = [vec_2(:)]';

        DESCRIPTORES = [DESCRIPTORES; vec_2];
        etiquetas = [etiquetas, etiqueta];
        locutores = [locutores, locutor];
    end
end