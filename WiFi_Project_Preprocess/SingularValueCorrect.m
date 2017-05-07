function [ result ] = SingularValueCorrect(arrRSSI, thresholdRSSI)
% SingularValueCorrect.m    说明：对RSSI进行奇异值校正
% arrRSSI                   参数：待处理RSSI值数组，数组储存，格式如：[RSSI1, RSSI2, ..., RSSIn],单位：dbm
% thresholdRSSI             参数：RSSI值校正阈值，双精度存储，格式如：8.0000，单位：dbm，默认值：8.0000
% result                    返回：返回奇异值校正结果，数组存储，格式如：[RSSI1, RSSI2, ..., RSSIn],单位：dbm
% error                     错误：ERROR 0 参数个数错误

% 袁鑫-2015302580136-国际软件学院 修改于 2017年4月8日15:36:16 编写和修改记录，用于软件档案管理。
    tic;
	% 检验函数输入参数个数
    if nargin == 1
        CheckArray(arrRSSI, 1, 0);
        thresholdRSSI = 8.0000;
    elseif nargin == 2
        CheckArray(arrRSSI, 1, 0);
        if ~(thresholdRSSI > 0 && thresholdRSSI < 1)
            error('ERROR GaussianFilter 1 概率（probability）取值范围应在0~1之间');
        end
    else
        error('ERROR GaussianFilter 0 参数个数错误');
	end
    subplot(1, 3, 1), bar(1:numel(arrRSSI), arrRSSI);hold on;
    % 对RSSI数组第一个元素与最后一个元素进行奇异值校正
	rssiMea = mean(arrRSSI(:));
    rssiFir = arrRSSI(1);
    rssiEnd = arrRSSI(end);
	length = numel(arrRSSI);
    if abs(rssiFir - rssiMea) > thresholdRSSI
        arrRSSI(1) = arrRSSI(2);
    end
	if abs(rssiEnd - rssiMea) > thresholdRSSI
        arrRSSI(end) = arrRSSI(end - 1);
    end
    
    % 对RSSI数组连续三个值进行校正
    for i = 2:length - 1
        if abs(arrRSSI(i - 1) - arrRSSI(i)) > abs(arrRSSI(i + 1) - arrRSSI(i))
            arrRSSI(i) = arrRSSI(i - 1);
        end
    end
    
    % 对RSSI数组连续四个值进行校正
    for i = 2:length - 2
        if  abs(arrRSSI(i - 1) - arrRSSI(i))     > abs(arrRSSI(i - 1) - arrRSSI(i + 2)) && ...
            abs(arrRSSI(i - 1) - arrRSSI(i + 1)) > abs(arrRSSI(i - 1) - arrRSSI(i + 2))
            arrRSSI(i)     = arrRSSI(i - 1);
            arrRSSI(i + 1) = arrRSSI(i + 2);
        end
    end
    
    % 对RSSI数组突变值进行校正
    for i = 2:length - 2
        if (arrRSSI(i)     - arrRSSI(i - 1)) * (arrRSSI(i)     - arrRSSI(i + 1)) > 0 && ...
           (arrRSSI(i + 1) - arrRSSI(i - 1)) * (arrRSSI(i + 2) - arrRSSI(i - 1)) > 0 && ...
           abs(arrRSSI(i - 1) - arrRSSI(i + 1)) < abs(arrRSSI(i - 1) - arrRSSI(i + 2))
            arrRSSI(i) = arrRSSI(i - 1);
        end
    end
    subplot(1, 3, 2), bar(1:numel(arrRSSI), arrRSSI);hold on;
    result = arrRSSI;
    toc;
end