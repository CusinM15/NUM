mojaTabela = load('salaries.mat'); 
mojaTabela = mojaTabela.salaries;
%(1)
b = [3,4,6,10,11,13,15];
steviloPlacil = numel(mojaTabela(:,b))
[steviloVrstic, steviloStolpcev] = size(mojaTabela);
steviloPlacil = 0;
for m = 1: steviloVrstic
    for n = b
        steviloPlacil = steviloPlacil +1;
    end
end
steviloPlacil

%(2)
cena = 0;
for m = 1: steviloVrstic
    for n = b
        cena = cena + mojaTabela(m, n);
    end
end
cena

%(3)
visek = 0;
for i = 1: steviloVrstic
    for j = b
        ostanek = mojaTabela(i, j) - floor(mojaTabela(i, j));
        visek = visek + ostanek;
    end
end
visek

%(4)
visek2 = 0;
for i = 1: steviloVrstic
    for j = b
        x = mojaTabela(i, j) *100;
        y = floor(x);
        ostanek = (x - y)/100;
        visek2 = visek2 + ostanek;
    end
end
visek2

%(5)
lihCena = 0;
for i = 1: 2: steviloVrstic
    for j = b
        x = mojaTabela(i, j) *100;
        y = floor(x);
        ostanek = (x - y)/100;
        lihCena = lihCena + ostanek;
    end
end
lihCena
