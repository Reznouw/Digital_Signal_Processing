function valor_snr = fsnr(x,y)
%% Hallando el error de cuantificación y la SNR
e=y-x;
Ee=sum(e.^2)+(10^-20);
ex=sum(x.^2);
valor_snr= 10*log10(ex/Ee); % Se calcula la relación señal-ruido
end