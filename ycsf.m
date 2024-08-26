tic
clear all
close all

pop.size = 500;%��Ⱥ��ģ
pop.cr = 0.4;%�������
pop.mr = 0.3;%�������
pop.ma = 1;

pop = initialization(pop);%��ʼ����Ⱥ
for i = 1:100 %200
    fprintf('%d\n',i)  %��ʾ��������
    pop=newPop(pop,i);
    %������һ����Ⱥ
    %���»��Ƶ�ֵ��ͼ

%        CTSR
%        a=pop.bestSolution(end,1);
%        b=pop.bestSolution(end,2);
%        c=pop.bestSolution(end,3);

%        SUTSR
       % k=pop.bestSolution(end,1);
       % q=pop.bestSolution(end,2);
       % w=pop.bestSolution(end,3);
       % beta=pop.bestSolution(end,4);
       a1=pop.bestSolution(end,1);
       b1=pop.bestSolution(end,2);
       v=pop.bestSolution(end,3);
       r=pop.bestSolution(end,4);
       c=pop.bestSolution(end,5);
       e=pop.bestSolution(end,6);

%        SUATSR
%        k=pop.bestSolution(end,1);
%        q=pop.bestSolution(end,2);
%        w=pop.bestSolution(end,3);
%        lambda=pop.bestSolution(end,4);
%        beta=pop.bestSolution(end,5);
end
%% ����������
plot(1:i,pop.perfom,'r','LineWidth',1.2);
title('Evolutionary process');
xlabel('Number of iterations');
ylabel('Objective function');
%% ��ʾ�Ż����
disp(['���Ž⣺',num2str(pop.perfom(end))])
disp(['���Ų�����',num2str(pop.bestIndividual)])
toc