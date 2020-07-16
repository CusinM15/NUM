function [e, x, k] = potencna(A, x0, tol, N)
    x = x0 / norm(x0);
    Ax = A * x;
    e = x'* Ax;
    k = 0;
    while  norm(Ax - e * x) >= tol && k < N
        x = Ax / norm(Ax);
        Ax = A * x;
        e = x' * Ax;
        k = k + 1;
    end
end