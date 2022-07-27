display('1\ LISSAGE EXPONENTIEL DOUBLE')
display('   S�rie chronologique avec tendance')
%Choisir une valeur pour N et h
N = 24; h = 9;
%G�n�ration : S�rie chronologoique avec tendance
    %G�n�ration : Temps
    %dd-mmm-d : format de la date entr�e
    %Choisir une date de d�but et une date de fin
        date = datestr(SerieChronologique('1-jan-2020','1-jan-2022'),'dd-mmm-yy');
    %G�n�ration : Donn�es
        A = randi([950 2000],N,1);
        val = sort(A);
    %Affichage : S�rie chronologique
        esp = '    '; espace = repmat(esp,N,1);
        serie_chronologique = strcat([date,espace,int2str(val)])

%Lissage double et le choix de la meilleure constante d'alpha
    %D�claration des variables
        alpha = 0.01; j = 1;
        X_N = val;
    %Initialisation de min de l'erreur carr� et de la meilleure constante
    %d'alpha
    min_Err_carre = inf;
    meilleur_alpha = 0.01;
    %faire varier le alpha
    while(alpha <= 0.99)
        %Etape 01 : initialisation de lissage
        lissage_double(1 )= X_N(1);
        S_1(1) = lissage_double(1);
        S_2(1) = (1-alpha)^2*X_N(1);
        %Etape 02 : calcul de lissage 
        for i = 2:N
            %le premier lissage 
            S_1(i) = alpha*S_1(i-1)+(1-alpha)*X_N(i);
            %le deuxi�me lissage
            S_2(i) = alpha*S_2(i-1)+(1-alpha)*S_1(i);
        end
        %Etape 03 : calcul des alpha's 
        for i = 1:N
            alpha_chap_1(i) = 2*S_1(i)-S_2(i);
            alpha_chap_2(i) = ((1-alpha)/alpha)*(S_1(i)-S_2(i));
        end
        %Etape 04 : pr�vision pour la p�riode h
        for i = 1:N
            X_chap(i) = alpha_chap_1(i)+(alpha_chap_2(i)*h);
            %Calcul : l'erreur
            Err(i) = X_N(i)-X_chap(i);
            %Calcul : l'erreur carr�
            Err_carre(i) = Err(i)^2;
        end
        %Calcul : la moyenne de l'erreur carr�
        Moyenne_Err_carre(j) = sum(Err_carre)/N;
        %La condition pour que alpha soit meilleure        
        if (Moyenne_Err_carre(j)<min_Err_carre)
            min_Err_carre = Moyenne_Err_carre(j);
            meilleur_alpha = alpha;
        end
        %Incr�mentation d'alpha
        alpha = alpha + 0.01;
        j = j + 1;
        
    end
    %Affichage des r�sultats
    S_1 = transpose(S_1)
    S_2 = transpose(S_2)
    alpha_chap_1 = transpose(alpha_chap_1)
    alpha_chap_2 = transpose(alpha_chap_2)
    X_chap = transpose(X_chap)
    Erreur = transpose(Err)
    Erreur_carre = transpose(Err_carre)
    meilleur_alpha
    
    
    
    



