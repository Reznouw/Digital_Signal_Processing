clear variables;
close all;
clc;
warning off;

%Solo existe una variable llamada BD, la forma de la estructura es nombre
%de la variable, letra, datos. En datos se tendrá los descriptores y etiquetas 

BD.subir.x = [];  BD.subir.y = [];
BD.bajar.x = [];  BD.bajar.y = [];
BD.ir.x = [];  BD.ir.y = [];
BD.primer.x = [];  BD.primer.y = [];
BD.segundo.x = [];  BD.segundo.y = [];
BD.tercer.x = [];  BD.tercer.y = [];
BD.cuarto.x = [];  BD.cuarto.y = [];
BD.quinto.x = [];  BD.quinto.y = [];
BD.sexto.x = [];  BD.sexto.y = [];
BD.sotano.x = [];  BD.sotano.y = [];
BD.piso.x = [];  BD.piso.y = [];

BD.subir_P2.x = [];  BD.subir_P2.y = [];
BD.bajar_P2.x = [];  BD.bajar_P2.y = [];
BD.ir_P2.x = [];  BD.ir_P2.y = [];
BD.primer_P2.x = [];  BD.primer_P2.y = [];
BD.segundo_P2.x = [];  BD.segundo_P2.y = [];
BD.tercer_P2.x = [];  BD.tercer_P2.y = [];
BD.cuarto_P2.x = [];  BD.cuarto_P2.y = [];
BD.quinto_P2.x = [];  BD.quinto_P2.y = [];
BD.sexto_P2.x = [];  BD.sexto_P2.y = [];
BD.sotano_P2.x = [];  BD.sotano_P2.y = [];
BD.piso_P2.x = [];  BD.piso_P2.y = [];

BD.subir_P3.x = [];  BD.subir_P3.y = [];
BD.bajar_P3.x = [];  BD.bajar_P3.y = [];
BD.ir_P3.x = [];  BD.ir_P3.y = [];
BD.primer_P3.x = [];  BD.primer_P3.y = [];
BD.segundo_P3.x = [];  BD.segundo_P3.y = [];
BD.tercer_P3.x = [];  BD.tercer_P3.y = [];
BD.cuarto_P3.x = [];  BD.cuarto_P3.y = [];
BD.quinto_P3.x = [];  BD.quinto_P3.y = [];
BD.sexto_P3.x = [];  BD.sexto_P3.y = [];
BD.sotano_P3.x = [];  BD.sotano_P3.y = [];
BD.piso_P3.x = [];  BD.piso_P3.y = [];

% BD.subir_P4.x = [];  BD.subir_P4.y = [];
% BD.bajar_P4.x = [];  BD.bajar_P4.y = [];
% BD.ir_P4.x = [];  BD.ir_P4.y = [];
% BD.primer_P4.x = [];  BD.primer_P4.y = [];
% BD.segundo_P4.x = [];  BD.segundo_P4.y = [];
% BD.tercer_P4.x = [];  BD.tercer_P4.y = [];
% BD.cuarto_P4.x = [];  BD.cuarto_P4.y = [];
% BD.quinto_P4.x = [];  BD.quinto_P4.y = [];
% BD.sexto_P4.x = [];  BD.sexto_P4.y = [];
% BD.sotano_P4.x = [];  BD.sotano_P4.y = [];
% BD.piso_P4.x = [];  BD.piso_P4.y = [];

%Si no unifique el audio en P2 lo tengo que hacer acá
%Data día 1
DATOS = load('subir_P1.mat');   BD.subir = unir(DATOS,BD.subir); %BD # a
DATOS = load('bajar_P1.mat');   BD.bajar = unir(DATOS,BD.bajar); %BD # e
DATOS = load('ir_P1.mat');   BD.ir = unir(DATOS,BD.ir); %BD # i
DATOS = load('primer_P1.mat');   BD.primer = unir(DATOS,BD.primer); %BD # o
DATOS = load('segundo_P1.mat');   BD.segundo = unir(DATOS,BD.segundo); %BD # u
DATOS = load('tercer_P1.mat');   BD.tercer = unir(DATOS,BD.tercer); %BD # a
DATOS = load('cuarto_P1.mat');   BD.cuarto = unir(DATOS,BD.cuarto); %BD # e
DATOS = load('quinto_P1.mat');   BD.quinto = unir(DATOS,BD.quinto); %BD # i
DATOS = load('sexto_P1.mat');   BD.sexto = unir(DATOS,BD.sexto); %BD # o
DATOS = load('sotano_P1.mat');   BD.sotano = unir(DATOS,BD.sotano); %BD # u
DATOS = load('piso_P1.mat');   BD.piso = unir(DATOS,BD.piso); %BD # u

