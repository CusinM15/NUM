function [x,X,k] = newton(f,Jf,x0 ,tol ,N)
% Opis:
%   newton  izvede  Newtonovo  metodo  za  resevanje  sistema
%   nelinearnih  enacb
%
% Definicija:
%   [x,X,k] = newton(f,Jf,x0,tol ,N)
%
% Vhodni  podatki:
%   fpreslikava , ki  doloÄ?a  nelinearni  sistem f(x) = 0,
%   Jf    Jacobijeva  matrika  preslikave f,
%   x0    zacetni  priblizek (stolpec),
%   tol   toleranca  za  razlike  dveh  zaporednih  priblizkov ,
%   N maksimalno  stevilo  korakov  iteracije
% Izhodni  podatki:
%   xkoncni  priblizek  za  resitev  sistema f(x) = 0,
%   X tabela  vseh  izracunanih  priblizkov ,
%   k stevilo  opravljenih  korakov
X = x0; %vektor 1x5
dx = Inf; %sprememba x
k = 0; %stevilo korakov
while  norm(dx) > tol && k < N
    k = k+1;
    dx = -Jf(X(:,k))\f(X(:,k));
    X(:,k+1) = X(:,k) + dx;
end
x = X(:,k+1);
end