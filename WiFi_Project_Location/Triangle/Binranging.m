function [result] = Binranging(arrPoint, arrDistance)
% Binranging.m      说明：两边定位获取待选坐标
% arrPoint(1,:)     参数：点A坐标，数组存储，格式如：[x,y]
% arrPoint(2,:)     参数：点B坐标，数组存储，格式如：[x,y]
% arrPoint(3,:)     参数：点C坐标，数组存储，格式如：[x,y]
% arrDistance(1)    参数：待定位点距点A距离，双浮点存储，格式如：0.50000
% arrDistance(2)	参数：待定位点距点B距离，双浮点存储，格式如：0.50000
% result            返回：返回最佳交点，数组存储，格式如：[x,y]
% error             错误：error 0 参数个数错误

% 袁鑫-2015302580136-国际软件学院 修改于 2017年4月6日18:48:45 编写和修改记录，用于软件档案管理。
    % 检验函数输入参数个数
    if nargin ~= 2
        error('ERROR Binranging 0 参数个数错误');
    end
    % 检验函数输入参数格式
    CheckArray(arrPoint, 3, 2);
    CheckArray(arrDistance, 2, 1);
    syms pointX pointY;
    % 以A、B节点为圆心，arrDistance(1)、arrDistance(2)为半径作圆方程
    expressionA = power(pointX - arrPoint(1, 1), 2) + power(pointY - arrPoint(1, 2), 2) - arrDistance(1);
    expressionB = power(pointX - arrPoint(2, 1), 2) + power(pointY - arrPoint(2, 2), 2) - arrDistance(2);
    % 求得两圆交点坐标
	resultAB = solve(expressionA, expressionB, pointX, pointY);
    arrayX = double(resultAB.pointX);
    arrayY = double(resultAB.pointY);
    % 判断两圆交点个数
    if numel(arrayX) == 1 && numel(arrayY) == 1
        result = [arrayX, arrayY];
    else
        % 选取距C节点距离最近交点为待选目标节点
        checkDistanceC1 = power(arrPoint(3, 1) - arrayX(1), 2) + power(arrPoint(3, 2) - arrayY(1), 2);
        checkDistanceC2 = power(arrPoint(3, 1) - arrayX(2), 2) + power(arrPoint(3, 2) - arrayY(2), 2);
        if checkDistanceC1 <= checkDistanceC2
            result = [arrayX(1), arrayY(1)];
        else
            result = [arrayX(2), arrayY(2)];
        end
    end
end