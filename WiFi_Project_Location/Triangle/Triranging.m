function [result] = Triranging(arrPoint, arrDistance)
% Triranging.m      说明：三边加权测量定位
% arrPoint(1,:)     参数：点A坐标，数组存储，格式如：[x,y]
% arrPoint(2,:)     参数：点B坐标，数组存储，格式如：[x,y]
% arrPoint(3,:)     参数：点C坐标，数组存储，格式如：[x,y]
% arrDistance(1)	参数：待定位点距点A距离，双浮点存储，格式如：0.5000
% arrDistance(2)	参数：待定位点距点B距离，双浮点存储，格式如：0.5000
% arrDistance(3)	参数：待定位点距点C距离，双浮点存储，格式如：0.5000
% result            返回：返回三边定位结果，数组存储，格式如：[x,y]
% error             错误：ERROR 0 参数个数错误

% 袁鑫-2015302580136-国际软件学院 修改于 2017年4月6日16:20:56 编写和修改记录，用于软件档案管理。
    tic;
	% 检验函数输入参数个数
    if nargin ~= 2
        error('ERROR Triranging 0 参数个数错误');
    end
    % 检验函数输入参数格式
    CheckArray(arrPoint, 3, 2);
    CheckArray(arrDistance, 3, 1);
    
    for i =1:3
        [x,b]=scircle1(arrPoint(i,1),arrPoint(i,2),0.1);
        plot(x,b); hold on;
    end
    
    % 获取AB、BC、CA两圆相交交点，作为待选目标节点
    resultC = Binranging([arrPoint(1,:); arrPoint(2,:); arrPoint(3,:)], [arrDistance(1); arrDistance(2)]);
    resultA = Binranging([arrPoint(2,:); arrPoint(3,:); arrPoint(1,:)], [arrDistance(2); arrDistance(3)]);
    resultB = Binranging([arrPoint(3,:); arrPoint(1,:); arrPoint(2,:)], [arrDistance(3); arrDistance(1)]);
    % 以1 / arrDistance(1), 1 / arrDistance(2), 1 / arrDistance(3)为加权因子，对待选目标节点加权定位
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