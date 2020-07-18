close all
clear all
clc
x1=zeros(1,100);
x2=ones(1,100);
y=[];           
y3=1:800;
y2=1:800;
y1=1:800;
z=1:800;       
m=0:7;
for i=1:8
    if(m(i)==0)
        y=[y x1 x1 x1];
    elseif(m(i)==1)
        y=[y x1 x1 x2];
    elseif(m(i)==2)
        y=[y x1 x2 x1];
    elseif(m(i)==3)
        y=[y x1 x2 x2];
    elseif(m(i)==4)
        y=[y x2 x1 x1];
    elseif(m(i)==5)
        y=[y x2 x1 x2];
    elseif(m(i)==6)
        y=[y x2 x2 x1];
    elseif(m(i)==7)
        y=[y x2 x2 x2];
    end
end
j=0;
for k=1:300:2400
    for i=1:100
       y3(i+j)=y(k);      
       y2(i+j)=y(k+100);  
       y1(i+j)=y(k+200);  
    end
    j=j+100;
end            
t=0:0.00125:0.9988;                         
A=4;                                        
f=input('Enter the frequency of carrier='); 
for i=1:800
    if(y3(i)==0 && y2(i)==0 && y1(i)==0)
        phid=0;
    elseif(y3(i)==0 && y2(i)==0 && y1(i)==1)
        phid=45;
    elseif(y3(i)==0 && y2(i)==1 && y1(i)==0)
        phid=90;
    elseif(y3(i)==0 && y2(i)==1 && y1(i)==1)
        phid=135;
    elseif(y3(i)==1 && y2(i)==0 && y1(i)==0)
        phid=180;
    elseif(y3(i)==1 && y2(i)==0 && y1(i)==1)
        phid=225;
    elseif(y3(i)==1 && y2(i)==1 && y1(i)==0)
        phid=270;
    elseif(y3(i)==1 && y2(i)==1 && y1(i)==1)
        phid=315;
    end
    phir=phid*(pi/180);
    z(i)=A*sin(2*pi*t(i)*f+phir);
end
t1=0:0.0004166:0.99958;            
t2=0:0.00125:0.9988;           
    subplot(2,1,1);
plot(t2,y1,'r','linewidth',2);
xlabel('Time'); 
ylabel('Amplitude'); 
title('Импульс');
grid on;
    subplot(2,1,2); 
plot(t2,z,'linewidth',2);
xlabel('Time'); 
ylabel('Amplitude'); 
title('8-PSK');
grid on;
