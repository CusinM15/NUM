b = 8;
f = @ (x)1/10 * (x^4 - x^3 - 4*x^2 + 4*x) + 1/2 + b/300;
%recimo da so ni�le lepo razporejene
korak = 2*pi / 4;
% for i = 0:korak:2*pi
%     resitev = fzero(f,i)
% end

% fzero(f,-10)
% fzero(f,-1)
g = @ (x)1/10 * (x^4 - x^3 - 4*x^2 + 4*x) * -(1/2 + b/300)
tekociX = -1
for i = 1:5
    tekociX = g(tekociX)
    f(tekociX)
end
