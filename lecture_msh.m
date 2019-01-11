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
value=load(nomfileNode);

% retrouver les dimensions de value, coordonn�e en x correspond � Nbpt
s=size(value); 
Nbpt = s(1);

% r�cup�rer les coordonn�s des points des noeuds 
Coorneu = zeros(Nbpt,2);
for i=1:Nbpt
  Coorneu(i,1) = value(i,2);
  Coorneu(i,2) = value(i,3);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% charger le fichier nomfileElement
value=load(nomfileElement);

% retrouver les dimenstions de value
s=size(value);
Nbtri = s(1); % nombre de triangles
enddd = s(2); % nb de colones de value 
              %(on voudra prendre les 3 derniers �l�ments)


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
