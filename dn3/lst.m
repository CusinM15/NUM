d = 118 / 101;
A = [5 d 4 3;
     d 3 7 1;
     4 7 1 0;
     3 1 0 2];
 x0 = [1 0 0 0]';
% [lambda, x, k] = potencna(A, x0, 10 ^ -16, 5); 
% lambda
[lambda1, x1, k1] = potencna(A, x0, 10 ^ -10, 10000); 
B = A - lambda1 .* x1 * x1';
[lambda2, x2, k2] = potencna(B, x0, 10 ^ -10, 10);
lambda2
    