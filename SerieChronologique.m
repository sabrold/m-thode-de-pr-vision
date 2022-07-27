%Génération de temps pour les séries chronologique
    function [ b ] = SerieChronologique(date_debut,date_fin)
    %La première date de la série
    date_start = datevec(date_debut);
    %La dernière date de la série 
    date_end = datevec(date_fin);
    tmp = (1:[date_end-date_start]*[12 1 0 0 0 0]')'-1;
    a = ones(size(tmp));
    b = datenum([date_start(1)*a, date_start(2)+tmp, a*[1 0 0 0]]);
end

