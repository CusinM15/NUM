syms x
format long
f = @(x) 5*cos(x - exp(x)) - x;
%Prvi del
% a = 0;
% b = 1;
% for i = 1:4
%     k = (f(a) - f(b))/(a - b);
%     n = f(a) - k * a;
%     c = -n / k;
%     if f(a) * f(c) < 0
%         b = c;
%     else
%         a = c;
%     end
% end
% c
a = 1;
b = 2;
manjsi = 1;
i = 1;
while abs(manjsi) > 10^(-16)
    i = i + 1;
    k = (f(a) - f(b))/(a - b);
    n = f(a) - k * a;
    c = -n / k;
    manjsi = min(c - a, b - c);
    if f(a) * f(c) < 0
        b = c;
    else
        a = c;
    end
end
i

    