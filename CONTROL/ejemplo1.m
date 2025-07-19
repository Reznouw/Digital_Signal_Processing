clc, clear, close all
t= 0:0.1:10;
seno = sin(t);
plot(t,seno)
coseno = cos(t);
figure
plot(t,coseno)
%----------------------------------------
figure
plot(t,seno,t,coseno)
%-------------------------------------------
figure
plot(t,seno)
hold on
plot(t,coseno)