function [ result ] = FinalValue(arrRSSI)
% FinalValue.m      ˵������ȡRSSI���ξ�ֵ
% arrRSSI           ������������RSSIֵ���飬���鴢�棬��ʽ�磺[RSSI1, RSSI2, ..., RSSIn],��λ��dbm
% result            ���أ����ظ�˹�˲�������������洢����ʽ�磺[RSSI1, RSSI2, ..., RSSIn],��λ��dbm
% error             ����ERROR 0 ������������

% Ԭ��-2015302580136-�������ѧԺ �޸��� 2017��4��6��14:20:56 ��д���޸ļ�¼�����������������
    if nargin ~= 1
        error('ERROR FinalValue 0 ������������');
    end
	CheckArray(arrRSSI, 1, 0);
    for i=1:numel(arrRSSI)
        arrRSSI(i)=arrRSSI(i)*(-1);
    end
    result = -1 * geomean(arrRSSI);
end