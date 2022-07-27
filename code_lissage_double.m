%Code de lissage exponentiel double
    %Faire entrer la série chronologique X_N et alpha et h
    %Etape 01 : initialisation de lissage
    lissage_double(1 )= X_N(1);
    S_1(1) = lissage_double(1);
    S_2(1) = (1-alpha)^2*X_N(1);
    %Etape 02 : calcul de lissage 
    for i = 2:N
    %le premier lissage 
        S_1(i) = alpha*S_1(i-1)+(1-alpha)*X_N(i);
    %le deuxième lissage
        S_2(i) = alpha*S_2(i-1)+(1-alpha)*S_1(i);
    end
    %Etape 03 : calcul des alpha's 
    for i = 1:N
        alpha_chap_1(i) = 2*S_1(i)-S_2(i);
        alpha_chap_2(i) = ((1-alpha)/alpha)*(S_1(i)-S_2(i));
    end
    %Etape 04 : prévision pour la période h
    for i = 1:N
        X_chap(i) = alpha_chap_1(i)+(alpha_chap_2(i)*h);
    end
    %Affichage des résultats
    S_1 = transpose(S_1)
    S_2 = transpose(S_2)
    alpha_chap_1 = transpose(alpha_chap_1)
    alpha_chap_2 = transpose(alpha_chap_2)
    X_chap = transpose(X_chap)