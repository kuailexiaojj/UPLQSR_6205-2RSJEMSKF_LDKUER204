clc;
close;
clear;
%Ëæb£º0.8/0.9/1/1.1  Ëæa£º1/1.1/1.2/1.3 Ëæ¦Â£º0.1/0.2/0.3/0.4 Ëæm£º1.3/1.4/1.5/1.6
a1=1;b1=1;b2=0.2;m=1.5;omega=1*2*pi;

D=linspace(0.01,0.5,100);%SA
eta1=PUQSRSA(a1,b1,b2,m,omega,D);

omega=1.1*2*pi;

eta2=PUQSRSA(a1,b1,b2,m,omega,D);

omega=1.2*2*pi;
eta3=PUQSRSA(a1,b1,b2,m,omega,D);

omega=1.3*2*pi;
eta4=PUQSRSA(a1,b1,b2,m,omega,D);
% a1=1.6;
% 
% eta5=PUQSRSA(a1,b1,b2,m,omega,D);
N=10;
for i=1:N
eta1=smooth(eta1);
eta2=smooth(eta2);
eta3=smooth(eta3);
eta4=smooth(eta4);
eta5=smooth(eta5);
% plot(D,eta1,D,eta2,D,eta3,D,eta4);
end
% 
plot(D,eta1,'r','LineWidth',1.2);
hold on
plot(D,eta2,'b','LineWidth',1.2);
hold on
plot(D,eta3,'g','LineWidth',1.2);
hold on
plot(D,eta4,'c','LineWidth',1.2);
hold on
%plot(D,eta5,'--mo','LineWidth',1.2);
% plot(D,eta1,'-ro','LineWidth',1.2);
% hold on
% plot(D,eta2,'--bo','LineWidth',1.2);
% hold on
% plot(D,eta3,'-co','LineWidth',1.2);
% hold on
% plot(D,eta4,'--g*','LineWidth',1.2);
% hold on
% plot(D,eta5,'--m*','LineWidth',1.2);
% l1=legend('\it p=0.2 r=0.2','\it p=0.3 r=0.2','\it p=0.4 r=0.2','\it p=0.3 r=0.4','\it p=0.3 r=0.6','FontName','Times New Roman','FontSize',12);
%l1=legend('\it a=1.2','\it a=1.3','\it a=1.3','\it a=1.4','\it a=1.5','FontName','Times New Roman','FontSize',12);
xlabel('\it D','FontName','Times New Roman','FontSize',12);
ylabel('\it \eta','FontName','Times New Roman','FontSize',12);