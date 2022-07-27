%code de lissage exponentiel simple

    %Faire entrer la série chronologique X_N et alpha
    
    %Etape 01 de lissage simple : Initialisation
    %La première valeur de lissage 
    lissage_simple(1) = X_N(1);
    lissage_initial(1) = lissage_simple(1);
    %Etape 02 de lissage simple : calcul de lissage 
    for i = 2:N+1
        lissage_simple(i) = lissage_initial(i-1)+(1-alpha)*(X_N(i-1)-lissage_initial(i-1));
        lissage_initial(i) = lissage_simple(i);
        lissage_simple([1]) = [];
        %Affichage des résultats
        lissage_exponentiel_simple = transpose(lissage_simple)