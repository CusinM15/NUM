b = 19/20;
f = @(x) b - 1 + x*cos(x) + sin(x+b) - 4*cos(2*x) + 5*sin(2*x);
%recimo da so nièle lepo razporejene
korak = 2*pi / 4;
for i = 0:korak:2*pi
    resitev = fzero(f,i)
end
