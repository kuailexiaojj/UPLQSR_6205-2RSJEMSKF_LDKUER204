clear all;close all;
clc 
fs=5;
Ts=1/fs; 
h=1/fs;   %时间步长 
t=0:Ts:4000*Ts;
a1=1.3;b1=1;b2=0.7;m=1.5;v1=2*m-sqrt(b1.\a1);v2=2*m-v1;
s=1*cos(2*pi*0.01*t);
x1=PUQSRlgkt(a1,b1,b2,m,v1,v2,h,s);
% x1=lgkt0(a1,b1,c1,h,s);
plot(t,x1)
hold on
s=1.2*cos(2*pi*0.01*t);
% x1=lgkt0(a1,b1,c1,h,s);
x1=PUQSRlgkt(a1,b1,b2,m,v1,v2,h,s);
plot(t,x1)
hold on
s=1.4*cos(2*pi*0.01*t);
% x1=lgkt0(a1,b1,c1,h,s);
x1=PUQSRlgkt(a1,b1,b2,m,v1,v2,h,s);
plot(t,x1)
hold on
s=1.6*cos(2*pi*0.01*t);
% x1=lgkt0(a1,b1,c1,h,s);
x1=PUQSRlgkt(a1,b1,b2,m,v1,v2,h,s);
plot(t,x1)