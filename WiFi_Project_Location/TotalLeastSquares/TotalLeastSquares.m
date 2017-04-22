function [ result ] = TotalLeastSquares(arrPoint, arrDistance)
% TotalLeastSquares.m   ˵������С���˷���λ
% arrPoint(1,:)         ��������A���꣬����洢����ʽ�磺[x,y]
% arrPoint(2,:)         ��������B���꣬����洢����ʽ�磺[x,y]
% arrPoint(3,:)         ��������C���꣬����洢����ʽ�磺[x,y]
% arrDistance(1)        ����������λ����A���룬˫����洢����ʽ�磺0.5000
% arrDistance(2)        ����������λ����B���룬˫����洢����ʽ�磺0.5000
% arrDistance(3)        ����������λ����C���룬˫����洢����ʽ�磺0.5000
% result                ���أ�������С���˷���λ���������洢����ʽ�磺[x,y]
% error                 ����ERROR 0 ������������
% error                 ����ERROR 1 ���������������ƥ��

% Ԭ��-2015302580136-�������ѧԺ �޸��� 2017��4��8��10:34:51 ��д���޸ļ�¼�����������������
    tic;
    	% ���麯�������������
    if nargin ~= 2
        error('ERROR Binranging 0 ������������');
    end
    % ���麯�����������ʽ
    sizePoint = CheckArray(arrPoint, 0, 2);
    sizeDistance = CheckArray(arrDistance, 0 ,1);
    if ~(sizePoint == sizeDistance)
        error('ERROR Binranging 1 ���������������ƥ��')
    end
    
    matrixA = zeros(sizePoint - 1, 2);
    for i = 1 : sizePoint - 1
        matrixA(i, 1) = (arrPoint(i, 1) - arrPoint(sizePoint, 1)) * 2;
        matrixA(i, 2) = (arrPoint(i, 2) - arrPoint(sizePoint, 2)) * 2;
    end
    matrixB = zeros(sizePoint - 1, 1);
	for i = 1 : sizePoint - 1
        matrixB(i,1) = power(arrPoint(i, 1), 2)         + power(arrPoint(i, 2),2)           - ...
                       power(arrPoint(sizePoint, 1),2)  - power(arrPoint(sizePoint, 2),2)   + ...
                       power(arrDistance(sizePoint),2)	- power(arrDistance(i), 2);
    end
    
    % ��ȡmatrixA��matrixB�ϲ�����
    matrixP = [-1 * matrixB, matrixA];
    % ��ȡmatrixP�Ͼ���U��V������ֵ�ԽǾ���S
    [~,S,V] = svd(matrixP);
    % ��ȡmatrixP��
    rankP = rank(matrixP);
    
    Sr = 0;
    for j = 1:rankP
        for i = 1:(sizePoint - rankP)
            Sr = power(S(j, j), 2) * Windowing(V, rankP, j, i) * Windowing(V, rankP, j, i).';
        end
    end
    % ��������д���������: ����ӽ�����ֵ���������Ŵ��󡣽�����ܲ�׼ȷ��RCOND =  1.243691e-17����
    % ��������������Ǿ�������ֵ̫С�����Խ���ֵ�ȱ����Ŵ�һ�¡������������
    % �������������ӽ�������������������ܲ���������ʵֵ�ˣ����黻����ʼ����ֵ���� �������������
    % ���Ż���
    invSr = inv(Sr);
    
    result(1) = invSr(1 + 1, 1) ./ invSr(1, 1);
    result(2) = invSr(2 + 1, 1) ./ invSr(1, 1);
    toc;
end