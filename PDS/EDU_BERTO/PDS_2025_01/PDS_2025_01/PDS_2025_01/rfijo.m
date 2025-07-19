function y = rfijo(x,rp)
%% Artificio para reducir la calidad de cuantificación
fe= 1;
num = (2^(rp-1) -1)/fe;
yp=round(x*num);

dem = 1/num; 
y=yp*dem;
end
