function [ result ] = GaussianFilter(arrRSSI, probability)
% GaussianFilter.m  ˵������˹�˲�����RSSI����
% arrRSSI           ������������RSSIֵ���飬���鴢�棬��ʽ�磺[RSSI1, RSSI2, ..., RSSIn],��λ��dbm
% probability       ������RSSIֵУ����ֵ��˫���ȴ洢����ʽ�磺8.0000����λ��dbm��Ĭ��ֵ��0.6000
% result            ���أ����ظ�˹�˲�������������洢����ʽ�磺[RSSI1, RSSI2, ..., RSSIn],��λ��dbm
% error             ����ERROR 0 ������������
% error             ����ERROR 1 ���ʣ�probability��ȡֵ��ΧӦ��0~1֮��

% Ԭ��-2015302580136-�������ѧԺ �޸��� 2017��4��6��14:20:56 ��д���޸ļ�¼�����������������
    tic;
	% ���麯�������������
    if nargin == 1
        CheckArray(arrRSSI, 1, 0);
        probability = 0.6;
    elseif nargin == 2
        CheckArray(arrRSSI, 1, 0);
        if ~(probability > 0 && probability < 1)
            error('ERROR GaussianFilter 1 ���ʣ�probability��ȡֵ��ΧӦ��0~1֮��');
        end
    else
        error('ERROR GaussianFilter 0 ������������');
    end 
    subplot(1, 2, 1), bar(1:numel(arrRSSI), arrRSSI);hold on;
    % ����RSSI������������׼��
    rssiMea = mean(arrRSSI);
    rssiStd = std(arrRSSI);
	length = numel(arrRSSI);
    % ѡȡ���ʴ���probability��ֵ
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