DATOS = load('subir_P2.mat');   BD.subir_P2 = unir(DATOS,BD.subir_P2); %BD # u
DATOS = load('bajar_P2.mat');   BD.bajar_P2 = unir(DATOS,BD.bajar_P2); %BD # e
DATOS = load('ir_P2.mat');   BD.ir_P2 = unir(DATOS,BD.ir_P2); %BD # i
DATOS = load('primer_P2.mat');   BD.primer_P2 = unir(DATOS,BD.primer_P2); %BD # o
DATOS = load('segundo_P2.mat');   BD.segundo_P2 = unir(DATOS,BD.segundo_P2); %BD # u
DATOS = load('tercer_P2.mat');   BD.tercer_P2 = unir(DATOS,BD.tercer_P2); %BD # a
DATOS = load('cuarto_P2.mat');   BD.cuarto_P2 = unir(DATOS,BD.cuarto_P2); %BD # e
DATOS = load('quinto_P2.mat');   BD.quinto_P2 = unir(DATOS,BD.quinto_P2); %BD # i
DATOS = load('sexto_P2.mat');   BD.sexto_P2 = unir(DATOS,BD.sexto_P2); %BD # o
DATOS = load('sotano_P2.mat');   BD.sotano_P2 = unir(DATOS,BD.sotano_P2); %BD # u
DATOS = load('piso_P2.mat');   BD.piso_P2 = unir(DATOS,BD.piso_P2); %BD # u

DATOS = load('Subir_P3.mat');   BD.subir_P3 = unir(DATOS,BD.subir_P3); %BD # u
DATOS = load('Bajar_P3.mat');   BD.bajar_P3 = unir(DATOS,BD.bajar_P3); %BD # e
DATOS = load('Ir_P3.mat');   BD.ir_P3 = unir(DATOS,BD.ir_P3); %BD # i
DATOS = load('Primer_P3.mat');   BD.primer_P3 = unir(DATOS,BD.primer_P3); %BD # o
DATOS = load('Segundo_P3.mat');   BD.segundo_P3 = unir(DATOS,BD.segundo_P3); %BD # u
DATOS = load('Tercer_P3.mat');   BD.tercer_P3 = unir(DATOS,BD.tercer_P3); %BD # a
DATOS = load('Cuarto_P3.mat');   BD.cuarto_P3 = unir(DATOS,BD.cuarto_P3); %BD # e
DATOS = load('Quinto_P3.mat');   BD.quinto_P3 = unir(DATOS,BD.quinto_P3); %BD # i
DATOS = load('Sexto_P3.mat');   BD.sexto_P3 = unir(DATOS,BD.sexto_P3); %BD # o
DATOS = load('Sotano_P3.mat');   BD.sotano_P3 = unir(DATOS,BD.sotano_P3); %BD # u
DATOS = load('Piso_P3.mat');   BD.piso_P3 = unir(DATOS,BD.piso_P3); %BD # u

