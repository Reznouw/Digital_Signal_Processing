% Parámetros
r = 4;                     % Número de bits
L = 2^r;                   % Niveles de cuantización
xmin = -1;                 % Valor mínimo de entrada
xmax = 1;                  % Valor máximo de entrada
Delta = (xmax - xmin)/L;   % Paso de cuantización (Δ)

% Señal de entrada (puedes cambiarla)
x = linspace(-1.2, 1.2, 1000);  % Señal de entrada

%% MID-RISE

x_q = sign(x) .* (floor(abs(x)/Delta) + 0.5) * Delta;

% Limitar valores fuera de rango (clipping)
x_q(x > xmax) = xmax - Delta/2;
x_q(x < xmin) = xmin + Delta/2;

% Graficar
figure;
stairs(x, x_q, 'LineWidth', 2);
xlabel('Entrada x');
ylabel('Salida cuantizada Q(x)');
title(['Mid-Rise Quantizer (r = ', num2str(r), ' bits)']);
grid on;

% Ejes centrados (X=0 e Y=0)
hold on;
plot([xmin-0.2 xmax+0.2], [0 0], 'k--'); % eje X
plot([0 0], [min(x_q)-0.1 max(x_q)+0.1], 'k--'); % eje Y

%% MID-THREAD

% Cuantización mid-tread
x_q = round(x / Delta) * Delta;

% Limitar valores fuera de rango (clipping)
x_q(x > xmax) = xmax;
x_q(x < xmin) = xmin;

% Gráfico
figure;
stairs(x, x_q, 'LineWidth', 2);
xlabel('Entrada x');
ylabel('Salida cuantizada Q(x)');
title(['Mid-Tread Quantizer (r = ', num2str(r), ' bits)']);
grid on;

% Ejes centrados (X=0 e Y=0)
hold on;
plot([xmin-0.2 xmax+0.2], [0 0], 'k--'); % eje X
plot([0 0], [min(x_q)-0.1 max(x_q)+0.1], 'k--'); % eje Y
