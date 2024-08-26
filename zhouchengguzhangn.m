%%������ѧ��Ȧ
clear all;close all;clc
fs=12000;fsr=5;
Ts=1/fs;
h=1/fsr;%ʱ�䲽����������Ƶ��
t=0:Ts:9999*Ts;

a1=1.7536;b1=1.5118;b2=0.8577;m=1.2505;%PUQSR
a=1.5293;b=2.4724;c=2.964;h1=0.1;%QSR
v1=2*m-sqrt(b1.\a1);
v2=2*m-v1;
a3=a.^2;b3=b.^2;c3=c.^2;
N=10000;

z=importdata('105.mat');%������ѧ���ݣ�105.mat����Ȧ���ݣ�130.mat����Ȧ���ݣ�ϵͳ������Ҫ����

x2=z.X105_DE_time(10001:20000);%���������˵���Ȧ��������10001:20000

D=0.2;%�ɵ���
noise=sqrt(2*D)*randn(size(t));%����ǿ��ΪD�ĸ�˹������
x1=noise+x2';%���ԭʼ�źż������ź�


y1=hilbert(x1);
yIn=abs(y1);
y1=yIn-mean(y1);
y2=hilbert(x1);
yIn=abs(y2);
y2=yIn-mean(y2);

xu=PUQSRlgkt(a1,b1,b2,m,v1,v2,h,y1);
xc=QSRlgkt(a3,b3,c3,h1,h,y2);

%% Ƶ��

y0=fft(x1,10000); 
py0=y0.*conj(y0)/10000;
ff=fs*(1:5000)/10000; 
ff1=fsr*(1:5000)/10000; 
po0=py0(2:5001);
%% ������
%CQSRϵͳ������
y2=fft(xc,10000);
py01=y2.*conj(y2)/10000;
ff=fs*(1:5000)/10000; 
ff1=fsr*(1:5000)/10000; 
po01=py01(2:5001);
%%
%UPLQSRϵͳ������
y1=fft(xu,10000); 
py1=y1.*conj(y1)/10000;
ff=fs*(1:5000)/10000; 
ff1=fsr*(1:5000)/10000; 
po1=py1(2:5001);
%% ���������
ff0=find(ff==162);
SNRin = 10*log10(po0(ff0)/(sum(po0)-po0(ff0)));
SNRout1 =10*log10( po1(ff0)/(sum(po1)-po1(ff0)));
SNRI1=SNRout1-SNRin;
SNRout2 =10*log10( po01(ff0)/(sum(po01)-po01(ff0)));
SNRI2=SNRout2-SNRin;
SNRin%�����ź�SNR
SNRout1%UPLQSR���SNR
SNRout2%CQSR���SNR
SNRI1
SNRI2
figure(1);set(gcf,'color','white');%�����ź�
subplot(2,1,1);plot(t,x1,'k');xlim([0 0.3])
% title('ʱ��');
xlabel('t/s');ylabel('Amplitude');
subplot(2,1,2);plot(ff,po0,'k');xlim([0 6000]);
% title('Ƶ��');
xlabel('f/Hz');ylabel('Amplitude');
% subplot(3,1,3)
% plot(ff,po01,'k');xlim([0 6000]);
% xlabel('f/Hz');ylabel('Amplitude');
%%
figure(2);set(gcf,'color','white');%UPLQSR���
subplot(2,1,1);plot(t,xu,'k');xlim([0 0.3]);
%  ylim([0 2]);
% title('ʱ��');
xlabel('t/s');ylabel('Amplitude');
subplot(2,1,2);plot(ff,po1,'k');xlim([0 3000]);
% ylim([0 10])
% title('Ƶ��');
xlabel('f/Hz');ylabel('Amplitude');

%%
figure(3);set(gcf,'color','white');%CQSR���
subplot(2,1,1);plot(t,xc,'k');xlim([0 0.3]);
%  ylim([0 2]);
% title('ʱ��');
xlabel('t/s');ylabel('Amplitude');
subplot(2,1,2);plot(ff,po01,'k');xlim([0 3000]);
% ylim([0 10])
% title('Ƶ��');
xlabel('f/Hz');ylabel('Amplitude');






