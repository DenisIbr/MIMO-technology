clear all
close all
clc
A=5;
t=0:0.001:1;
f1=20;
f2=5;
x=A.*sin(2*pi*f1*t);
    subplot(3,1,1);
plot(t,x,'g','linewidth',2);
title('Несущая');
grid on;
u=square(2*pi*f2*t);
    subplot(3,1,2);
plot(t,u,'r','linewidth',2);
title('Импульс');
v=x.*u;
    subplot(3,1,3);
plot(t,v,'linewidth',2);
title('BPSK');
grid on;
