function [ result ] = Logarithmic(rssi, p, e)
% GetParameter.m    说明：获取经典对数模型距离结果
% rssi              参数：经过预处理获得的RSSI终值
% p                 参数：经典对数模型参数
% e                 参数：经典对数模型参数
% result            返回：返回经典对数模型距离结果，双精度存储，单位：m
% error             错误：ERROR 0 参数个数错误

% 袁鑫-2015302580136-国际软件学院 修改于 2017年4月8日10:21:10 编写和修改记录，用于软件档案管理。
	if nargin ~= 3
        error('ERROR GetParameter 0 参数个数错误');
    end
    result = 10 ^ ((rssi - p ) / (10 * e));
end