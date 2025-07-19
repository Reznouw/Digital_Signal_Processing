function unido = unir(DATOS,BD)
%DATOS es información a ser incorparada
%BD es la gran base de datos donde voy almacenando todo

aux_x = BD.x;   %Leo lo que ya tenia en la gran base de datos(descriptores);
aux_y = BD.y;   %Leo lo que ya tenia en la gran base de datos(etiquetas);

x = DATOS.DATA.X;   %Leo lo nuevo a añadir en descriptores  
y = DATOS.DATA.Y';  %Leo lo nuevo a añadir en etiquetas

unido.x = [aux_x;x];  %Uno descriptores
unido.y = [aux_y;y];  %Uno etiquetas

end




% function unido = unir(DATOS, BD, vocal, locutor)
% % DATOS  : información cargada desde el .mat (con DATA.X y DATA.Y)
% % BD     : base de datos donde se acumulan los datos
% % vocal  : número de la vocal (1=a, 2=e, 3=i, 4=o, 5=u)
% % locutor: número del locutor (1, 2, 3, 4...)
% 
% % Leer lo anterior
% aux_x = BD.x;
% aux_y = BD.y;
% 
% % Leer lo nuevo
% x = DATOS.DATA.X;
% y = DATOS.DATA.Y';  % Ignorado porque usamos nuestra propia codificación
% 
% % Calcular la etiqueta única: 
% % vocal 1–5, locutor 1–4 → clase = vocal + 5*(locutor - 1)
% etiqueta = vocal + 5*(locutor - 1);
% y_nueva = etiqueta * ones(size(x,1), 1);  % Vector de etiquetas con la misma clase
% 
% % Unir
% unido.x = [aux_x; x];
% unido.y = [aux_y; y_nueva];
% end
