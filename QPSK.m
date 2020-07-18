close all            
clear all
clc
x1=zeros(1,100);                 
x2=ones(1,100);                      
y=[x1 x1 x1 x2 x2 x1 x2 x2];         
y1=[x1 x2 x1 x2];                   
y2=[x1 x1 x2 x2];                  
k1=1:400;
k2=1:400;
for i=1:400
    if(y1(i)==0)
        k1(i)=1;
    elseif(y1(i)==1)
        k1(i)=-1;
    end
    if(y2(i)==0)
        k2(i)=1;
    elseif(y2(i)==1)
        k2(i)=-1;
    end
end
t=0:0.0025:1;                        
A=4;                                 
f=6;
p=800;                              
z1=1:p/2;                           
z2=1:p/2;                           
z=1:p/2;                          
for i=1:400
    z1(i)=A*k1(i)*sin(2*pi*t(i)*f);   
    z2(i)=A*k2(i)*cos(2*pi*t(i)*f);   
    z(i)=z1(i)+z2(i);
end
t1=0:0.00125:0.99875;                 
t2=0:0.0025:0.9975;                   
    subplot(2,1,1); 
plot(t2,y1,'r','linewidth',3);
xlabel('Time'); 
ylabel('Amplitude'); 
title('Импульс');
grid on;
    subplot(2,1,2); 
plot(t2,z,'linewidth',3);
xlabel('Time'); 
ylabel('Amplitude'); 
title('QPSK');
grid on;
