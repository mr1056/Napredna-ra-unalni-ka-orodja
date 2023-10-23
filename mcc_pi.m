function [tocke_v_krogu, tocke_v_kvadratu] = mcc_pi(st_tock)
    % Generiranje naključnih točk znotraj kvadrata
    x = rand(1, st_tock);
    y = rand(1, st_tock);
    
    % Preverite, katere točke so znotraj kroga
    v_krogu = (x.^2 + y.^2) <= 1;

    % Ločite točke znotraj kroga in točke znotraj kvadrata
    tocke_v_krogu = [x(v_krogu); y(v_krogu)];
    tocke_v_kvadratu = [x; y];
end
