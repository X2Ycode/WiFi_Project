function [ result ] = Logarithmic(rssi, p, e)
% GetParameter.m    ˵������ȡ�������ģ�;�����
% rssi              ����������Ԥ�����õ�RSSI��ֵ
% p                 �������������ģ�Ͳ���
% e                 �������������ģ�Ͳ���
% result            ���أ����ؾ������ģ�;�������˫���ȴ洢����λ��m
% error             ����ERROR 0 ������������

% Ԭ��-2015302580136-�������ѧԺ �޸��� 2017��4��8��10:21:10 ��д���޸ļ�¼�����������������
	if nargin ~= 3
        error('ERROR GetParameter 0 ������������');
    end
    result = 10 ^ ((rssi - p ) / (10 * e));
end