function [Nbpt,Nbtri,Coorneu,Numtri]=lecture_msh(nomfileNode,nomfileElement)
% routine de lecture de fichiers de maillages triangulaires 2D au format .msh
%
%      Attention, les fichiers .msh doivent avoir ete manuellement scindes
% 
% SYNOPSIS [Nbpt,Nbtri,Coorneu,Numtri]=lecture_msh(nomfileNode,nomfileElement)
%          
% INPUT * : les deux noms de fichiers de maillage (avec leur suffixe)
%
% OUTPUT - Nbpt : nbre de sommets (entier) 
%        - Nbtri : nbre de triangles (entier)
%        - Coorneu : coordonnees (x,y) des sommets (matrice reelle Nbpt x 2)
%        - Numtri : liste de triangles 
%                   (3 numeros de sommets - matrice entiere Nbtri x 3)
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% charger le fichier nomfileNode
    % il s'agit d'un fichier contenant des données Nbptx4 
    % la première colone contient les indexes de chacun des noeuds 
    % la deuxième - les coordonnés en x du noeud 
    % la troisième - la coordonnée en y du noeud
    % la quatrième - ?????????????????
value=load(nomfileNode);

% retrouver les dimensions de value, coordonnée en x correspond à Nbpt
s=size(value); 
Nbpt = s(1);

% récupérer les coordonnés des points des noeuds 
Coorneu = zeros(Nbpt,2);
for i=1:Nbpt
  Coorneu(i,1) = value(i,2);
  Coorneu(i,2) = value(i,3);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% charger le fichier nomfileElement
    % il s'agit d'un fichier contenant ???????????????????
value=load(nomfileElement);

% retrouver les dimenstions de value
s=size(value);
Nbtri = s(1); % nombre de triangles
enddd = s(2); % nb de colones de value 
              %(on voudra prendre les 3 derniers éléments)


Numtri = zeros(Nbtri,3);
% Reftri = zeros(Nbtri,1);
% on traite les references des triangles
% certains des elements dans chaque ligne ne sont pas utiles ici
for i=1:Nbtri
  Numtri(i,1) = value(i,enddd-2);
  Numtri(i,2) = value(i,enddd-1);
  Numtri(i,3) = value(i,enddd);
end
end
