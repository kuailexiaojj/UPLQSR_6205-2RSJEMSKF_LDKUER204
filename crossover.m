function pop = crossover(pop)
%��������
for i = 1:pop.size/2%����ÿһ�Ը���
    if rand<pop.cr%���������ִ�н������
        %��ȡ���������
        a1 = pop.individual(2*(i-1)+1,:);
        a2 = pop.individual(2*i,:);

        aa = rand;

        pop.individual(2*(i-1)+1,:) = aa*a1+(1-aa)*a2;
        pop.individual(2*i,:) = aa*a2+(1-aa)*a1;

    end
end

end