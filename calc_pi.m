max_tock = 1000000; % 
korak = 10000;
ponovitve = max_tock / korak;

Vrednosti_pi = zeros(1, ponovitve);
Napaka = zeros(1, ponovitve);

for i = 1:ponovitve
    st_tock = i * korak;
   
    [tocke_v_krogu, ~] = mcc_pi(st_tock);
    Priblizek_pi = 4 * size(tocke_v_krogu, 2) / st_tock;
    Vrednosti_pi(i) = Priblizek_pi;
    Napaka(i) = abs(Priblizek_pi - pi);
end

[Koncna_vrednost_pi, Koncna_napaka] = area_pi(Vrednosti_pi);
fprintf('Ocena za π: %f\n', Koncna_vrednost_pi);
fprintf('Napaka: %f\n', Koncna_napaka);

Ocena za π: 3.141930
Napaka: 0.004117