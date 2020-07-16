function d = delDif(X, Y, DY)
% Trikotna shema za kubicni polinom za interpolacijske tocke x0=x1% X = [x0 x3], interpolacijske tocke,
% Y = [y0 y3], interpolacija vrednosti,
% DY = [dy0 dy3], interpolacija odvodov,
% Metoda vrne koeficiente d polinoma (deljene diference).

n = length(X);
A(:, 1) = X;
A(:, 2) = Y;
k = 0;
for j = 3 : n + 1   %stolpci
    k = k + 1;
    for i = 1 : n - j + 2  %elementi v stolpcu
        if A(i + k, 1) == A(i, 1)
            A(i, j) = DY(i, 1);
        else
            A(i, j) = (A(i + 1, j - 1) - A(i, j - 1)) / (A(i + k, 1) - A(i, 1));
        end
    end
d = A(1, 2: end);
end