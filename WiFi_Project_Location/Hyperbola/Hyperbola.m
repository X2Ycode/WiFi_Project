function [ result ] = Hyperbola(arrPoint, arrDistance)
% Hyperbola.m       说明：双曲线定位
% arrPoint(1,:)     参数：点A坐标，数组存储，格式如：[x,y]
% arrPoint(2,:)     参数：点B坐标，数组存储，格式如：[x,y]
% arrPoint(3,:)     参数：点C坐标，数组存储，格式如：[x,y]
% arrDistance(1)	参数：待定位点距点A距离，双浮点存储，格式如：0.5000
% arrDistance(2)	参数：待定位点距点B距离，双浮点存储，格式如：0.5000
% arrDistance(3)	参数：待定位点距点C距离，双浮点存储，格式如：0.5000
% result            返回：返回双曲线定位结果，数组存储，格式如：[x,y]
% error             错误：ERROR 0 参数个数错误

% 袁鑫-2015302580136-国际软件学院 修改于 2017年4月8日10:21:10 编写和修改记录，用于软件档案管理。
    tic;
	% 检验函数输入参数个数
    if nargin ~= 2
        error('ERROR Hyperbola 0 参数个数错误');
    end
    % 检验函数输入参数格式
    CheckArray(arrPoint, 3, 2);
    CheckArray(arrDistance, 3, 1);
    
    for i =1:3
        [x,b]=scircle1(arrPoint(i,1),arrPoint(i,2),0.1);
        plot(x,b); hold on;
    end
    
    syms pointX pointY;
    % 计算双曲线差值
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