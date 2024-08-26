function [r13,r31,r35,r53,r57,r75]=PUQSRkramers(a1,b1,b2,m)

% D=linspace(0.02,2,1000);%MFPT
D=linspace(0.01,3,100);%SA
r13=(((D./(b2.^2)).*(exp((b2.*(m-sqrt(a1./b1))./D))+exp((b2.*(-m+sqrt(a1./b1)))./D)-2)).^(-1));
r35=((b2.\sqrt(b1.\a1)).*(1-exp((b2.*(-m+sqrt(b1.\a1)))./D)).*exp((4*b1.*D).\(a1.^2))).^(-1);
r57=((b2.\sqrt(b1.\a1)).*(-1+exp((b2.*(m-sqrt(b1.\a1)))./D)).*exp(-(4*b1.*D).\(a1.^2))).^(-1);
r75=r13;r53=r35;r31=r57;
end
