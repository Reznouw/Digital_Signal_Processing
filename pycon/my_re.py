import numpy as np
import matplotlib.pyplot as plt

# Constantes dadas para los casos
f = np.linspace(1e6, 50e6, 1000)  # Frecuencia de 1 MHz a 200 MHz
w = 2 * np.pi * f  # Frecuencia angular
L = 1.2e-6  # 1.2 uH/m
C = 30e-12  # 30 pF/m

# Casos
# Caso A (R=0, sin pérdidas)
R_A = 0
G_A = 0

# Caso B (R = 0.1 ohm/m, G=0)
R_B = 0.1
G_B = 0

# Caso C (R = 0.1 ohm/m, G = 1e-9 S/m)
R_C = 0.1
G_C = 1e-9

# Fórmula para el módulo de la impedancia característica
def Z_0(R, G, w, L, C):
    return np.sqrt((R + 1j * w * L) / (G + 1j * w * C))

# Calcular el módulo de la impedancia característica para cada caso
Z_0_A = np.abs(Z_0(R_A, G_A, w, L, C))
Z_0_B = np.abs(Z_0(R_B, G_B, w, L, C))
Z_0_C = np.abs(Z_0(R_C, G_C, w, L, C))

# Graficar
plt.figure(figsize=(10, 6))

plt.plot(f / 1e6, Z_0_A, label='Caso A: R=0, G=0 (Sin pérdidas)', color='blue')
plt.plot(f / 1e6, Z_0_B, label='Caso B: R=0.1, G=0', color='green')
plt.plot(f / 1e6, Z_0_C, label='Caso C: R=0.1, G=1e-9', color='red')

plt.title('Variación del Módulo de la Impedancia Característica vs Frecuencia')
plt.xlabel('Frecuencia (MHz)')
plt.ylabel('|Z_0| (Ohmios)')
plt.grid(True)
plt.legend()
plt.show()