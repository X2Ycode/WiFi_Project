function [ result ] = CheckArray(array, row, col)
% CheckArray.m      ˵�����������������
% array             ��������������飬����洢
% row               ���������������˫���ȴ洢��˫����洢����ʽ�磺0.5000�����������Ϊ0ʱ�������
% col               ���������������˫���ȴ洢��˫����洢����ʽ�磺0.5000�����������Ϊ0ʱ�������
% result            ���أ��������������������ƥ�䣬�����������������񣬱���error
% error             ����ERROR 0 ������������
% error             ����ERROR 1 ��������Ϊ����
% error             ����ERROR 2 �����������������

% Ԭ��-2015302580136-�������ѧԺ �޸��� 2017��4��8��09:23:54 ��д���޸ļ�¼�����������������
    % ��������������
    if nargin ~= 3
        error('ERROR CheckArray 0 ������������')
    end
    % �������Ƿ�Ϊ����
    if ~ismatrix(array)
        error('ERROR CheckArray 1 ��������Ϊ����');
    end
    % ��������������Ƿ�ƥ��
    [m, n] = size(array);
    checkRow = (m == row);
    checkCol = (n == col);
    % �����������
    if row ~= 0
        if ~ checkRow
            error('ERROR CheckArray 2 ���������������');
        end
    end
    % �����������
	if col ~= 0
        if ~ checkCol
            error('ERROR CheckArray 2 ���������������');
        end
    end
    result = m;
end