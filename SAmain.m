clc;clear all;close all;

%  CoreNum=3; %调用的处理器个数
% if parpool('size')<=0  %之前没有打开
%     parpool('open','local',CoreNum);
% else  %之前已经打开
%     disp('matlab pool already started');
%  end

fs=5;
Ts=1/fs;N=4096;
h=1/fs;   
t=0:Ts:(N-1)*Ts;
A=1;
% a=0.5;R=1;V=1;b=sqrt(R^2*log(2*V/(a*R^2)));bata=0.9;
% p1=0.6;q1=1.2;m1=0.05;
% h1=0.5;p1=1;w=1;r=1;m1=1;m2=1.2;
% a1=1;
% b1=1;
% v=1;R=1;
%a1=1.3;b1=1;b2=0.7;m=1.5;%PUQSR
%a1=0.8;b1=1;b2=1;m=1;
a1=1.342;b1=1.057;b2=0.713;m=1.511;
a4=1;b4=1.8;c4=0.6;k=0.8;%高斯势三稳
%a=2.1;b=2.11;c=2.12;h1=1;%QSR此参数可行
a=1.029;b=2.134;c=3.064;h1=1;
m1=1;m2=1;m3=3;k1=0.8;k2=1;%zyj线性三稳参数
f=0.1;
v1=2*m-sqrt(b1.\a1);
v2=2*m-v1;
xm=sqrt((b4+sqrt(b4.^2-4*a4*c4))/(2*c4));
%a3=a.^2;b3=b.^2;c3=c.^2;h1=a3*b3*c3;
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
s=A*cos(2*pi*f.*t);
g=linspace(0.01,2,100);
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
%         x1=lgkt0(a,b,c,h,x);  
        x2=PUQSRlgkt(a1,b1,b2,m,v1,v2,h,x);
        pin=SA(x,N);
%         pout=SNR(x1,N);
        pout3=SA(x2,N);
%         p=pout-pin;
          p3=pout3./pin;
            flag=flag+1;
%             mm(n)=mm(n)+p;
            flag=flag+1;
            mp(n)=mp(n)+p3;
    end
%        Bm(n)=mm(n)/flag;
       Cm(n)=mp(n)/flag;
     
end
% Am=sum(Am1)/50;
p=polyfit(g,Cm,10);
xx=linspace(0.01,2,100);
yy=polyval(p,xx);
figure(1);
% plot(g,Am,'r-.','Linewidth',2);hold on;
% 0plot(g,Bm,'g','Linewidth',2);
% plot(g,Bm,'b','Linewidth',2);
 hold on
plot(xx,yy,'b','Linewidth',2)
%plot(g,Cm,'y','Linewidth',2);
% plot(g,Bm,'b.-.');
% plot(g,abs(Cm),'b');
% plot(g,Cm,'b','Linewidth',2);
% legend('对称双稳','非对称双稳');
xlim([0.01,1])
ylim([0,800])
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
%         x1=lgkt0(a,b,c,h,x);  
       x2=QSRlgkt(a3,b3,c3,h1,h,x);
       %x2=mQSRlgkt(m1,h,x);
        pin=SA(x,N);
%         pout=SNR(x1,N);
        pout3=SA(x2,N);
%         p=pout-pin;
          p3=pout3./pin;
            flag=flag+1;
%             mm(n)=mm(n)+p;
            flag=flag+1;
            mp(n)=mp(n)+p3;
    end
%        Bm(n)=mm(n)/flag;
       Cm(n)=mp(n)/flag;
     
end
% Am=sum(Am1)/50;
p=polyfit(g,Cm,10);
xx=linspace(0.01,2,100);
yy=polyval(p,xx);
hold on
% plot(g,Am,'r-.','Linewidth',2);hold on;
% 0plot(g,Bm,'g','Linewidth',2);
% plot(g,Bm,'b','Linewidth',2);
% hold on
plot(xx,yy,'r','Linewidth',2)
%plot(g,Cm,'y','Linewidth',2);
% plot(g,Bm,'b.-.');
% plot(g,abs(Cm),'b');
% plot(g,Cm,'b','Linewidth',2);
% legend('对称双稳','非对称双稳');
xlim([0.01,1])
ylim([0,800])

