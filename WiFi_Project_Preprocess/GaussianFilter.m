function [ result ] = GaussianFilter(arrRSSI, probability)
% GaussianFilter.m  说明：高斯滤波处理RSSI数组
% arrRSSI           参数：待处理RSSI值数组，数组储存，格式如：[RSSI1, RSSI2, ..., RSSIn],单位：dbm
% probability       参数：RSSI值校正阈值，双精度存储，格式如：8.0000，单位：dbm，默认值：0.6000
% result            返回：返回高斯滤波处理结果，数组存储，格式如：[RSSI1, RSSI2, ..., RSSIn],单位：dbm
% error             错误：ERROR 0 参数个数错误
% error             错误：ERROR 1 概率（probability）取值范围应在0~1之间

% 袁鑫-2015302580136-国际软件学院 修改于 2017年4月6日14:20:56 编写和修改记录，用于软件档案管理。
    tic;
	% 检验函数输入参数个数
    if nargin == 1
        CheckArray(arrRSSI, 1, 0);
        probability = 0.6;
    elseif nargin == 2
        CheckArray(arrRSSI, 1, 0);
        if ~(probability > 0 && probability < 1)
            error('ERROR GaussianFilter 1 概率（probability）取值范围应在0~1之间');
        end
    else
        error('ERROR GaussianFilter 0 参数个数错误');
    end 
    subplot(1, 2, 1), bar(1:numel(arrRSSI), arrRSSI);hold on;
    % 计算RSSI数组期望、标准差
    rssiMea = mean(arrRSSI);
    rssiStd = std(arrRSSI);
	length = numel(arrRSSI);
    % 选取概率大于probability的值
    result = zeros(1, length);
    n = 1;
    value = norminv(probability, rssiMea, rssiStd);
    for i = 1:length
        if arrRSSI(i) > value * rssiStd + rssiMea
            result(n) = arrRSSI(i);
            n = n + 1;
        end
    end
    result(result == 0) = [];
	subplot(1, 2, 2), bar(1:numel(result), result);hold on;
    toc;
end