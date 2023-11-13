
function [Priblizek_pi, Napaka] = area_pi(Pricakovane)
    Priblizek_pi = mean(Pricakovane);
    Napaka = std(Pricakovane);
end