function Mel = matM_elem(S1, S2, S3)
% calcul la matrices de masse elementaire en P1 lagrange
%
% SYNOPSIS Mel = matM_elem(S1, S2, S3)
%          
% INPUT * S1, S2, S3 : les 2 coordonnees des 3 sommets du triangle 
%                      (vecteurs reels 1x2)
%
% OUTPUT - Mel matrice de masse elementaire (matrice 3x3)
%
% NOTE (1) le calcul est exact (pas de condensation de masse)
%      (2) calcul direct a partir des formules donnees par 
%          les coordonnees barycentriques 
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%/

% preliminaires, pour faciliter la lecture:
x1 = S1(1); y1 = S1(2);
x2 = S2(1); y2 = S2(2);
x3 = S3(1); y3 = S3(2);

% D est, au signe pres, deux fois l'aire du triangle
D = ((x2-x3)*(y3-y1) - (y2-y3)*(x3-x1));
Tol = 1e-6;
if (abs(D) <= Tol) 
  error('l aire d un triangle est nulle!!!'); 
end
%aire = 0.5*abs(D); 

% d�finir les fonctions de base 
phi1 = @(s)((y2 - y3).*(s(:, 1) - x3) - (x2 - x3).*(s(:, 2) - y3)); 
phi2 = @(s)((y3 - y1).*(s(:, 1) - x1) - (x3 - x1).*(s(:, 2) - y1)); 
phi3 = @(s)((y1 - y2).*(s(:, 1) - x2) - (x1 - x2).*(s(:, 2) - y2)); 

midpoints = [(S1 + S2)./2; (S2 + S3)./2; (S3 + S1)./2];
Phi = [phi1(midpoints), phi2(midpoints), phi3(midpoints)]; 

% calcul de la matrice de masse
Mel = (1/(abs(D)*6)).*Phi'*Phi; 
%Mel = zeros(3,3);
%for i=1:3
%  for j=1:3
%    Mel(i,j) = aire/3; 
%  end 
%end 
%Mel = aire/3*eye(3); 
end
