% teste si les fonctions elem marchent bien 
%% 
% Coordonnees des sommets du triangles
S1=[0,0];
S2=[1,0];
S3=[0,1];
%% 
Kl = matK_elem(S1, S2, S3); 
disp(Kl); 

%% 
Ml = matM_elem(S1, S2, S3); 
disp(Ml); 