function [ result ] = CheckArray(array, row, col)
% CheckArray.m      说明：检测数组行列数
% array             参数：待检测数组，数组存储
% row               参数：检测行数，双精度存储，双浮点存储，格式如：0.5000，当输入参数为0时，不检测
% col               参数：检测列数，双精度存储，双浮点存储，格式如：0.5000，当输入参数为0时，不检测
% result            返回：检测结果，若数组行列数匹配，返回数组行数，若否，报错error
% error             错误：ERROR 0 参数个数错误
% error             错误：ERROR 1 检测参数不为数组
% error             错误：ERROR 2 检测数组行列数错误

% 袁鑫-2015302580136-国际软件学院 修改于 2017年4月8日09:23:54 编写和修改记录，用于软件档案管理。
    % 检测输入参数个数
    if nargin ~= 3
        error('ERROR CheckArray 0 参数个数错误')
    end
    % 检测参数是否为数组
    if ~ismatrix(array)
        error('ERROR CheckArray 1 检测参数不为数组');
    end
    % 检测数组行列数是否匹配
    [m, n] = size(array);
    checkRow = (m == row);
    checkCol = (n == col);
    % 检测数组行数
    if row ~= 0
        if ~ checkRow
            error('ERROR CheckArray 2 检测数组行数错误');
        end
    end
    % 检测数组列数
	if col ~= 0
        if ~ checkCol
            error('ERROR CheckArray 2 检测数组列数错误');
        end
    end
    result = m;
end