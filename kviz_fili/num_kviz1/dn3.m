syms x
format long
f = @(x) sin(x) * (cos(x/2))^2 + tan((3-x)/30);
% Prvi del
a = 1;
b = 6;
while abs(f(c)) > 10^(-10)
    k = (f(a) - f(b))/(a - b);
    n = f(a) - k * a;
    c = -n / k;
    if f(a) * f(c) < 0
        b = c;
    else
        a = c;
    end
end
c
k
f(c)
% a = 1;
% b = 2;
% manjsi = 1;
% i = 1;
% while abs(manjsi) > 10^(-16)
%     i = i + 1;
%     k = (f(a) - f(b))/(a - b);
%     n = f(a) - k * a;
%     c = -n / k;
%     manjsi = min(c - a, b - c);
%     if f(a) * f(c) < 0
%         b = c;
%     else
%         a = c;
%     end
% end
% i

    