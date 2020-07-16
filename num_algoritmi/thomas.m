function [x,l,u] = thomas(a,b,c,f)
% Opis:
%  thomas resi sistem s tridiagonalno matriko z LU razcepom brez
%  pivotiranja.
%
% Definicija:
%  [x,l,u] = thomas(a,b,c,f)
%
% Vhodni podatki:
%  a    glavna diagonala matrike,
%  b    diagonala nad glavno diagonalo matrike,
%  c    diagonala pod glavno diagonalo matrike,
%  f    stolpec, ki predstavlja desno stran sistema.
%
% Izhodni podatki:
%  x    resitev sistema A x = f, kjer je matrika A dolocena z diagonalami
%       a, b, c,
%  l    diagonala pod glavno diagonalo enic matrike L v LU razcepu A
%       (ostali elementi L so enaki 0),
%  u    glavna diagonala matrike U v LU razcepu matrike A (diagonala nad
%       glavno diagonalo je enaka b, vsi ostali elementi U so enaki 0).

n = length(a);
u = zeros(n,1);
l = zeros(n-1,1);

% LU razcep (3n-3 operacij)
u(1) = a(1);
for j = 1:n-1
    l(j) = c(j)/u(j);
    u(j+1) = a(j+1) - l(j)*b(j);
end

% premo vstavljanje (2n-2 operacij)
y = f;
for j = 2:n
    y(j) = f(j) - l(j-1)*y(j-1);
end

% obratno vstavljanje (3n-2 operacij)
x = y;
x(n) = y(n)/u(n);
for j = n-1:-1:1
    x(j) = (y(j)-b(j)*x(j+1))/u(j);
end

end