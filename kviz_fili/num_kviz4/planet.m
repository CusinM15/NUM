x = [-0.5; -0.1; 0.5; 1; 1.5; 1.5; 1; 0.5; 0; -0.5; -1; -1]; 
y = [-1.4; -1.6; -1.9; -1.7; -1.3; 0.3; 0.7; 0.9; 1.1; 0.7; 0.3; -0.5];
A = zeros(5, 5);
for i = 1: 12
    A(i, 1) = x(i) ^ 2;
    A(i, 2) = x(i) * y(i);
    A(i, 3) = y(i) ^ 2;
    A(i, 4) = x(i);
    A(i, 5) = y(i);
end
% for i = 1: 12
%     A(1, i) = x(i) ^ 2;
%     A(2, i) = x(i) * y(i);
%     A(3, i) = y(i) ^ 2;
%     A(4, i) = x(i);
%     A(5, i) = y(i);
%     A
% end
% norm(A)
b = ones(12, 1) * -1;
[Q, R] = householder(A);
[m, n] = size(A);
k = norm(R(n: m, n));
ksi = k * (k + abs(R(n, n)));

[m, n] = size(R);
R = R(1: n, :);
z = Q' * b;

z = z(1: n);
% sedaj pa z obratno substitucijo
for i = n: -1: 1
    for k = i + 1: n
        z(i) = z(i) - R(i, k) * z(k);
    end
    z(i) = z(i) / R(i, i);
end

sum(z)
% toj pa neki èudn
% f = @(x, y) z(1) * x ^ 2 + z(2) * x * y + z(3) * y ^ 2 + z(4) * x + z(5) * y + 1;
% for i = 1: 12
%     q(i) = f(x(i), y(i))
% end
% q = q';
% contour([x, y, q], [0 0])