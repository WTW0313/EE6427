clc;
clear;
raw = [
    10, 10, 10, 10, 10, 10, 10, 10;
    10, 10, 10, 10, 10, 10, 10, 10;
    20, 20, 20, 20, 20, 20, 20, 20;
    20, 20, 20, 20, 20, 20, 20, 20;
    40, 40, 40, 40, 40, 40, 40, 40;
    40, 40, 40, 40, 40, 40, 40, 40;
    10, 10, 10, 10, 10, 10, 10, 10;
    10, 10, 10, 10, 10, 10, 10, 10
];

A = [
    1, 1, 1, 1, 1, 1, 1, 1;
    1, -1, 1, -1, 1, -1, 1, -1;
    1, 1, -1, -1, 1, 1, -1, -1;
    1, -1, -1, 1, 1, -1, -1, 1;
    1, 1, 1, 1, -1, -1, -1, -1;
    1, -1, 1, -1, -1, 1, -1, 1;
    1, 1, -1, -1, -1, -1, 1, 1;
    1, -1, -1, 1, -1, 1, 1, -1
];
[rows, cols] = size(raw);
result = zeros(rows, cols);
for i = 1 : rows
    result(i, :) = (A * raw(i, :)')';
end
for j = 1 : cols
    result(:, j) = A * result(:, j);
end

disp(result);

Quantization = [
    16, 11, 10, 16, 24, 40, 51, 61;
    12, 12, 14, 19, 26, 58, 60, 55;
    14, 13, 16, 24, 40, 57, 69, 56;
    14, 17, 22, 29, 51, 87, 80, 62;
    18, 22, 37, 56, 68, 109, 103, 77;
    24, 35, 55, 64, 81, 104, 113, 92;
    49, 64, 78, 87, 103, 121, 120, 101;
    72, 92, 95, 98, 112, 100, 103, 99
];

result = round(result ./ Quantization);
disp(result);

ZigZagVect = ZigZagScan(result);
disp(ZigZagVect);
    