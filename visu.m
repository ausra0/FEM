function visu(numf,Numtri,Coorneu)
% permet de voir le maillage (Numtri, Coorneu)
%
%SYNOPSIS : visu(numf,Numtri,Coorneu)
%         
% INPUT * Numtri : liste de triangles 
%                   (3 numeros de sommets - matrice entiere Nbtri x 3)
%       * Coorneu : coordonnees (x, y) des sommets (matrice reelle Nbpt x 2)
%       * numf : numero de la figure
%
% OUTPUT une fenetre graphique
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% nombre de noeuds
Nbpt=size(Coorneu,1); 

% extraire les coordonnés en x-y-z
xxt = Coorneu(:, 1);
yyt = Coorneu(:, 2);
Uplot = ones(Nbpt,1);

% affichage du maillage
figure(numf);
trisurf(Numtri, xxt,yyt,Uplot','facecolor','interp')
view([0 90]);

end
