n = 50000;
re_diag = ones(n, 1);
im_diag = ones(n, 1) * 0.5;
nad_re = ones(n, 1) * 0.28;
im_b = ones(n, 1) * 0.13;
re_b = ones(n, 1);
for i = 1: n
    re_b(i) = sin(i/n);
end
Re = spdiags([re_diag, nad_re], [0, 1], n, n);
Im = spdiags(im_diag, 0, n, n);
A = [Re, -1 * Im; Im, Re];
b = [re_b; im_b];
x = A \ b;
norm(x)
