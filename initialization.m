function pop = initialization(pop)
%��Ⱥ��ʼ��

pop.individual = rand(pop.size,6);%3,4,5
pop.individual(:,1) = pop.individual(:,1)*1+0.01;%CTSR:[0.01,5.01],[0.01,2.01]
pop.individual(:,2) = pop.individual(:,2)*2+0.01;%CTSR:[0.01,5.01],[0.1,2.1]
pop.individual(:,3) = pop.individual(:,3)*1+0.01;%CTSR:[0.01,5.01],[0.01,1.01]
pop.individual(:,4) = pop.individual(:,4)*2+0.01;%lambda:[0.01,2.01]
 pop.individual(:,5) = pop.individual(:,5)*0.5+0.01;
 pop.individual(:,6) = pop.individual(:,6)*0.5+0.01;
pop.solution = pop.individual;%��Ⱥ�ĸ��弴Ϊ��
pop.obj = fun(pop.solution);%����Ŀ�꺯��ֵ

%------------------------------------------------------------

n = find(pop.obj == max(pop.obj),1);%��ǰ��Ⱥ���Ž��±�

%��¼���Ŷ����Ƹ����ʵ���⣬�Լ���Ѽ�ƽ��Ŀ�꺯��ֵ
pop.bestIndividual = pop.individual(n,:);
pop.bestSolution = pop.solution(n,:);
pop.perfom(1) = max(pop.obj);
end
