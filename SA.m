function power_ratio =SA(x,fs)
    % ���������źŵĹ������ܶ�
    [Pxx_input, f] = periodogram(x, [], [], fs);
    
    % ��������źŵĹ������ܶ�
    [Pxx_output, ~] = periodogram(x2, [], [], fs);

    % ��1Hz��������
    index_1hz = f == 0.01;

    % ����1Hz���Ĺ������ܶȱ�ֵ
    power_ratio =Pxx_output(index_1hz)./Pxx_input(index_1hz);
end
