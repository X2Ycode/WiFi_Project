function [ result ] = GetParameter(arrRSSI, arrDistance)
% GetParameter.m    ˵������ȡ�������ģ�Ͳ���
% arrRSSI           ������������RSSIֵ���飬���鴢�棬��ʽ�磺[RSSI1, RSSI2, ..., RSSIn],��λ��dbm
% arrDistance       ��������֪�ڵ����룬����洢����ʽ�磺[D1, D2, ..., Dn],��λ��m
% result            ���أ����ؾ������ģ�Ͳ���������洢����ʽ�磺[p,e]
% error             ����ERROR 0 ������������
% error             ����ERROR 1 RSSI������Distance����Ԫ�ظ�����ƥ��

% Ԭ��-2015302580136-�������ѧԺ �޸��� 2017��4��8��10:21:10 ��д���޸ļ�¼�����������������
	% ���麯�������������
    if nargin ~= 2
        error('ERROR GetParameter 0 ������������');
    end
	% ���麯�����������ʽ
    CheckArray(arrRSSI, 1, 0);
    CheckArray(arrDistance, 1, 0);
    if numel(arrRSSI) ~= numel(arrDistance)
        error('ERROR GetParameter 1 RSSI������Distance����Ԫ�ز�ƥ��');
    end
    % ��ȡ�������ģ�Ͳ���
    result = polyfit(arrDistance, arrRSSI, 1);
end