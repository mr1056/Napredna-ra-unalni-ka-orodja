st_tock = 1000000;

x = rand(1, st_tock);
y = rand(1, st_tock);

v_krogu = (x.^2 + y.^2) <= 1;

Ocena_pi = 4 * sum(v_krogu) / st_tock;

% Izpišite rezultat
fprintf('Priblizek za pi: %f\n', Ocena_pi);

mcc_pi(st_tock);

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



% Anonimna funkcija za izračun točk na loku krožnice
Tocke_na_loku = @(theta, r) [r * cos(theta); r * sin(theta)];

theta_v = linspace(0, pi/2, 100);
r = 1;

Koordinate_loka = Tocke_na_loku(theta_v, r);

[tocke_v_krogu, tocke_v_kvadratu] = mcc_pi(st_tock);

x_znotraj =  tocke_v_krogu(1, :);
y_znotraj =  tocke_v_krogu(2, :);
x_zunaj = tocke_v_kvadratu(1, ~tocke_v_krogu);
y_zunaj = tocke_v_kvadratu(2, ~tocke_v_krogu);

% Vizualizacija
figure;
scatter(x_znotraj, y_znotraj, 25, 'green', 'filled');
hold on;
scatter(x_zunaj, y_zunaj, 25, 'black', 'filled');
plot(Koordinate_loka(1, :),Koordinate_loka(2, :), 'k', 'LineWidth', 2);
title('Razporeditev naključno generiranih točk');
    xlabel('X-os');
    ylabel('Y-os');
    legend('Krožnica','Znotraj krožnice', 'Zunaj krožnice'); 
