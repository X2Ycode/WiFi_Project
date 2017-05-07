function [result] = Triranging(arrPoint, arrDistance)
% Triranging.m      ˵�������߼�Ȩ������λ
% arrPoint(1,:)     ��������A���꣬����洢����ʽ�磺[x,y]
% arrPoint(2,:)     ��������B���꣬����洢����ʽ�磺[x,y]
% arrPoint(3,:)     ��������C���꣬����洢����ʽ�磺[x,y]
% arrDistance(1)	����������λ����A���룬˫����洢����ʽ�磺0.5000
% arrDistance(2)	����������λ����B���룬˫����洢����ʽ�磺0.5000
% arrDistance(3)	����������λ����C���룬˫����洢����ʽ�磺0.5000
% result            ���أ��������߶�λ���������洢����ʽ�磺[x,y]
% error             ����ERROR 0 ������������

% Ԭ��-2015302580136-�������ѧԺ �޸��� 2017��4��6��16:20:56 ��д���޸ļ�¼�����������������
    tic;
	% ���麯�������������
    if nargin ~= 2
        error('ERROR Triranging 0 ������������');
    end
    % ���麯�����������ʽ
    CheckArray(arrPoint, 3, 2);
    CheckArray(arrDistance, 3, 1);
    
    for i =1:3
        [x,b]=scircle1(arrPoint(i,1),arrPoint(i,2),0.1);
        plot(x,b); hold on;
    end
    
    % ��ȡAB��BC��CA��Բ�ཻ���㣬��Ϊ��ѡĿ��ڵ�
    resultC = Binranging([arrPoint(1,:); arrPoint(2,:); arrPoint(3,:)], [arrDistance(1); arrDistance(2)]);
    resultA = Binranging([arrPoint(2,:); arrPoint(3,:); arrPoint(1,:)], [arrDistance(2); arrDistance(3)]);
    resultB = Binranging([arrPoint(3,:); arrPoint(1,:); arrPoint(2,:)], [arrDistance(3); arrDistance(1)]);
    % ��1 / arrDistance(1), 1 / arrDistance(2), 1 / arrDistance(3)Ϊ��Ȩ���ӣ��Դ�ѡĿ��ڵ��Ȩ��λ
    result(1) = (resultC(1) / arrDistance(3)  + ...
                 resultA(1) / arrDistance(1)  + ...
                 resultB(1) / arrDistance(2)) / ...
                (1 / arrDistance(3) + 1 / arrDistance(1) + 1 / arrDistance(2));
    result(2) = (resultC(2) / arrDistance(3)  + ...
                 resultA(2) / arrDistance(1)  + ...
                 resultB(2) / arrDistance(2)) / ...
                (1 / arrDistance(3) + 1 / arrDistance(1) + 1 / arrDistance(2));
	toc;
    
    [a,b]=scircle1(real(result(1)),real(result(2)),0.1);
    plot(a,b); hold on;
    
end