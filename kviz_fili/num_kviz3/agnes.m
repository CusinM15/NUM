a = 1.7;
f = @(x) 8 * a ^ 3 ./ (x .^ 2 + 4 * a ^ 2);
%x1 = [0, 1.04, 2.16, 3.36, 4.64, 6];
x1 = ones(1, 7);
for i = 0: 6
    x1(i + 1) = -0.4 + (i ^ 2) / 6;
end
d_1 = delDif(x1, f(x1));
rez = 1;
meja = 1;

for i = 1: 7
    if abs(d_1(i)) < meja
        rez = d_1(i);
        meja = abs(d_1(i));
    end
end
rez;

% %rezultat1 = d_1(end)
x2 = 1;
vrednosti = horner_NP(x1, d_1, x1);
rezultat2 = mean(vrednosti)
x3 = [0; 0; 6; 6];
DX = @(x) -8 .* a .^3 .* 2 .* x ./ (x .^ 2 + 4 .* a .^ 2) .^ 2;
DY = DX(x3);
d3 = delDif(x3,f(x3),DY);
% rezultat3 = mean(d3)
razlika = f(x2) - horner_NP(x3, d3, x2);
rezultat4 = max(abs(razlika));
