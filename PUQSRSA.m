function eta=PUQSRSA(a1,b1,b2,m,omega,D)
A=1;
x11=2.*m-sqrt(b1.\a1);x22=m;x33=sqrt(b1.\a1);x44=0;x55=-sqrt(b1.\a1);x66=-m;x77=-2.*m+sqrt(b1.\a1);
syms p1(t) p3(t) p5(t) p7(t) t;
[r13,r31,r35,r53,r57,r75]=PUQSRkramers(a1,b1,b2,m);
p1s=zeros(1,length(D));p3s=zeros(1,length(D));p5s=zeros(1,length(D));p7s=zeros(1,length(D));
for m=1:length(D)
eqn1=diff(p1,t)==-r13(m)*p1+r31(m)*p3;
eqn2=diff(p3,t)==r13(m)*p1-(r31(m)+r35(m))*p3+r53(m)*p5;
eqn3=diff(p5,t)==r35(m)*p3+r75(m)*p7-(r53(m)+r57(m))*p5;
eqn4=diff(p7,t)==r57(m)*p5-r75(m)*p7;
eqns=[eqn1,eqn2,eqn3,eqn4];
cond=[p1(0)==0.35,p3(0)==0.3,p5(0)==0.3,p7(0)==0.35];
S=dsolve(eqns,cond);%%%cond为初始条件或者边界条件
p1s(m)=single(subs(S.p1,t,1e5));%给t取得10^5
p3s(m)=single(subs(S.p3,t,1e5));%single将数据类型定义为4个字节
p5s(m)=single(subs(S.p5,t,1e5));
p7s(m)=single(subs(S.p7,t,1e5));
end

%g13=abs(x11-x22);g31=abs(x33-x22);g35=abs(x33-x44);g53=abs(x55-x44);g57=abs(x55-x66);g75=abs(x77-x66);
g13=x22-x11;g31=x22-x33;g35=x44-x33;g53=x44-x55;g57=x66-x55;g75=x66-x77;
amp1=zeros(1,length(D));fa1=zeros(1,length(D));
amp2=zeros(1,length(D));fa2=zeros(1,length(D));
amp3=zeros(1,length(D));fa3=zeros(1,length(D));
amp4=zeros(1,length(D));fa4=zeros(1,length(D));
for m=1:length(D)   
    K=[-r13(m),r31(m),0,0;r13(m),-(r31(m)+r35(m)),r53(m),0;0,r35(m),-(r53(m)+r57(m)),r75(m);0,0,r57(m),-r75(m)];
    [VK,DK]=eig(K);%%%%eig函数---->DK返回特征值的对角矩阵，VK列对应的右特征向量 K*VK=VK*DK
    delta_K=(1/D(m))*[-r13(m)*g13,r31(m)*g31,0,0
        r13(m)*g13,-(r31(m)*g31+r35(m)*g35),r53(m)*g53,0
        0,r35(m)*g35,-(r53(m)*g53+r57(m)*g57),r75(m)*g75
        0,0,r57(m)*g57,-r75(m)*g75];
    P0=[p1s(m);p3s(m);p5s(m);p7s(m)];
    F=delta_K*P0;
    gama=(F'/VK)';
    denoA=omega./(diag(DK).^2+omega^2);%%%%%返回一个几行一列的矩阵
    A1=sum(denoA.*gama.*VK(:,1));%w 第一列
    A2=sum(denoA.*gama.*VK(:,2));%gama -> m
    A3=sum(denoA.*gama.*VK(:,3));
    A4=sum(denoA.*gama.*VK(:,4));
    denoB=diag(DK)./(diag(DK).^2+omega^2);
    B1=-sum(denoB.*gama.*VK(:,1));%h
    B2=-sum(denoB.*gama.*VK(:,2));
    B3=-sum(denoB.*gama.*VK(:,3));
    B4=-sum(denoB.*gama.*VK(:,4));
    R1=A1^2+B1^2;R2=A2^2+B2^2;R3=A3^2+B3^2;R4=A4^2+B4^2;
    fa1(m)=atan(B1/A1);fa2(m)=atan(B2/A2);fa3(m)=atan(B3/A3);fa4(m)=atan(B4/A4);
    amp1(m)=A*sqrt(R1);
    amp2(m)=A*sqrt(R2);
    amp3(m)=A*sqrt(R3);  
    amp4(m)=A*sqrt(R4); 
end
T1=sqrt((x11.^2).*(amp1.^2)+(x33.^2).*(amp2.^2)+2.*x11.*amp1.*x33.*amp2.*cos(fa1-fa2));
T2=sqrt((x55.^2).*(amp3.^2)+(x77.^2).*(amp4.^2)+2.*x55.*amp3.*x77.*amp4.*cos(fa3-fa4));
Q1=atan(((x11.*amp1)-(x33.*amp2))./((x11.*amp1)+(x33.*amp2)).*tan((fa1-fa2)/2));
Q2=atan(((x55.*amp3)-(x77.*amp4))./((x55.*amp3)+(x77.*amp4)).*tan((fa3-fa4)/2));
E=T1.^2+T2.^2+2.*T1.*T2.*cos(Q1-Q2);

eta=E./(A.^2);
end
