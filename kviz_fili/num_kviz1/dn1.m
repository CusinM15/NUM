mojaTabela = load('salaries.mat'); 
mojaTabela = mojaTabela.salaries;
%(1)
b = [1,5,6,10,13,14,15];
steviloPlacil = numel(mojaTabela(:,b))
[steviloVrstic, steviloStolpcev] = size(mojaTabela);
steviloPlacil = [];
i = 1;
for m = 1: steviloVrstic
    for n = b
        steviloPlacil(i) = mojaTabela(m, n);
        i = i +1;
    end
end
minimum = min(steviloPlacil);
maksimum = max(steviloPlacil);
maksimum - minimum
%(2)
razlika = 0;
najmanj = 0;
najvec = 0;
for n = b 
    for m = 1: steviloVrstic 
        vmes = mojaTabela(m, n);
        if vmes < najmanj
            najmanj = vmes;
        elseif vmes > najvec
            najvec = vmes;
        end 
    end
    if (najvec - najmanj) > razlika
        razlika = najvec - najmanj;
    end
    najvec = 0;
    najmanj = 0;
end
razlika

%(3)
% visek = 200000;
% for i = 1: steviloVrstic
%     for j = b
%         ostanek = mojaTabela(i, j) - floor(mojaTabela(i, j));
%         visek = visek + ostanek;
%     end
% end
% visek
% 
% %(4)
visek2 = 200000;
for i = 1: steviloVrstic
    sum(mojaTabela(i, :))
    visek2 = visek2 - sum(sum(mojaTabela(i, :)))
        if visek2 < 0
            teden = i - 1
         break
        end
end
visek2
sum(sum(mojaTabela))


% 
% %(5)
% lihCena = 0;
% for i = 1: 2: steviloVrstic
%     for j = b
%         x = mojaTabela(i, j) *100;
%         y = floor(x);
%         ostanek = (x - y)/100;
%         lihCena = lihCena + ostanek;
%     end
% end
% lihCena
