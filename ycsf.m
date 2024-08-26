tic
clear all
close all

pop.size = 500;%种群规模
pop.cr = 0.4;%交叉概率
pop.mr = 0.3;%变异概率
pop.ma = 1;

pop = initialization(pop);%初始化种群
for i = 1:100 %200
    fprintf('%d\n',i)  %提示进化代数
    pop=newPop(pop,i);
    %生成新一代种群
    %重新绘制等值线图

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
%% 画进化曲线
plot(1:i,pop.perfom,'r','LineWidth',1.2);
title('Evolutionary process');
xlabel('Number of iterations');
ylabel('Objective function');
%% 显示优化结果
disp(['最优解：',num2str(pop.perfom(end))])
disp(['最优参数：',num2str(pop.bestIndividual)])
toc