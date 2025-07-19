function DATOS = separacion2 (BD,porcentaje)

x = BD.x;  %Descriptores
y = BD.y; %Etiquetas

N = length (y); %Cuánta data tengo

Data_T = round(N*porcentaje);  %Cantidad de data de entrenamiento

indices = randperm(N);  %Posiciones que van a ser extraidas

DATOS.ctrain = x(indices(1:Data_T),:);
DATOS.etrain = (y(indices(1:Data_T)));

DATOS.cval = x(indices(Data_T+1:end),:);
DATOS.eval = (y(indices(Data_T+1:end)));

end