function FF = frhs(Coorneu)
% Evaluation de la fonction second membre.
%          
% INPUT - 
%       Coorneu : les coordonn�es de tous les noeuds.
%
% OUTPUT - 
%       FF : vecteur de taille Nbpts, contenant la valeur de f en chacun des noeuds.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% d�finir la fonction pour le second membre 
f = @(x, y)((1+5*pi^2).*cos(pi.*x).*cos(2*pi.*y)); 

% �valuer la fonction du second membre
FF = f(Coorneu(:, 1), Coorneu(:, 2)); 
end
