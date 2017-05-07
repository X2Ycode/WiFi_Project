function [ result ] = FinalValue(arrRSSI)
% FinalValue.m      说明：获取RSSI几何均值
% arrRSSI           参数：待处理RSSI值数组，数组储存，格式如：[RSSI1, RSSI2, ..., RSSIn],单位：dbm
% result            返回：返回高斯滤波处理结果，数组存储，格式如：[RSSI1, RSSI2, ..., RSSIn],单位：dbm
% error             错误：ERROR 0 参数个数错误

% 袁鑫-2015302580136-国际软件学院 修改于 2017年4月6日14:20:56 编写和修改记录，用于软件档案管理。
    if nargin ~= 1
        error('ERROR FinalValue 0 参数个数错误');
    end
	CheckArray(arrRSSI, 1, 0);
    for i=1:numel(arrRSSI)
        arrRSSI(i)=arrRSSI(i)*(-1);
    end
    result = -1 * geomean(arrRSSI);
end