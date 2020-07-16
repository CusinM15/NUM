function [Q, R, z] = givens(A, b)
    %izraèuna A = QR in z = Q'b
    [m, n] = size(A);
    Q = eye(m);
    R = A;
    z = b;
    for j = 1: n
        for k = j + 1: m
            r = (R(j, j)^ 2 + R(k, j) ^ 2) ^ 0.5;
            c = R(j, j) / r;
            s = R(k, j) / r;
            R([j, k], j: n) = [c s; -s c] * R([j, k], j: n);
            z([j, k]) = [c s; -s c] * z([j, k]);
            Q([j, k], :) = [c s; -s c] * Q([j, k], :);
        end
    end
    Q = Q';
            
            