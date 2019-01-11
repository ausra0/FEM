function affiche(numf,UU,Numtri,Coorneu)
% permet de voir le vecteur UU sur le maillage (Numtri, Coorneu)
%
% SYNOPSIS : affiche(numf,UU,Numtri,Coorneu)
%          
% INPUT * UU vecteur de valeurs aux sommets (vecteur Nbpt x 1)
%       * Numtri : liste de triangles 
%                   (3 numeros de sommets - matrice entiere Nbtri x 3)
%       * Coorneu : coordonnees (x, y) des sommets (matrice reelle Nbpt x 2)
%       * numf : numero de figure
%
% OUTPUT une fenetre graphique
%
% NOTE 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%/

figure(numf);
Nbpt=size(Coorneu,1);

xxt = zeros(Nbpt,1);
yyt = zeros(Nbpt,1);
Uplot = zeros(Nbpt,1);

for i=1:Nbpt
  xxt(i) = Coorneu(i,1);
  yyt(i) = Coorneu(i,2);
  Uplot(i) = UU(i);
end

trisurf(Numtri,xxt,yyt,Uplot','facecolor','interp')
colorbar
view([0 90]);
end
