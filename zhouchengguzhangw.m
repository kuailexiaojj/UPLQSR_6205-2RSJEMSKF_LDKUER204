clear all;close all;clc
fs=12000;fsr=5;
% N=10000;
Ts=1/fs;
h=1/fsr;%时间步长，二次样频率
t=0:Ts:9999*Ts;

 a1=0.7536;b1=1.9118;b2=0.8577;m=1.2505;%PUQSR
a=1.5797;b=2.1919;c=3.210;h1=0.1;%QSR
v1=2*m-sqrt(b1.\a1);
v2=2*m-v1;
a3=a.^2;b3=b.^2;c3=c.^2;

N=10000;
z=importdata('130.mat');%西储大学数据，105.mat是内圈数据，130.mat是外圈数据，系统参数需要调整

 x2=z.X130_DE_time(1:10000);%驱动计数端的外圈故障数据1:10000

D=0.3;
noise=sqrt(2*D)*randn(size(t));

x1=noise+x2';

y1=hilbert(x1);
yIn=abs(y1);
y1=yIn-mean(y1);
y2=hilbert(x1);
yIn=abs(y2);
y2=yIn-mean(y2);


 xu=PUQSRlgkt(a1,b1,b2,m,v1,v2,h,y1);
xc=QSRlgkt(a3,b3,c3,h1,h,y2);


%% 频谱

y0=fft(x1,10000); 
py0=y0.*conj(y0)/10000;
ff=fs*(1:5000)/10000; 
ff1=fsr*(1:5000)/10000; 
po0=py0(2:5001);
%% 包络谱

y2=fft(xc,10000);
py01=y2.*conj(y2)/10000;
ff=fs*(1:5000)/10000; 
ff1=fsr*(1:5000)/10000; 
po01=py01(2:5001);
%%

y1=fft(xu,10000); 
py1=y1.*conj(y1)/10000;
ff=fs*(1:5000)/10000; 
ff1=fsr*(1:5000)/10000; 
po1=py1(2:5001);
%% 信噪比增益
ff0=find(ff==108);
SNRin = 10*log10(po0(ff0)/(sum(po0)-po0(ff0)));
SNRout1 =10*log10( po1(ff0)/(sum(po1)-po1(ff0)));
SNRI1=SNRout1-SNRin;
SNRout2 =10*log10( po01(ff0)/(sum(po01)-po01(ff0)));
SNRI2=SNRout2-SNRin;
SNRin
SNRout1
SNRout2
SNRI1
SNRI2

figure(1);set(gcf,'color','white');
subplot(2,1,1);plot(t,x1,'k');xlim([0 0.3])
% title('时域');
xlabel('t/s');ylabel('Amplitude');
subplot(2,1,2);plot(ff,po0,'k');xlim([0 6000]);
% title('频谱');
xlabel('f/Hz');ylabel('Amplitude');
% subplot(3,1,3)
% plot(ff,po01,'k');xlim([0 6000]);
% xlabel('f/Hz');ylabel('Amplitude');
%%
figure(2);set(gcf,'color','white');
subplot(2,1,1);plot(t,xu,'k');xlim([0 0.3]);
%  ylim([0 2]);
% title('时域');
xlabel('t/s');ylabel('Amplitude');
subplot(2,1,2);plot(ff,po1,'k');xlim([0 3000]);
% ylim([0 10])
% title('频谱');
xlabel('f/Hz');ylabel('Amplitude');
%%
figure(3);set(gcf,'color','white');
subplot(2,1,1);plot(t,xc,'k');xlim([0 0.3]);
%  ylim([0 2]);
% title('时域');
xlabel('t/s');ylabel('Amplitude');
subplot(2,1,2);plot(ff,po01,'k');xlim([0 3000]);
% ylim([0 10])
% title('频谱');
xlabel('f/Hz');ylabel('Amplitude');

