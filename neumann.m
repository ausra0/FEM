% Fichier principal pour la m�thode des �lements finis 2D
clear;
%% 
% variables pour contenir l'erreur
err_l2 = zeros(1,3); 
err_h1 = zeros(1, 3);

% faire tourner le code pour chacun des maillages
for mesh_indx = 1:3 
    %% Lecture du maillage et affichage

    % d�finir les noms des fichiers � lire
    nomMaillageNode = sprintf('geomCarre%d.node', mesh_indx);
    nomMaillageElement = sprintf('geomCarre%d.element', mesh_indx);

    % lire les fichiers pour reconstruire le maillage
    [Nbpt,Nbtri,Coorneu,Numtri]=lecture_msh(nomMaillageNode,nomMaillageElement);
    num_figure = 1;


    % afficher le maillage 
    %visu(num_figure,Numtri,Coorneu);
    num_figure = num_figure + 1;


    %% Calcul des matrices EF

    % declarations
    K = zeros(Nbpt,Nbpt); % matrice de raideur
    M = zeros(Nbpt,Nbpt); % matrice de masse

    % boucle sur les triangles
    for i=1:Nbtri
      % On d�termine les num�ros des noeuds dans la num�rotation globale 
      s1 = Numtri(i, 1); 
      s2 = Numtri(i, 2); 
      s3 = Numtri(i, 3); 

      % On d�termine les coordonn�s associ�es � ces noeuds 
      S1 = Coorneu(s1, :); 
      S2 = Coorneu(s2, :); 
      S3 = Coorneu(s3, :); 

      % calcul des matrices elementaires du triangle l 
      Kel=matK_elem(S1,S2,S3);
      Mel=matM_elem(S1,S2,S3);

      % On fait l'assemmblage de la matrice globale et du second membre
      K([s1, s2, s3], [s1, s2, s3]) = K([s1, s2, s3], [s1, s2, s3]) + Kel; 
      M([s1, s2, s3], [s1, s2, s3]) = M([s1, s2, s3], [s1, s2, s3]) + Mel;

    end %% for i

    %% Calcul du second membre L

    % On calcule la constribution 
    FF = frhs(Coorneu);

    % On calcule le membre de droite
    LL = M*FF; 

    %% Re�solution du syst�me --- UU = (MM+KK)\LL;

    % on construit une matrice creuse a partir de la matrice de raideur et de
    % la matrice de masse
    Matt = M + K;
    smat = sparse(Matt);

    % factorisation de Cholesky 
    U = smat\LL; 

    %% Visualisation
    % affiche la solution approchee
    %affiche(num_figure, U, Numtri, Coorneu);
    num_figure = num_figure + 1;

    % affiche la solution exacte
    U_exact = cos(pi*Coorneu(:,1)).*cos(2*pi*Coorneu(:,2));

    %affiche(num_figure, U_exact, Numtri, Coorneu);
    num_figure = num_figure + 1;
    
    %% Calcul de l erreur L2
    err_l2(mesh_indx) = (U_exact - U)'*M*(U_exact - U); 

    %% Calcul de l erreur H1
    err_h1(mesh_indx) = (U_exact - U)'*K*(U_exact - U) + err_l2(mesh_indx); 

end

%% affichage de l'erreur
h = [0.22, 0.11, 0.055];

figure 
subplot(1, 2, 1);
loglog(h, err_l2);
title("erreur L2");
xlabel("h"); 
ylabel("||u - u_{h}||");

subplot(1, 2, 2);
loglog(h, err_h1);
title("erreur H1"); 
xlabel("h"); 
ylabel("||u - u_{h}||");
