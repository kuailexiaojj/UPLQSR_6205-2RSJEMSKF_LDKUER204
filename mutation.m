function pop = mutation(pop)
%��������
for i = 1:pop.size%����ÿ������
    if rand<pop.mr%������ִ�б���
        n = ceil(rand*6);
        pop.individual(i,n) = pop.individual(i,n) + pop.ma*randn;% ����
%         if n == 1
%             pop.individual(i,n) = max(min(pop.individual(i,n),1.12),0.12);
%         elseif n==2
%             pop.individual(i,n) = max(min(pop.individual(i,n),0.11),0.01);
%             elseif n==3
%             pop.individual(i,n) = max(min(pop.individual(i,n),1.6),0.1);
%         else
%             pop.individual(i,n) = max(min(pop.individual(i,n),2.2),0.2);
%             
%         end
switch n
    case 1
        pop.individual(i,n) = max(min(pop.individual(i,n),1.01),0.01);
    case 2
        pop.individual(i,n) = max(min(pop.individual(i,n),2.01),0.01);
    case 3
        pop.individual(i,n) = max(min(pop.individual(i,n),1.01),0.01);
    case 4
        pop.individual(i,n) = max(min(pop.individual(i,n),2.01),0.01);
    case 5
        pop.individual(i,n) = max(min(pop.individual(i,n),0.51),0.01);
    case 6
        pop.individual(i,n) = max(min(pop.individual(i,n),0.51),0.01);
        
        
end
    end
end
end