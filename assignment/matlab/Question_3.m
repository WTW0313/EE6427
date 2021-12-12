clc;
clear;

rows = 4;
cols = 4;
M = zeros(rows, cols);
str = 'WUTIANWEIVIDEOSIGNALP';
for i = 1 : rows
    for j = 1 : cols
        if i <= 1
            M(i, j) = double(str(j)) - double('A') + 1;
        else
            M(i, j) = double(str((i - 1)* cols + j)) - double('A') + 1;
        end
    end
end

% level-1 wavelet transform on rows
M1 = zeros(rows, cols);
for i = 1 : rows
    for j = 1 : cols / 2
       M1(i, j) = (M(i, j) + M(i, j + cols / 2)) / 2;
    end
    for j = cols / 2 + 1 : cols
        M1(i, j) = (M(i, j - cols / 2) - M(i, j)) / 2;
    end
end

% level-1 wavelet transform on cols
M2 = zeros(rows, cols);
for j = 1 : cols
    for i = 1 : rows / 2
       M2(i, j) = (M1(i, j) + M1(i + rows / 2, j)) / 2;
    end
    for i = rows / 2 + 1 : rows
        M2(i, j) = (M1(i - rows / 2, j) - M1(i, j)) / 2;
    end
end

% level-1 wavelet transform on rows
M3 = M2;
for i = 1 : rows / 2
    for j = 1 : cols / 2^2
       M3(i, j) = (M2(i, j) + M2(i, j + cols / 2^2)) / 2;
    end
    for j = cols / 2^2 + 1 : cols / 2
        M3(i, j) = (M2(i, j - cols / 2^2) - M2(i, j)) / 2;
    end
end

% level-1 wavelet transform on cols
M4 = M3;
for j = 1 : cols / 2
    for i = 1 : rows / 2^2
       M4(i, j) = (M3(i, j) + M3(i + rows / 2^2, j)) / 2;
    end
    for i = rows / 2^2 + 1 : rows / 2
        M4(i, j) = (M3(i - rows / 2^2, j) - M3(i, j)) / 2;
    end
end
