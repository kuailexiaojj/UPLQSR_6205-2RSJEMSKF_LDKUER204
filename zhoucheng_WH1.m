clear all;close all;clc
fs=25600;
fsr=5;
Ts=1/fs;
h=1/fsr;%时间步长，二次样频率
t=0:Ts:19999*Ts;
z1=importdata('z.mat');%西交107.52hz

% a=0.0819;b=0.2035;c=0.0508;d=2.1028;r=2.0328;
% a1=0.0015;b1=0.3738;c1=0.0668;d1=2.4508;m=0.6105;r1=2.3528;%高斯白噪声
a=1.9797;b=2.1919;c=3.710;h1=0.01;%CQSR
a5=a.^2;b5=b.^2;c5=c.^2;
a1=0.9240;b1=1.5259;b2=0.7501;m=1.4510;%PUQSR
v1=2*m-sqrt(b1.\a1);
v2=2*m-v1;
%N=4096;
%a4=1;b4=1.9;v4=0.5;r4=1;%QGSR
%a1=0.4033;b1=2.3518;v=2.17905;r1=0.1094;c1=0.194628;e=0.90661;
x11=z1(1:20000);
%三值噪声
% q=0.1;tao=1/200;taocor=2;tend=10;
% a3=0.5;b3=0;c3=-a3;
% D1=taocor*(a3^2*q+b3^2*(1-2*q)+c3^2*q-(a3*q+b3*(1-2*q)+c3*q)^2)
% t1=0:tao:(length(t)-1)*tao;
% noise = trichotomous1(q,tao,taocor,t1,a3,b3,c3);
% figure(5)
% plot(t1,noise)
%白噪声
D=0.1;
noise1=sqrt(2*D)*randn(size(t));

% %levy
% noise2=sqrt(2*0.01)*rasd(length(t),1.6,0,1,0);
%  x1=noise+noise1+noise2+x11';

y1=hilbert(x1);
yIn1=abs(y1);
y1=yIn1-mean(y1);

x=PUQSRlgkt(a1,b1,b2,m,v1,v2,h,y1);
xx=QSRlgkt(a3,b3,c3,h1,h,y2);
%xxx=ODUPQSRlgkt(a4,b4,v4,r4,h,y1);
%% 输入信号
ff=fs*(1:10000)/20000; 

y00=fft(x11,20000); 
py00=y00.*conj(y00)/20000;
po00=py00(1:10000);

y0=fft(x1,20000); 
py0=y0.*conj(y0)/20000;
po0=py0(1:10000);

%% 输出信号 
y11=fft(x,20000); 
py1=y11.*conj(y11)/20000;
po1=py1(2:10001);

y2=fft(xx,20000); 
py2=y2.*conj(y2)/20000;
po2=py2(2:10001);

y3=fft(xxx,20000); 
py3=y3.*conj(y3)/20000;
po3=py3(2:10001);

figure(1);% 原始轴承信号
subplot(3,1,1);plot(t,x11,'k');
xlim([0 0.2])
xlabel('时间/s');
ylabel('幅值');
subplot(3,1,2);plot(t,x1,'k');
xlim([0 0.2])
xlabel('时间/s');
ylabel('幅值');
subplot(3,1,3);plot(ff,po0,'k');xlim([10 3000]); 
xlim([0 3000]);
xlabel('频率/HZ');
ylabel('幅值');


%% 输出频谱
figure(2);
subplot(2,1,1);plot(t,x,'k');xlim([0 0.1]);
xlabel('时间/s');
ylabel('幅值');
subplot(2,1,2);plot(ff,po1,'k');xlim([10 3000]);
xlabel('频率/HZ');
ylabel('幅值');
ma1=max(x);mi1=min(x);pk1=ma1-mi1;xr1=mean(sqrt(abs(x)))^2;L1=pk1./xr1;
subplot(2,1,3);plot(ff,po1,'k');L1
figure(3);
subplot(2,1,1);plot(t,xx,'k');xlim([0 0.1]);
xlabel('时间/s');
ylabel('幅值');
subplot(2,1,2);plot(ff,po2,'k');xlim([10 3000]);
xlabel('频率/HZ');
ylabel('幅值');
ma2=max(xx);mi2=min(xx);pk2=ma2-mi2;xr2=mean(sqrt(abs(xx)))^2;L2=pk2./xr2;
L2
figure(4);
subplot(2,1,1);plot(t,xxx,'k');xlim([0 0.1]);
xlabel('时间/s');
ylabel('幅值');
subplot(2,1,2);plot(ff,po3,'k');xlim([10 3000]);
xlabel('频率/HZ');
ylabel('幅值');
ma3=max(xxx);mi3=min(xxx);pk3=ma3-mi3;xr3=mean(sqrt(abs(xxx)))^2;L3=pk3./xr3;
L3
ff0=find(ff==107.52);
SNRin = 10*log10(po0(ff0)/(sum(po0)-po0(ff0)))
SNRout1 =10*log10( po1(ff0)/(sum(po1)-po1(ff0)))
SNRout2 =10*log10( po2(ff0)/(sum(po2)-po2(ff0)))
SNRout3 =10*log10( po3(ff0)/(sum(po3)-po3(ff0)))
SNRG1=SNRout1-SNRin
SNRG2=SNRout2-SNRin
SNRG3=SNRout3-SNRin