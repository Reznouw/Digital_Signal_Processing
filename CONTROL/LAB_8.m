clear variables;
close all;
clc;

% Variable Laplace
s = tf('s');

%% Constantes dadas
Ka = 50;
Kt = 0.140;
Kb = 0.140;
La = 0.002;  % inductancia
Ra = 4;      % resistencia
Jeq = 0.01;  % inercia equivalente
feq = 0.01;  % fricción

%% b)Simplificación del sistema en un solo bloque 
% Asumiendo Tc = 0 (controlador proporcional unitario)

Circuito = tf(1, [La Ra]);         % Etapa eléctrica
Torque = tf(1, [Jeq feq]);         % Etapa mecánica
Integrador = tf(1, [1 0]);         % Integrador de velocidad a posición
Tanque = tf(1.6, [1 1]);           % Dinámica del nivel del tanque

% Parte inicial del sistema: Circuito eléctrico → Kt → Mecánica
Simple = series(Circuito, Kt);
Simple = series(Simple, Torque);

% Retroalimentación con constante Kb
Simple = feedback(Simple, Kb);     % Cierra el lazo

% Ganancia del amplificador
Simple = series(Ka, Simple);

% Serie final con el bloque del tanque (sin integrador)
Simple = series(Simple, Tanque);

%% Mostrar resultado final
disp('Función de transferencia simplificada del sistema (Planta):');
Simple
%% Mostrar resultado con 3/s

% t = [0:0.3:15]';
% [y, t_out] = step(3 * Simple, t);
% 
% figure;
% plot(t_out, y, 'LineWidth', 1.5);
% title('Respuesta del sistema a una entrada 3/s');
% xlabel('Tiempo (s)');
% ylabel('Nivel del tanque');
% grid on;

%% Mostrar resultado con k=1 y lazo cerrado

% lazo cerrado con K=1
K = 1;
lazo = feedback(K * Simple, 1);

% Entrada 3/s
t = 0:0.3:15;
[y, t_out] = step(3 * lazo, t);

figure;
plot(t_out, y, 'LineWidth', 1.5);
title('Respuesta del sistema a una entrada 3/s');
xlabel('Tiempo (s)');
ylabel('Nivel del tanque');
grid on;

%% Mostrar el resultado con error

e_ss_sim = 3 - y(end)