% DATOS = load('1.mat');   BD.subir_P4 = unir(DATOS,BD.subir_P4); %BD # u
% DATOS = load('2.mat');   BD.bajar_P4 = unir(DATOS,BD.bajar_P4); %BD # e
% DATOS = load('3.mat');   BD.ir_P4 = unir(DATOS,BD.ir_P4); %BD # i
% DATOS = load('4.mat');   BD.primer_P4 = unir(DATOS,BD.primer_P4); %BD # o
% DATOS = load('5.mat');   BD.segundo_P4 = unir(DATOS,BD.segundo_P4); %BD # u
% DATOS = load('6.mat');   BD.tercer_P4 = unir(DATOS,BD.tercer_P4); %BD # a
% DATOS = load('7.mat');   BD.cuarto_P4 = unir(DATOS,BD.cuarto_P4); %BD # e
% DATOS = load('8.mat');   BD.quinto_P4 = unir(DATOS,BD.quinto_P4); %BD # i
% DATOS = load('9.mat');   BD.sexto_P4 = unir(DATOS,BD.sexto_P4); %BD # o
% DATOS = load('10.mat');   BD.sotano_P4 = unir(DATOS,BD.sotano_P4); %BD # u
% DATOS = load('11.mat');   BD.piso_P4 = unir(DATOS,BD.piso_P4); %BD # u

clear DATOS

% Porcentaje de entrenamiento
% 80% Train, 20% Validation
porcentaje = 0.8; 

% Separación por palabra o piso
DT.subir     = separacion2(BD.subir, porcentaje);
DT.bajar     = separacion2(BD.bajar, porcentaje);
DT.ir        = separacion2(BD.ir, porcentaje);
DT.primer    = separacion2(BD.primer, porcentaje);
DT.segundo   = separacion2(BD.segundo, porcentaje);
DT.tercer    = separacion2(BD.tercer, porcentaje);
DT.cuarto    = separacion2(BD.cuarto, porcentaje);
DT.quinto    = separacion2(BD.quinto, porcentaje);
DT.sexto     = separacion2(BD.sexto, porcentaje);
DT.sotano    = separacion2(BD.sotano, porcentaje);
DT.piso      = separacion2(BD.piso, porcentaje);

DT.subir_P2      = separacion2(BD.subir_P2, porcentaje);
DT.bajar_P2     = separacion2(BD.bajar_P2, porcentaje);
DT.ir_P2        = separacion2(BD.ir_P2, porcentaje);
DT.primer_P2    = separacion2(BD.primer_P2, porcentaje);
DT.segundo_P2   = separacion2(BD.segundo_P2, porcentaje);
DT.tercer_P2    = separacion2(BD.tercer_P2, porcentaje);
DT.cuarto_P2    = separacion2(BD.cuarto_P2, porcentaje);
DT.quinto_P2    = separacion2(BD.quinto_P2, porcentaje);
DT.sexto_P2     = separacion2(BD.sexto_P2, porcentaje);
DT.sotano_P2    = separacion2(BD.sotano_P2, porcentaje);
DT.piso_P2      = separacion2(BD.piso_P2, porcentaje);

DT.subir_P3      = separacion2(BD.subir_P3, porcentaje);
DT.bajar_P3     = separacion2(BD.bajar_P3, porcentaje);
DT.ir_P3        = separacion2(BD.ir_P3, porcentaje);
DT.primer_P3    = separacion2(BD.primer_P3, porcentaje);
DT.segundo_P3   = separacion2(BD.segundo_P3, porcentaje);
DT.tercer_P3    = separacion2(BD.tercer_P3, porcentaje);
DT.cuarto_P3    = separacion2(BD.cuarto_P3, porcentaje);
DT.quinto_P3    = separacion2(BD.quinto_P3, porcentaje);
DT.sexto_P3     = separacion2(BD.sexto_P3, porcentaje);
DT.sotano_P3    = separacion2(BD.sotano_P3, porcentaje);
DT.piso_P3      = separacion2(BD.piso_P3, porcentaje);

% DT.subir_P4      = separacion2(BD.subir_P4, porcentaje);
% DT.bajar_P4     = separacion2(BD.bajar_P4, porcentaje);
% DT.ir_P4        = separacion2(BD.ir_P4, porcentaje);
% DT.primer_P4    = separacion2(BD.primer_P4, porcentaje);
% DT.segundo_P4   = separacion2(BD.segundo_P4, porcentaje);
% DT.tercer_P4    = separacion2(BD.tercer_P4, porcentaje);
% DT.cuarto_P4    = separacion2(BD.cuarto_P4, porcentaje);
% DT.quinto_P4    = separacion2(BD.quinto_P4, porcentaje);
% DT.sexto_P4     = separacion2(BD.sexto_P4, porcentaje);
% DT.sotano_P4    = separacion2(BD.sotano_P4, porcentaje);
% DT.piso_P4      = separacion2(BD.piso_P4, porcentaje);


