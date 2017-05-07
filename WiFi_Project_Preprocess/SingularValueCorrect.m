function [ result ] = SingularValueCorrect(arrRSSI, thresholdRSSI)
% SingularValueCorrect.m    ˵������RSSI��������ֵУ��
% arrRSSI                   ������������RSSIֵ���飬���鴢�棬��ʽ�磺[RSSI1, RSSI2, ..., RSSIn],��λ��dbm
% thresholdRSSI             ������RSSIֵУ����ֵ��˫���ȴ洢����ʽ�磺8.0000����λ��dbm��Ĭ��ֵ��8.0000
% result                    ���أ���������ֵУ�����������洢����ʽ�磺[RSSI1, RSSI2, ..., RSSIn],��λ��dbm
% error                     ����ERROR 0 ������������

% Ԭ��-2015302580136-�������ѧԺ �޸��� 2017��4��8��15:36:16 ��д���޸ļ�¼�����������������
    tic;
	% ���麯�������������
    if nargin == 1
        CheckArray(arrRSSI, 1, 0);
        thresholdRSSI = 8.0000;
    elseif nargin == 2
        CheckArray(arrRSSI, 1, 0);
        if ~(thresholdRSSI > 0 && thresholdRSSI < 1)
            error('ERROR GaussianFilter 1 ���ʣ�probability��ȡֵ��ΧӦ��0~1֮��');
        end
    else
        error('ERROR GaussianFilter 0 ������������');
	end
    subplot(1, 3, 1), bar(1:numel(arrRSSI), arrRSSI);hold on;
    % ��RSSI�����һ��Ԫ�������һ��Ԫ�ؽ�������ֵУ��
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
    
    % ��RSSI������������ֵ����У��
    for i = 2:length - 1
        if abs(arrRSSI(i - 1) - arrRSSI(i)) > abs(arrRSSI(i + 1) - arrRSSI(i))
            arrRSSI(i) = arrRSSI(i - 1);
        end
    end
    
    % ��RSSI���������ĸ�ֵ����У��
    for i = 2:length - 2
        if  abs(arrRSSI(i - 1) - arrRSSI(i))     > abs(arrRSSI(i - 1) - arrRSSI(i + 2)) && ...
            abs(arrRSSI(i - 1) - arrRSSI(i + 1)) > abs(arrRSSI(i - 1) - arrRSSI(i + 2))
            arrRSSI(i)     = arrRSSI(i - 1);
            arrRSSI(i + 1) = arrRSSI(i + 2);
        end
    end
    
    % ��RSSI����ͻ��ֵ����У��
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