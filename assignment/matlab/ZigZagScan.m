function Vect = ZigZagScan(X)
[~, N] = size(X);
Vect = zeros(1, N * N);
Vect(1) = X(1,1);
v = 1;
for k = 1 : 2 * N - 1
    if k <= N
        if mod(k, 2) == 0
            j = k;
            for i = 1 : k
                Vect(v) = X(i, j);
                v = v + 1;
                j = j - 1;    
            end
        else
            i = k;
            for j = 1 : k   
                Vect(v) = X(i, j);
                v = v + 1;
                i = i - 1; 
            end
        end
    else
        if mod(k, 2) == 0
            p = mod(k, N);
            j = N;
            for i = p + 1 : N
                Vect(v) = X(i, j);
                v = v + 1;
                j = j - 1;    
            end
        else
            p = mod(k, N);
            i = N;
            for j = p + 1 : N   
                Vect(v) = X(i, j);
                v = v + 1;
                i = i - 1; 
            end
        end
    end
end
 
        
        