clear porcentaje

% 80% entrenamiento
x_train = [DT.subir.ctrain; DT.bajar.ctrain; DT.ir.ctrain; DT.primer.ctrain; ...
    DT.segundo.ctrain; DT.tercer.ctrain; DT.cuarto.ctrain; DT.quinto.ctrain; ...
    DT.sexto.ctrain; DT.sotano.ctrain; DT.piso.ctrain; ...
    DT.subir_P2.ctrain; DT.bajar_P2.ctrain; DT.ir_P2.ctrain; DT.primer_P2.ctrain; ...
    DT.segundo_P2.ctrain; DT.tercer_P2.ctrain; DT.cuarto_P2.ctrain; DT.quinto_P2.ctrain; ...
    DT.sexto_P2.ctrain; DT.sotano_P2.ctrain; DT.piso_P2.ctrain; ...
    DT.subir_P3.ctrain; DT.bajar_P3.ctrain; DT.ir_P3.ctrain; DT.primer_P3.ctrain; ...
    DT.segundo_P3.ctrain; DT.tercer_P3.ctrain; DT.cuarto_P3.ctrain; DT.quinto_P3.ctrain; ...
    DT.sexto_P3.ctrain; DT.sotano_P3.ctrain; DT.piso_P3.ctrain];

y_train = [DT.subir.etrain; DT.bajar.etrain; DT.ir.etrain; DT.primer.etrain; ...
    DT.segundo.etrain; DT.tercer.etrain; DT.cuarto.etrain; DT.quinto.etrain; ...
    DT.sexto.etrain; DT.sotano.etrain; DT.piso.etrain; ...
    DT.subir_P2.etrain; DT.bajar_P2.etrain; DT.ir_P2.etrain; DT.primer_P2.etrain; ...
    DT.segundo_P2.etrain; DT.tercer_P2.etrain; DT.cuarto_P2.etrain; DT.quinto_P2.etrain; ...
    DT.sexto_P2.etrain; DT.sotano_P2.etrain; DT.piso_P2.etrain; ...
    DT.subir_P3.etrain; DT.bajar_P3.etrain; DT.ir_P3.etrain; DT.primer_P3.etrain; ...
    DT.segundo_P3.etrain; DT.tercer_P3.etrain; DT.cuarto_P3.etrain; DT.quinto_P3.etrain; ...
    DT.sexto_P3.etrain; DT.sotano_P3.etrain; DT.piso_P3.etrain];

% 20% validación
x_vald = [DT.subir.cval; DT.bajar.cval; DT.ir.cval; DT.primer.cval; ...
    DT.segundo.cval; DT.tercer.cval; DT.cuarto.cval; DT.quinto.cval; ...
    DT.sexto.cval; DT.sotano.cval; DT.piso.cval; ...
    DT.subir_P2.cval; DT.bajar_P2.cval; DT.ir_P2.cval; DT.primer_P2.cval; ...
    DT.segundo_P2.cval; DT.tercer_P2.cval; DT.cuarto_P2.cval; DT.quinto_P2.cval; ...
    DT.sexto_P2.cval; DT.sotano_P2.cval; DT.piso_P2.cval; ...
    DT.subir_P3.cval; DT.bajar_P3.cval; DT.ir_P3.cval; DT.primer_P3.cval; ...
    DT.segundo_P3.cval; DT.tercer_P3.cval; DT.cuarto_P3.cval; DT.quinto_P3.cval; ...
    DT.sexto_P3.cval; DT.sotano_P3.cval; DT.piso_P3.cval];

