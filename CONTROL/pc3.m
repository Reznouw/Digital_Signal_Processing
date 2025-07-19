% Parámetros
N = 9;                       % Longitud del filtro
n = 0:N-1;                   % Índices del filtro

% Componentes de la expresión
parte1 = sin((100*pi/441)*(n - 4)) ./ (pi*(n - 4));
parte2 = ((-1).^n) .* sin((121*pi/441)*(n - 4)) ./ (pi*(n - 4));

% Corrección en el punto singular (n=4)
parte1(n==4) = 100*pi/441;  % Límite cuando n=4
parte2(n==4) = 121*pi/441;  % Límite cuando n=4

% Ventana Hamming
w = 0.54 - 0.46*cos(2*pi*n/(N-1));

% Resultado final
hRB = (parte1 + parte2) .* w;

% Mostrar resultado
disp(hRB);
