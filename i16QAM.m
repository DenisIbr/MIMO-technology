clc;
clear all;
close all;
M=16;
Ld=log2(M);
ds=ceil(Ld);
dif=ds-Ld;
nbit=16;                                        
msg=round(rand(nbit,1));           
disp(' binary information at transmitter ');
disp(msg);
fprintf('\n\n');
x=msg;
bp=.000001;                                                  
bit=[]; 
for n=1:1:length(x)
    if x(n)==1;
       se=ones(1,100);
    else x(n)==0;
        se=zeros(1,100);
    end
     bit=[bit se];

end
t1=bp/100:bp/100:100*length(x)*(bp/100);
subplot(2,1,1);
plot(t1,bit,'r','lineWidth',2);grid on;
axis([ 0 bp*length(x) -.5 1.5]);
ylabel('Amplitude');xlabel('Time');
title('Импульс');
M=M;                                            
msg_reshape=reshape(msg,log2(M),nbit/log2(M))';
size(msg_reshape);
for(j=1:1:nbit/log2(M))
   for(i=1:1:log2(M))
       a(j,i)=num2str(msg_reshape(j,i));
   end
end
as=bin2dec(a);
ast=as';
M=M;                                              
x1=[0:M-1];
p=qammod(ast,M)     
%XXXXXX  QAM-модуляция М(16)-массива XXXXXX
RR=real(p)
II=imag(p)
sp=bp*2;                                     
sr=1/sp;                                                      
f=sr*2;
t=sp/100:sp/100:sp;
ss=length(t);
m=[];
for(k=1:1:length(RR))
    yr=RR(k)*cos(2*pi*f*t);                     
    yim=II(k)*sin(2*pi*f*t);             
    y=yr+yim;
    m=[m y];
end
tt=sp/100:sp/100:sp*length(RR);
    subplot(2,1,2);
plot(tt,m,'lineWidth',2);
title('Форма волны для модуляции 16-QAM');
xlabel('Time'); ylabel('Amplitude');




