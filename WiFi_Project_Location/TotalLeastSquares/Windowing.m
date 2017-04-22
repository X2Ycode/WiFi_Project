function [ result ] = Windowing(V, r, j, k)
% Windowing.m       ˵������ȡ���󴰿ڶ�
% V                 ����������
% r                 ���������ڶγ���
% j                 ���������ڶ�������
% k                 ���������ڶ�������
% result            ���أ�����[V(k, j), V(k + 1, j), ..., V(k + r, j)]

% Ԭ��-2015302580136-�������ѧԺ �޸��� 2017��4��8��10:35:16 ��д���޸ļ�¼�����������������
    result = zeros(1, r);
    n = 1;
    for i = k : k + r
        result(n) = V(i, j);
        n = n + 1;
    end
    result = result.';
end