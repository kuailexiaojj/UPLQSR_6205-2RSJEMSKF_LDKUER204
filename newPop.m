function pop = newPop(pop,i)

%ѡ�����Ӳ�������Ⱥ
pop = selection(pop);

%ִ�н���ͱ�������
pop = crossover(pop);
pop = mutation(pop);

%��Ӧ�����ۣ�����Ŀ�꺯��ֵ��
pop.solution = pop.individual;
pop.obj = fun(pop.solution);

%������Ӵ���ĳһ�������滻Ϊ���Ž�  �������ŽⱣ������
t = ceil(rand*pop.size);
pop.individual(t,:) = pop.bestIndividual(end,:);
pop.solution(t,:) = pop.bestSolution(end,:);
pop.obj(1,t) = pop.perfom(end);

%------------------------------------------------------------
[s,n]=max(pop.obj);%��ǰ��Ⱥ���Ž��±�
% m=size(pop.bestSolution,1);
% e=m+1;

%��¼���Ŷ����Ƹ����ʵ���⣬�Լ���Ѽ�ƽ��Ŀ�꺯��ֵ
pop.bestIndividual = pop.individual(n,:);
pop.bestSolution = pop.solution(n,:);
pop.perfom(i) = s;
end