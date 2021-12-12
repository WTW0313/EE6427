clc;
clear;

W.low = 0.00;
W.high = 0.25;
U.low = 0.25;
U.high = 0.375;
T.low = 0.375;
T.high = 0.5;
I.low = 0.5;
I.high = 0.625;
A.low = 0.625;
A.high = 0.75;
N.low = 0.75;
N.high = 0.875;
E.low = 0.875;
E.high = 1;

code = zeros(9,2);
code(1, :) = [0.0 1.0];

% W
a = W.low;
b = W.high;
code(2, :) = [a b];

% WU
d = b - a;
a0 = a;
a = a0 + d * U.low;
b = a0 + d * U.high;
code(3, :) = [a b];

% WUT
d = b - a;
a0 = a;
a = a0 + d * T.low;
b = a0 + d * T.high;
code(4, :) = [a b];

% WUTI
d = b - a;
a0 = a;
a = a0 + d * I.low;
b = a0 + d * I.high;
code(5, :) = [a b];

% WUTIA
d = b - a;
a0 = a;
a = a0 + d * A.low;
b = a0 + d * A.high;
code(6, :) = [a b];

% WUTIAN
d = b - a;
a0 = a;
a = a0 + d * N.low;
b = a0 + d * N.high;
code(7, :) = [a b];

% WUTIANW
d = b - a;
a0 = a;
a = a0 + d * W.low;
b = a0 + d * W.high;
code(8, :) = [a b];

% WUTIANWE
d = b - a;
a0 = a;
a = a0 + d * E.low;
b = a0 + d * E.high;
code(9, :) = [a b];
