function [ result ] = TotalLeastSquares(arrPoint, arrDistance)
% TotalLeastSquares.m   说明：最小二乘法定位
% arrPoint(1,:)         参数：点A坐标，数组存储，格式如：[x,y]
% arrPoint(2,:)         参数：点B坐标，数组存储，格式如：[x,y]
% arrPoint(3,:)         参数：点C坐标，数组存储，格式如：[x,y]
% arrDistance(1)        参数：待定位点距点A距离，双浮点存储，格式如：0.5000
% arrDistance(2)        参数：待定位点距点B距离，双浮点存储，格式如：0.5000
% arrDistance(3)        参数：待定位点距点C距离，双浮点存储，格式如：0.5000
% result                返回：返回最小二乘法定位结果，数组存储，格式如：[x,y]
% error                 错误：ERROR 0 参数个数错误
% error                 错误：ERROR 1 点个数与距离个数不匹配

% 袁鑫-2015302580136-国际软件学院 修改于 2017年4月8日10:34:51 编写和修改记录，用于软件档案管理。
    tic;
    	% 检验函数输入参数个数
    if nargin ~= 2
        error('ERROR Binranging 0 参数个数错误');
    end
    % 检验函数输入参数格式
    sizePoint = CheckArray(arrPoint, 0, 2);
    sizeDistance = CheckArray(arrDistance, 0 ,1);
    if ~(sizePoint == sizeDistance)
        error('ERROR Binranging 1 点个数与距离个数不匹配')
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
    
    % 获取matrixA、matrixB合并矩阵
    matrixP = [-1 * matrixB, matrixA];
    % 获取matrixP酉矩阵U、V与奇异值对角矩阵S
    [~,S,V] = svd(matrixP);
    % 获取matrixP秩
    rankP = rank(matrixP);
    
    Sr = 0;
    for j = 1:rankP
        for i = 1:(sizePoint - rankP)
            Sr = power(S(j, j), 2) * Windowing(V, rankP, j, i) * Windowing(V, rankP, j, i).';
        end
    end
    % 求逆过程中触发“警告: 矩阵接近奇异值，或者缩放错误。结果可能不准确。RCOND =  1.243691e-17。”
    % 可能情况：可能是矩阵中数值太小，可以将数值等比例放大一下。（网上意见）
    % 可能情况：矩阵接近奇异啦，迭代结果可能不收敛到真实值了，建议换个初始迭代值试试 。（网上意见）
    % 待优化。
    invSr = inv(Sr);
    
    result(1) = invSr(1 + 1, 1) ./ invSr(1, 1);
    result(2) = invSr(2 + 1, 1) ./ invSr(1, 1);
    toc;
end