function [result] = Binranging(arrPoint, arrDistance)
% Binranging.m      ˵�������߶�λ��ȡ��ѡ����
% arrPoint(1,:)     ��������A���꣬����洢����ʽ�磺[x,y]
% arrPoint(2,:)     ��������B���꣬����洢����ʽ�磺[x,y]
% arrPoint(3,:)     ��������C���꣬����洢����ʽ�磺[x,y]
% arrDistance(1)    ����������λ����A���룬˫����洢����ʽ�磺0.50000
% arrDistance(2)	����������λ����B���룬˫����洢����ʽ�磺0.50000
% result            ���أ�������ѽ��㣬����洢����ʽ�磺[x,y]
% error             ����error 0 ������������

% Ԭ��-2015302580136-�������ѧԺ �޸��� 2017��4��6��18:48:45 ��д���޸ļ�¼�����������������
    % ���麯�������������
    if nargin ~= 2
        error('ERROR Binranging 0 ������������');
    end
    % ���麯�����������ʽ
    CheckArray(arrPoint, 3, 2);
    CheckArray(arrDistance, 2, 1);
    syms pointX pointY;
    % ��A��B�ڵ�ΪԲ�ģ�arrDistance(1)��arrDistance(2)Ϊ�뾶��Բ����
    expressionA = power(pointX - arrPoint(1, 1), 2) + power(pointY - arrPoint(1, 2), 2) - arrDistance(1);
    expressionB = power(pointX - arrPoint(2, 1), 2) + power(pointY - arrPoint(2, 2), 2) - arrDistance(2);
    % �����Բ��������
	resultAB = solve(expressionA, expressionB, pointX, pointY);
    arrayX = double(resultAB.pointX);
    arrayY = double(resultAB.pointY);
    % �ж���Բ�������
    if numel(arrayX) == 1 && numel(arrayY) == 1
        result = [arrayX, arrayY];
    else
        % ѡȡ��C�ڵ�����������Ϊ��ѡĿ��ڵ�
        checkDistanceC1 = power(arrPoint(3, 1) - arrayX(1), 2) + power(arrPoint(3, 2) - arrayY(1), 2);
        checkDistanceC2 = power(arrPoint(3, 1) - arrayX(2), 2) + power(arrPoint(3, 2) - arrayY(2), 2);
        if checkDistanceC1 <= checkDistanceC2
            result = [arrayX(1), arrayY(1)];
        else
            result = [arrayX(2), arrayY(2)];
        end
    end
end