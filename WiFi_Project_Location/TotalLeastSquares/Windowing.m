function [ result ] = Windowing(V, r, j, k)
% Windowing.m       说明：获取矩阵窗口段
% V                 参数：矩阵
% r                 参数：窗口段长度
% j                 参数：窗口段所在列
% k                 参数：窗口段所在行
% result            返回：返回[V(k, j), V(k + 1, j), ..., V(k + r, j)]

% 袁鑫-2015302580136-国际软件学院 修改于 2017年4月8日10:35:16 编写和修改记录，用于软件档案管理。
    result = zeros(1, r);
    n = 1;
    for i = k : k + r
        result(n) = V(i, j);
        n = n + 1;
    end
    result = result.';
end