function [lam,x,k] = potencna(A,x0,tol,maxk,info)
% Opis:
%  potencna metoda izvede potencno metodo za iskanje dominantnega lastnega
%  para matrike
%
% Definicija:
%  [lam,x,k] = potencna(A,x0,tol,maxk,info)
%
% Vhodni podatki:
%  A    matrika ali funkcija mnozenja z matriko,
%  x0   zacetni priblizek za dominantni lastni vektor,
%  tol  toleranca za normo razlike A*x-lam*x pri izhodnem priblizku za
%       lastni par (lam,x) (privzeto 1e-5),
%  maxk maksimalno stevilo korakov iteracije (privzeto 100),
% info  stikalo za izpis (privzeto false)
%  
% Izhodni podatki:
%  lam  priblizek za dominantno lastno vrednost (Rayleighjev kvocient),
%  x    priblizek za dominantni lastni vektor,
%  k    stevilo opravljenih korakov

% privzete vrednosti
if nargin < 5, info = false; end
if nargin < 4, maxk = 100; end
if nargin < 3, tol = 1e-5; end

% ce je podana matrika, jo zamenjamo s funkcijo mnozenja z matriko
if ~isa(A,'function_handle')
    A = @(x) A*x;
end

% normiranje zacetnega priblizka
x = x0/norm(x0);

% priprava na prvi korak
Ax = A(x);
lam = x'*Ax; % Rayleighjev kvocient zacetnega priblizka

% iteracija
k = 0;
e = norm(Ax-lam*x);
while e >= tol && k < maxk
    % nov priblizek
    x = Ax/norm(Ax);
    
    % Rayleighjev kvocient
    Ax = A(x);
    lam = x'*Ax;
    
    % napaka
    e = norm(Ax-lam*x);
    
    % opravljen korak
    k = k+1;
    
    % po potrebi izpis informacij
    if info
        fprintf('Korak %d\n', k);
        fprintf(' Priblizek za lastno vrednost: %f\n', lam);
        fprintf(' Priblizek za lastni vektor: %s\n', sprintf('%f ',x));
        fprintf(' Napaka: %f\n', e);
    end
end

% po potrebi izpis o uspesnosti konvergence
if info
    if e < tol
        disp('Potencna metoda je skonvergirala.');
    else
        disp('Potencna metoda ni skonvergirala.');
    end
end

end