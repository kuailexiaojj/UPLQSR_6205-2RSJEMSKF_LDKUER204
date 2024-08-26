clc;clear all;close all;

fs=5;
Ts=1/fs;N=4096;NN=5000;
h=1/fs;   
t=0:Ts:(N-1)*Ts;

A=0.1;

a1=1.342;b1=1.557;b2=0.713;m=1.511;%PUQSR
a=1.829;b=2.134;c=3.064;h1=1;%QSR
f0=0.01;
v1=2*m-sqrt(b1.\a1);
v2=2*m-v1;
a3=a.^2;b3=b.^2;c3=c.^2;
%a3=0.7;b3=1.7;c3=2;h1=1;



% s=0.1*cos(2*pi*f0.*t);%+0.2*cos(2*pi*0.03.*t)+0.2*cos(2*pi*0.05.*t);
% D=1;
% NN=5000;
% ff=fs.*(0:NN/2-1)/NN;
% ff0=find(ff==f0);   
% randn('state',500*sum(clock))
% noise=sqrt(2*D).*randn(1,length(s));


%% 绘制 Am(fo)-D 图像
s=A*cos(2*pi*f0.*t);
g=linspace(0.28,15,50);
% g=0:0.01:3;
p=0;pin=0;pout=0;
%  Am=zeros(1,length(g));
  mm=zeros(1,length(g));
  mn=zeros(1,length(g));
  Bm=zeros(1,length(g));
  mp=zeros(1,length(g));
%   Cm=zeros(1,length(g));


% noise1=sqrt(2*Q)*+++randn(1,length(s));
for n=1:length(g)
    flag=0;
    n
    for i=1:50
        x=s+sqrt(2*g(n))*randn(1,length(s));
 
        x2=QSRlgkt(a3,b3,c3,h1,h,x);%经典四稳
        pin=SNR(x,N);

        pout3=SNR(x2,N);

          p3=pout3-pin;
            flag=flag+1;

            
            mp(n)=mp(n)+p3;
    end

       Cm(n)=mp(n)/flag;

end

figure(1);
plot(g,Cm,'y-*','Linewidth',2);



   

%此处，PUQSRlgkt性能略好于accuracyPUQSRlgkt


p=0;pin=0;pout=0;

  mm=zeros(1,length(g));
  mn=zeros(1,length(g));
  Bm=zeros(1,length(g));
  mp=zeros(1,length(g));

for n=1:length(g)
    flag=0;
    n
    for i=1:50
        x=s+sqrt(2*g(n))*randn(1,length(s));

        x2=PUQSRlgkt(a1,b1,b2,m,v1,v2,h,x);%分段四稳
        pin=SNR(x,N);

        pout3=SNR(x2,N);

          p3=pout3-pin;
            flag=flag+1;

            flag=flag+1;
            mp(n)=mp(n)+p3;
    end

       Cm(n)=mp(n)/flag;

end

hold on

 plot(g,Cm,'r-*','Linewidth',2);

legend('CQSR','UPLQSR')