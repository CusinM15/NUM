function [e, x, k] = potDruga(A, x0, tol, N)
    x = x0 / norm(x0);
    Ax = A * x;
    e = x'* Ax;
    meja = e;
    k = 0;
    while  norm(meja - e) > tol && k < N
        x = Ax / norm(Ax);
        Ax = A * x;
        e = x' * Ax;
        k = k + 1;
    end
end