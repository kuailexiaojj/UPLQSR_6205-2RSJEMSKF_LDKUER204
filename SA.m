function power_ratio =SA(x,fs)
    % 计算输入信号的功率谱密度
    [Pxx_input, f] = periodogram(x, [], [], fs);
    
    % 计算输出信号的功率谱密度
    [Pxx_output, ~] = periodogram(x2, [], [], fs);

    % 在1Hz处的索引
    index_1hz = f == 0.01;

    % 计算1Hz处的功率谱密度比值
    power_ratio =Pxx_output(index_1hz)./Pxx_input(index_1hz);
end
