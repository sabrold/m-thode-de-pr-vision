display('1\ LISSAGE EXPONENTIEL SIMPLE : Série chronologique sans tendance')
%Donner une valeur à N : N désigne le nombre des élements de la série
N = 12 ;
%Génération : Série chronologoique sans tendance
    %Génération : Temps
    %'dd-mm-yy' : la forme de la date entrée
    %Choisir une date de début et une date de fin
        date = datestr(SerieChronologique('1-jan-2019','1-jan-2020'),'dd-mmm-yy');
    %Génération : Données
        val = randi([950 2000],N,1);
    %Affichage : Série chronologique
        esp = '    '; espace = repmat(esp,N,1);
        serie_chronologique = strcat([date,espace,int2str(val)])
    
%Lissage simple et le choix de la meilleure constante d'alpha
    %Déclaration des variables
    alpha = 0.01; j = 1;
    X_N = val;
    %Initialisation de min de l'erreur carré et de la meilleure constante
    %d'alpha
    min_Err_carre = inf;
    meilleur_alpha = 0.01;
    %faire varier le alpha
    while(alpha <= 0.99)
        %Etape 01 de lissage simple : Initialisation
        %La première valeur de lissage 
        lissage_simple(1) = X_N(1);
        lissage_initial(1) = lissage_simple(1);
        %Etape 02 de lissage simple : calcul de lissage 
        for i = 2:N+1
            %Calcul : lissage simple
            lissage_simple(i) = lissage_initial(i-1)+(1-alpha)*(X_N(i-1)-lissage_initial(i-1));
            lissage_initial(i) = lissage_simple(i);
            %Calcul : l'erreur
            Err(i)=X_N(i-1)-lissage_simple(i);
            %Calcul : l'erreur carré
            Err_carre(i) = Err(i)^2;
            %Calcul : la moyenne de l'erreur carré
            Moyenne_Err_carre(j) = sum(Err_carre)/N;
        end
        %La condition pour que alpha soit meilleure        
        if (Moyenne_Err_carre(j)<min_Err_carre)
            min_Err_carre = Moyenne_Err_carre(j);
            meilleur_alpha = alpha;
        end
        %Incrémentation
        alpha = alpha + 0.01;
        j = j + 1;
        
        lissage_simple([1]) = [];
        Err([1]) = [];
        Err_carre([1]) = [];   
    end
    %Affichage des résultats
    lissage_exponentiel_simple = transpose(lissage_simple)
    Erreur = transpose(Err)
    Erreur_carre = transpose(Err_carre)
    meilleur_alpha
  

    
    
    
    
   

