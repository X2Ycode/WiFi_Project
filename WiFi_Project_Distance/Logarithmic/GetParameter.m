function [ result ] = GetParameter(arrRSSI, arrDistance)
% GetParameter.m    说明：获取经典对数模型参数
% arrRSSI           参数：待处理RSSI值数组，数组储存，格式如：[RSSI1, RSSI2, ..., RSSIn],单位：dbm
% arrDistance       参数：已知节点间距离，数组存储，格式如：[D1, D2, ..., Dn],单位：m
% result            返回：返回经典对数模型参数，数组存储，格式如：[p,e]
% error             错误：ERROR 0 参数个数错误
% error             错误：ERROR 1 RSSI数组与Distance数组元素个数不匹配

% 袁鑫-2015302580136-国际软件学院 修改于 2017年4月8日10:21:10 编写和修改记录，用于软件档案管理。
	% 检验函数输入参数个数
    if nargin ~= 2
        error('ERROR GetParameter 0 参数个数错误');
    end
	% 检验函数输入参数格式
    CheckArray(arrRSSI, 1, 0);
    CheckArray(arrDistance, 1, 0);
    if numel(arrRSSI) ~= numel(arrDistance)
        error('ERROR GetParameter 1 RSSI数组与Distance数组元素不匹配');
    end
    % 获取经典对数模型参数
    result = polyfit(arrDistance, arrRSSI, 1);
end