clear variables;
close all;
clc;

% Parámetros de diseño
fs = 1000; % Frecuencia de muestreo (Hz)
wp = [200 300]/(fs/2); % Frecuencia de paso normalizada
ws = [150 350]/(fs/2); % Frecuencia de rechazo normalizada
rp = 1;   % Rizado en banda de paso (dB)
rs = 40;  % Atenuación en banda de rechazo (dB)

% Diseño del filtro IIR Butterworth
[n, Wn] = buttord(wp, ws, rp, rs);
[b_iir, a_iir] = butter(n, Wn, 'bandpass');

% Visualización
fvtool(b_iir, a_iir, 'Fs', fs)
title('Filtro Pasa Banda IIR - Butterworth')
