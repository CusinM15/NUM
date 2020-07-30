yP = [12.72;13.33;13.44;12.16;10.84;9.120;6.440;4.920;4.500;6.670;9.580;11.40;12.49;13.15;13.35;12.79;11.44;9.600;6.660;5.140;4.460;7.700;9.190;11.19;12.54;13.51;13.41;12.76;11.37;9.890;7.140;5.350;5.370;7.69;9.69;11.66;12.85;13.54;13.71;12.95;11.35;9.2;6.17;4.65;4.52;6.98;9.490;11.41;12.8;13.46;13.47;12.84;11.6;9.62;6.85;5.1;5.08;7.17;9.64;11.43;12.72;13.3;13.28;12.32;10.76;8.86;6.05;4.61;4.38;5.91;8.95;11.02;12.07;12.9;12.83;12.23;11.22;9.78;7.36;5.65;5.58;7.49;8.7;10.96;12.3;13.36;13.24;12.48;11.17;9.14;6.41;5.03;4.84;6.39;9;11.19;12.73;13.7;13.5;12.77;11.35;9.11;6.38;4.61;4.24;6.65;8.82;10.85;12.54;13.38;13.47;13.08;11.61;9.18;6.49;4.67;4.22;6.77;9.21;10.93;12.22;13.02;13.1;12.51;11.18;8.99;6.31;4.71;4.31;6.64;8.81;10.9;12.27;13.14;13.57;12.99;11.32;9.01;6.22;4.87;4.55;6.59;9.02;10.49;12.19;13.36;13.36;12.35;11.11;9.13;6.34;4.23;3.98;6.2;8.69;10.58;12.21;13.16;13.36;12.38;10.82;9.05;6.06;4.44;4.01;5.93;8.5;10.74;12.19;12.87;12.93;12.08;10.86;9.18;6.43;4.57;4.35;6.35;8.9;11.91;11.84;12.27;12.67;12.16;10.83;8.74;5.81;4.14;4.03;5.71;8.73;10.51;11.57;12.28;12.44;11.97;10.39;8.34;5.71;4.24;3.97;5.74;8.07;10.1;11.79;12.52;12.49;11.75;10.71;8.15;5.03;3.11;2.78;4.21;8;10.11;11.89;12.81;13.17;12.42;10.83;8.47;5.7;3.43;2.93;5.4;8.7;10.6;11.91;12.82;13.04;12.54;11.08;8.86;5.71;3.79;3.42;4.85;7.98;10.17;11.59;12.52;13.11;12.43;10.48;7.98;5.21;3.54;3.02;5.13;8.06;10.02;11.38;12.32;12.4]; 
yP = yP(1:200); 
xP = (1:200)'; 

f =@(c) c(1)+ c(2) .* sin(c(3) .* xP) + c(4) .* cos(c(5) .* xP) - yP;
Jf1= ones(200,1);
Jf2 = @(c) sin(c(3) .* xP);
Jf3 = @(c) c(2) .* xP .* cos(c(3) .* xP);
Jf4 = @(c) cos(c(5) .* xP);
Jf5 = @(c) -c(4) .* xP .* sin(c(5) .* xP);
JF = @(c) [Jf1 Jf2(c) Jf3(c) Jf4(c) Jf5(c)];
%c1 = sum(yP) / 255;
%c2 = 5;
c3 = pi / 6;
%c5 = pi / 6;
norm(JF([1 1 1 1 1]'), 'fro')
% x0 = [c1 c2 c3 c4 c5]';
g =@(c) c(1)+ c(2) .* sin(c3 .* xP) + c(4) .* cos(c5 .* xP) -yP;
A = ones(3);
for i = 1: 200
    A(i, 1) = 1;
    A(i, 2) = sin(c3 .* xP(i));
    A(i, 3) = cos(c5 .* xP(i));
end
novA = A' * A;
b = A' * yP;
[x, L, U] = lusolve(novA, b);
cZac = [x(1) x(2) c3 x(3) c5];

F = f(x0);
dx = - JF(x0) \ F;
nov = c1 + dx(1)
% [x, X, k] = newton(f, JF, cZac, 10 ^ -16, 1);
% x(1)
% c = X(:, k + 1);
% % mean(c)
% g = @(x) c(1)+ c(2) .* sin(c(3) .* x) + c(4) .* cos(c(5) .* x);
% x = linspace(1, 255, 1000);
% y = g(x);
% mean(y);