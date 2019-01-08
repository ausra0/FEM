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
Nbtri=size(Numtri,1);

xxt = zeros(Nbpt,1);
yyt = zeros(Nbpt,1);
Uplot = zeros(Nbpt,1);

for i=1:Nbpt
  xxt(i) = Coorneu(i,1);
  yyt(i) = Coorneu(i,2);
  Uplot(i) = UU(i);
end

% flag = 1.; %% pas utilise
% triang = zeros(Nbtri,5);
% for l=1:Nbtri
%   triang(l,1) = l;
%   triang(l,2) = Numtri(l,1);
%   triang(l,3) = Numtri(l,2);
%   triang(l,4) = Numtri(l,3);
%   triang(l,5) = flag;
% end

trisurf(Numtri,xxt,yyt,Uplot','facecolor','interp')
view([0 90]);


end
