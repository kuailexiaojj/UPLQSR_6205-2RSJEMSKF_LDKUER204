function y=fun(x)

% a=x(:,1)';
% b=x(:,2)';
% c=x(:,3)';

% k=x(:,1)';
% q=x(:,2)';
% w=x(:,3)';
% beta=x(:,4)';
a1=x(:,1)';
b1=x(:,2)';
v=x(:,3)';
r=x(:,4)';
c=x(:,5)';
e=x(:,6)';
% k=x(:,1)';
% q=x(:,2)';
% w=x(:,3)';
% lambda=x(:,4)';
% beta=x(:,5)';

D=0.35; 
% ff0=108;%130��Ȧ
% ff0=162;%105��Ȧ
%ff0=107.52;%����

% fs=25600;%��������
fs=12000;%������ѧ
fsr=5;
Ts=1/fs;
t=0:Ts:9999*Ts;%������ѧ
%t=0:Ts:19999*Ts;%����
h=1/fsr;%ʱ�䲽����������Ƶ��

% z=importdata('130.mat');%������ѧ���ݣ�105.mat����Ȧ���ݣ�130.mat����Ȧ���ݣ�ϵͳ������Ҫ����
% Inn=z.X130_DE_time(1:10000);%���������˵���Ȧ��������1:10000

z=importdata('105.mat');%������ѧ���ݣ�105.mat����Ȧ���ݣ�130.mat����Ȧ���ݣ�ϵͳ������Ҫ����
Inn=z.X105_DE_time(10001:20000);%���������˵���Ȧ��������10001:20000
%Inn=0.1*cos(2*pi*100*t);
% z=importdata('107_XJ.mat');          %��������     107.52
% Inn=z(1:20000);           %��������


   noise=sqrt(2*D)*randn(size(t));
%   q=0.3;tao=1/200;taocor=2;tend=10;
% a3=0.5;b3=0;c3=-a3;
% D=taocor*(a3^2*q+b3^2*(1-2*q)+c3^2*q-(a3*q+b3*(1-2*q)+c3*q)^2);
% t1=0:tao:(length(t)-1)*tao;
% noise = trichotomous1(q,tao,taocor,t1,a3,b3,c3);
  In=noise+Inn';
  y1=hilbert(In);
  yIn=abs(y1);
  y1=yIn-mean(y1);
  y=zeros(1,length(a1));
  snroutyc=zeros(1,length(a1)); 
  %SAoutyc=zeros(1,length(a1));
for i=1:length(a1)
%       x=lgkt_CTSR(a(i),b(i),c(i),h,y1);
     % x=lgkt_SUTSR2(w(i),k(i),q(i),beta(i),h,y1);
%       x=lgkt_SUATSR2(w(i),k(i),q(i),lambda(i),beta(i),h,y1);
      x=TDUPQSRlgkt(a1(i),b1(i),v(i),r(i),c(i),e(i),h,y1);

  % % SA
  %   ff=fs*(1:10000)/20000;
  %   ff0=find(ff==108);
  %   y0=fft(y1,20000); 
  %   py0=y0.*conj(y0)/20000;
  %   po0=py0(2:10001);
  % 
  %   y11=fft(x,20000); 
  %   py1=y11.*conj(y11)/20000;
  %   po1=py1(2:10001);
  %   SAoutyc(i)=po1(ff0)/po0(ff0);
  %   y(i)=real(SAoutyc(i));

%     SNR
    y0=fft(x,20000); 
    py0=y0.*conj(y0)/20000;
    ff=fs*(1:10000)/20000;

    ff0=find(ff==162);
    po0=py0(2:10001);
    snroutyc(i) =10*log10( po0(ff0)/(sum(po0)-po0(ff0)));
    y(i)=real(snroutyc(i)+40);
end
end
