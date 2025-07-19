clear variables; 
close all;
clc;
warning off;

% Base de datos de descriptores para cada vocal y cada locutor
% Cada combinación tiene su propio campo

BD.a1.x = [];  BD.a1.y = [];
BD.a2.x = [];  BD.a2.y = [];
BD.e1.x = [];  BD.e1.y = [];
BD.e2.x = [];  BD.e2.y = [];
BD.i1.x = [];  BD.i1.y = [];
BD.i2.x = [];  BD.i2.y = [];
BD.o1.x = [];  BD.o1.y = [];
BD.o2.x = [];  BD.o2.y = [];
BD.u1.x = [];  BD.u1.y = [];
BD.u2.x = [];  BD.u2.y = [];

%% Unificación de datos por vocal y locutor (cada vocal tiene 2 archivos, uno por locutor)
% Vocal A
DATOS = load('a1.mat');   BD.a1 = unir(DATOS, BD.a1, 1, 1); % vocal a - locutor 1
DATOS = load('a1.mat');   BD.a2 = unir(DATOS, BD.a2, 1, 1); % vocal a - locutor 2

% Vocal E
DATOS = load('e1.mat');   BD.e1 = unir(DATOS, BD.e1, 2, 1); % vocal e - locutor 1
DATOS = load('e1.mat');   BD.e2 = unir(DATOS, BD.e2, 2, 1); % vocal e - locutor 2

% Vocal I
DATOS = load('i1.mat');   BD.i1 = unir(DATOS, BD.i1, 3, 1); % vocal i - locutor 1
DATOS = load('i1.mat');   BD.i2 = unir(DATOS, BD.i2, 3, 1); % vocal i - locutor 2

% Vocal O
DATOS = load('o1.mat');   BD.o1 = unir(DATOS, BD.o1, 4, 1); % vocal o - locutor 1
DATOS = load('o1.mat');   BD.o2 = unir(DATOS, BD.o2, 4, 1); % vocal o - locutor 2

% Vocal U
DATOS = load('u1.mat');   BD.u1 = unir(DATOS, BD.u1, 5, 1); % vocal u - locutor 1
DATOS = load('u1.mat');   BD.u2 = unir(DATOS, BD.u2, 5, 1); % vocal u - locutor 2

clear DATOS

%% Separación entre entrenamiento y validación (80% - 20%)

porcentaje = 0.8;

DT.a1 = separacion2(BD.a1, porcentaje);
DT.a2 = separacion2(BD.a2, porcentaje);
DT.e1 = separacion2(BD.e1, porcentaje);
DT.e2 = separacion2(BD.e2, porcentaje);
DT.i1 = separacion2(BD.i1, porcentaje);
DT.i2 = separacion2(BD.i2, porcentaje);
DT.o1 = separacion2(BD.o1, porcentaje);
DT.o2 = separacion2(BD.o2, porcentaje);
DT.u1 = separacion2(BD.u1, porcentaje);
DT.u2 = separacion2(BD.u2, porcentaje);

clear porcentaje

%% Unificación de datos de entrenamiento y validación

x_train = [DT.a1.ctrain; DT.a2.ctrain; DT.e1.ctrain; DT.e2.ctrain; ...
           DT.i1.ctrain; DT.i2.ctrain; DT.o1.ctrain; DT.o2.ctrain; ...
           DT.u1.ctrain; DT.u2.ctrain];

y_train = [DT.a1.etrain; DT.a2.etrain; DT.e1.etrain; DT.e2.etrain; ...
           DT.i1.etrain; DT.i2.etrain; DT.o1.etrain; DT.o2.etrain; ...
           DT.u1.etrain; DT.u2.etrain];

x_vald = [DT.a1.cval; DT.a2.cval; DT.e1.cval; DT.e2.cval; ...
          DT.i1.cval; DT.i2.cval; DT.o1.cval; DT.o2.cval; ...
          DT.u1.cval; DT.u2.cval];

y_vald = [DT.a1.eval; DT.a2.eval; DT.e1.eval; DT.e2.eval; ...
          DT.i1.eval; DT.i2.eval; DT.o1.eval; DT.o2.eval; ...
          DT.u1.eval; DT.u2.eval];

%% Análisis de descriptores (opcional)
%Análisis de Descriptores
%Ejemplo del profesor - Utiliza 3 descriptores
%barkSpectrum: Del 1 al 32 - 32 descriptores
%mfcc: Del 33 al 45 - 13 descriptores
%pitch: 46

ver_descriptor_num = 35;
bloque = 5;
figure();
plot(x_train(:,ver_descriptor_num*1 + 46*(bloque-1)))
title(sprintf("Descriptor # %2d del bloque %2d", ver_descriptor_num, bloque));

%% Eliminación de descriptores (opcional)
v_eliminar = [];

bloques_analizar = 8;
[~,num_descriptorest] = size(x_train);
num_descriptores = num_descriptorest / bloques_analizar;

posiciones = zeros(1, bloques_analizar * length(v_eliminar));
for i = 1:length(v_eliminar)
    eli = v_eliminar(i);
    pos = [eli (num_descriptores*(1:7) + eli)];
    posiciones(((i-1)*bloques_analizar+1):(i*bloques_analizar)) = pos;
end
posicionesd = sort(posiciones, 'descend');

for i = 1:length(posicionesd)
    x_train(:,posicionesd(i)) = [];
    x_vald(:,posicionesd(i)) = [];
end

clear i eli v_eliminar

%% Normalización de datos

M = mean(x_train,1);
S = std(x_train,1);

x_train_normalizado = (x_train - M) ./ S;
x_vald_normalizado = (x_vald - M) ./ S;

%% Preparación de etiquetas en formato one-hot

tam_et1 = length(y_train);
tam_et2 = length(y_vald);
num_etiquetas = 10; % 10 clases: 5 vocales x 2 locutores

y_train_matriz = zeros(num_etiquetas, tam_et1);
y_vald_matriz = zeros(num_etiquetas, tam_et2);

for i = 1:tam_et1
    val = y_train(i);
    y_train_matriz(val, i) = 1;
end

for i = 1:tam_et2
    val = y_vald(i);
    y_vald_matriz(val, i) = 1;
end

%% Creación y entrenamiento de la red neuronal

net1 = patternnet(50);  % red con 40 neuronas ocultas
net1 = train(net1, x_train_normalizado', y_train_matriz);

%% Matriz de confusión - entrenamiento
pred_train = net1(x_train_normalizado');
figure(); plotconfusion(y_train_matriz, pred_train);

%% Matriz de confusión - validación
pred_val = round(net1(x_vald_normalizado'));
figure(); plotconfusion(y_vald_matriz, pred_val);

%% Guardado de resultados

RESULTADO.M = M;
RESULTADO.S = S;
RESULTADO.red3 = net1;
RESULTADO.posicionesd = posicionesd;

% Comando para guardar la red
% save('Red_NN_10clases.mat', 'RESULTADO')
