function [Kel] = matK_elem(S1, S2, S3)
% calcule la matrices de raideur elementaire en P1 Lagrange
%
% SYNOPSIS [Kel] = mat_elem(S1, S2, S3)
%          
% INPUT * S1, S2, S3 : les 2 coordonnees des 3 sommets du triangle 
%                      (vecteurs reels 1x2)
%
% OUTPUT - Kel matrice de raideur elementaire (matrice 3x3)
%
% NOTE (1) le calcul est exact (pas de condensation de masse)
%      (2) calcul direct a partir des formules donnees par 
%          les coordonnees barycentriques 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% preliminaires, pour faciliter la lecture:
x1 = S1(1); y1 = S1(2);
x2 = S2(1); y2 = S2(2);
x3 = S3(1); y3 = S3(2);

% les 3 normales a l'arete opposees (de la longueur de l'arete)
normm = zeros(3, 2);
normm(1, :) = [y2-y3, x3-x2];
normm(2, :) = [y3-y1, x1-x3];
normm(3, :) = [y1-y2, x2-x1];

% D est, au signe pres, deux fois l'aire du triangle
D = ((x2-x3)*(y3-y1) - (y2-y3)*(x3-x1));
TresPetit = 1e-6;
if (abs(D) <= TresPetit) 
  error('l aire d un triangle est nulle!!!'); 
end

% calcul de la matrice de raideur
Kel = (0.5/abs(D)).*normm*normm'; 
end