y_vald = [DT.subir.eval; DT.bajar.eval; DT.ir.eval; DT.primer.eval; ...
    DT.segundo.eval; DT.tercer.eval; DT.cuarto.eval; DT.quinto.eval; ...
    DT.sexto.eval; DT.sotano.eval; DT.piso.eval; ...
    DT.subir_P2.eval; DT.bajar_P2.eval; DT.ir_P2.eval; DT.primer_P2.eval; ...
    DT.segundo_P2.eval; DT.tercer_P2.eval; DT.cuarto_P2.eval; DT.quinto_P2.eval; ...
    DT.sexto_P2.eval; DT.sotano_P2.eval; DT.piso_P2.eval; ...
    DT.subir_P3.eval; DT.bajar_P3.eval; DT.ir_P3.eval; DT.primer_P3.eval; ...
    DT.segundo_P3.eval; DT.tercer_P3.eval; DT.cuarto_P3.eval; DT.quinto_P3.eval; ...
    DT.sexto_P3.eval; DT.sotano_P3.eval; DT.piso_P3.eval];

%Análisis de Descriptores
%Ejemplo del profesor - Utiliza 3 descriptores
%barkSpectrum: Del 1 al 32 - 32 descriptores
%mfcc: Del 33 al 45 - 13 descriptores
%pitch: 46

ver_descriptor_num = 34;
bloque = 4;
figure();
plot(x_train(:,ver_descriptor_num*1+46*(bloque-1)))
title(sprintf("Descriptor # %2d del bloque %2d", ver_descriptor_num, bloque));

%%Eliminar Descriptores
v_eliminar = [];

bloques_analizar = 32;  %SI CAMBIE EN P2 ACÁ DEBO MODIFICAR

[~,num_descriptorest]=size(BD.subir.x);
num_descriptores = num_descriptorest/bloques_analizar;%Cantidad de descriptores que se tienen en total


posiciones = zeros(1,bloques_analizar*length(v_eliminar));

for i = 1:length(v_eliminar)
    eli = v_eliminar(i);
    %pos = [eli (num_descriptores*(1:7)+eli)];
    pos = eli + num_descriptores*(0:bloques_analizar-1);
    posiciones(((i-1)*bloques_analizar+1):(i*bloques_analizar)) = pos;
end
posicionesd = sort (posiciones, 'descend');
clear posiciones

for i = 1:length(posicionesd)
    x_train(:,posicionesd(i))=[];
    x_vald(:,posicionesd(i))=[];
end

clear i eli v_eliminar

%Normalizar la data
% M = mean(x_train,1);
% S = std(x_train,1);

% M = mean(x_train,1)*0; 
% S = std(x_train,1)*0+1;
M = mean(x_train,1); 
S = std(x_train,1) + 1e-6;  % evita dividir por 0



x_train_normalizado = (x_train-M)./S; %Normalizo la data
x_vald_normalizado = (x_vald-M)./S;  %Normalizo la data

%Preparación de las etiquetas
tam_et1 = length(y_train);
tam_et2 = length(y_vald);

num_etiquetas = 11; %# Del 1 al 5 COLOCAR LA CANTIDAD DE ETIQUETAS QUE USA
y_train_matriz = zeros(num_etiquetas,tam_et1);
y_vald_matriz = zeros(num_etiquetas,tam_et2);

for i = 1:tam_et1
    val = y_train(i);
    y_train_matriz(val,i)=1;
end

for i = 1:tam_et2
    val = y_vald(i);
    y_vald_matriz(val,i)=1;
end

%Generacion de la red y entrenamiento
net1 = patternnet(60);   %Configuro la NN
net1 = train(net1,x_train_normalizado',y_train_matriz); %Entreno la NN

%Proceso de validación de data Train y Validation

%Matriz de confusión data train
red1_p = (net1(x_train_normalizado'));   %Prediciendo la data de entrenamiento
perf1 = perform(net1,y_train_matriz,red1_p);
figure();
plotconfusion(red1_p,y_train_matriz);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Validación data Validation
%Matriz de confusión data Validation
prediction_nn = round(net1(x_vald_normalizado'));  %Prediciendo la data de val
figure();
plotconfusion(y_vald_matriz,prediction_nn);

%SI LA RED FUNCIONA SE GUARDA
RESULTADO.M = M;  %Media
RESULTADO.S = S;  %Desviación estandar
RESULTADO.red3 = net1;  %Red nn
RESULTADO.posicionesd = posicionesd;  %Red nn

% %Comando para guardar la red
save('Red_NN_C.mat','RESULTADO')
% P4_prueba_red