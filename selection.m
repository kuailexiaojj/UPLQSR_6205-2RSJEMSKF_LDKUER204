function pop = selection(pop)
%ѡ����
p = pop.obj/sum(pop.obj);%�����������
pp = cumsum(p);%�����ۼƸ���
for i = 1:pop.size
    r = rand;%����һ�������
    for j=1:length(pp)              %�����ۼӸ������飬�ж��Ǹ�Ԫ�ش��������r����ѡȡ�Ǹ�Ԫ�ؽ�������Ⱥ
         if pp(j)>r                       
                pop.individual(i,:)=pop.individual(j,:);       
                % k(i) = find(pp>=r,1);%����������ĸ��ۻ��������䣬����Ӧ�ĸ��屻ѡ�У���¼�±�
         end
            % for j=1:length(pp)
        % if pp(j)>r
                %pop.individual(i,:)=pop.individual(j,:);

                         
end
%��ѡ�еĸ����������Ⱥ
%pop.individual = pop.individual(k,:);
%pop.solution = pop.solution(k,:);
%pop.obj = pop.obj(:,k');
end