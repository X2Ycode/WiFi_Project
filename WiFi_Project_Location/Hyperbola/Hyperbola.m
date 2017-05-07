function [ result ] = Hyperbola(arrPoint, arrDistance)
% Hyperbola.m       ˵����˫���߶�λ
% arrPoint(1,:)     ��������A���꣬����洢����ʽ�磺[x,y]
% arrPoint(2,:)     ��������B���꣬����洢����ʽ�磺[x,y]
% arrPoint(3,:)     ��������C���꣬����洢����ʽ�磺[x,y]
% arrDistance(1)	����������λ����A���룬˫����洢����ʽ�磺0.5000
% arrDistance(2)	����������λ����B���룬˫����洢����ʽ�磺0.5000
% arrDistance(3)	����������λ����C���룬˫����洢����ʽ�磺0.5000
% result            ���أ�����˫���߶�λ���������洢����ʽ�磺[x,y]
% error             ����ERROR 0 ������������

% Ԭ��-2015302580136-�������ѧԺ �޸��� 2017��4��8��10:21:10 ��д���޸ļ�¼�����������������
    tic;
	% ���麯�������������
    if nargin ~= 2
        error('ERROR Hyperbola 0 ������������');
    end
    % ���麯�����������ʽ
    CheckArray(arrPoint, 3, 2);
    CheckArray(arrDistance, 3, 1);
    
    for i =1:3
        [x,b]=scircle1(arrPoint(i,1),arrPoint(i,2),0.1);
        plot(x,b); hold on;
    end
    
    syms pointX pointY;
    % ����˫���߲�ֵ
    expressionB = power(arrPoint(2, 1), 2) + power(arrPoint(2, 2), 2) - ...
                  power(arrDistance(2) - arrDistance(1), 2) - ...
                  2 * (arrDistance(2) - arrDistance(1)) * arrDistance(2) - ...
                  2 * (arrPoint(2, 1) - arrPoint(1, 1)) * pointX - ...
                  2 * (arrPoint(2, 2) - arrPoint(1, 2)) * pointY;
    expressionC = power(arrPoint(3, 1), 2) + power(arrPoint(3, 2), 2) - ...
                  power(arrDistance(3) - arrDistance(1), 2) - ...
                  2 * (arrDistance(3) - arrDistance(1)) * arrDistance(3) - ...
                  2 * (arrPoint(3, 1) - arrPoint(1, 1)) * pointX - ...
                  2 * (arrPoint(3, 2) - arrPoint(1, 2)) * pointY;
	resultTemp = solve(expressionB, expressionC, pointX, pointY);
    result = [double(resultTemp.pointX(1)), double(resultTemp.pointY(1))];
    toc;
    
	[a,b]=scircle1(real(result(1)),real(result(2)),0.1);
    plot(a,b); hold on;
end