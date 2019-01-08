% Fichier principal pour la méthode des élements finis 2D
clear;

%% Lecture du maillage et affichage

% définir les noms des fichiers à lire
nomMaillageNode = 'geomCarre.node';
nomMaillageElement = 'geomCarre.element';

% lire les fichiers pour reconstruire le maillage
[Nbpt,Nbtri,Coorneu,Numtri]=lecture_msh(nomMaillageNode,nomMaillageElement);
num_figure = 1;


% afficher le maillage 
visu(num_figure,Numtri,Coorneu);
num_figure = num_figure + 1;


%% Calcul des matrices EF

% declarations
KK = zeros(Nbpt,Nbpt); % matrice de raideur
MM = zeros(Nbpt,Nbpt); % matrice de masse
% LL = zeros(Nbpt,1);    % vecteur second membre

% boucle sur les triangles
for i=1:Nbtri
  % On détermine les numéros des noeuds dans la numérotation globale 
  s1 = Numtri(i, 1); 
  s2 = Numtri(i, 2); 
  s3 = Numtri(i, 3); 
  
  % On détermine les coordonnés associées à ces noeuds 
  S1 = Coorneu(s1, :); 
  S2 = Coorneu(s2, :); 
  S3 = Coorneu(s3, :); 
%   
%   S1=[0,0];
% S2=[1,0];
% S3=[0,1];
  
  % calcul des matrices elementaires du triangle l 
  Kel=matK_elem(S1,S2,S3);
  Mel=matM_elem(S1,S2,S3);
    
  % On fait l'assemmblage de la matrice globale et du second membre
  KK([s1, s2, s3], [s1, s2, s3]) = KK([s1, s2, s3], [s1, s2, s3]) + Kel; 
  MM([s1, s2, s3], [s1, s2, s3]) = MM([s1, s2, s3], [s1, s2, s3]) + Mel;

end %% for i

%% Calcul du second membre L

% On calcule la constribution 
FF = frhs(Coorneu);

% On calcule le membre de droite
LL = MM*FF; 

%% Reésolution du système 
% UU = (MM+KK)\LL;

% on construit une matrice creuse a partir de la matrice de raideur et de
% la matrice de masse
Matt = MM + KK;
smat = sparse(Matt);

% factorisation de Cholesky 
UU = smat\LL; 

%% visualisation
affiche(num_figure,UU,Numtri,Coorneu);
num_figure = num_figure + 1;
%% 
UU_exact = cos(pi*Coorneu(:,1)).*cos(2*pi*Coorneu(:,2));
%UU_exact = cos(pi*Coorneu(:,2));

affiche(num_figure,UU_exact,Numtri,Coorneu);
num_figure = num_figure + 1;

%% Calcul de l erreur L2
err_l2 = (UU_exact - UU)'*MM*(UU_exact - UU); 

%% Calcul de l erreur H1
err_der = (UU_exact - UU)'*KK*(UU_exact - UU); 
