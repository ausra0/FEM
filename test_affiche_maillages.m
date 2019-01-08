% TECHNIQUE : script qui affiche les trois maillages 

%% Premier maillage
% définir les fichiers utiles à la construction du maillage
nomMaillageNode = 'geomCarre.node';
nomMaillageElement = 'geomCarre.element';

% lire le maillage
[Nbpt, Nbtri, Coorneu, Numtri]=lecture_msh(nomMaillageNode,nomMaillageElement);

% définir le numéro de figure et visualiser le maillage 
num_figure = 1;
visu(num_figure,Numtri,Coorneu);

% afficher le nombre de noeuds et de triangles 
fprintf('nb. de noeuds : %d \n', Nbpt);
fprintf('nb. de triangles : %d \n', Nbtri); 

%% Second maillage
% définir les fichiers utiles à la construction du maillage
nomMaillageNode = 'geomCarre2.node';
nomMaillageElement = 'geomCarre2.element';

% lire le maillage
[Nbpt, Nbtri, Coorneu, Numtri]=lecture_msh(nomMaillageNode,nomMaillageElement);

% définir le numéro de figure et visualiser le maillage 
num_figure = 2;
visu(num_figure,Numtri,Coorneu);

% afficher le nombre de noeuds et de triangles 
fprintf('nb. de noeuds : %d \n', Nbpt);
fprintf('nb. de triangles : %d \n', Nbtri);

%% Troisième maillage
% définir les fichiers utiles à la construction du maillage
nomMaillageNode = 'geomCarre3.node';
nomMaillageElement = 'geomCarre3.element';

% lire le maillage
[Nbpt, Nbtri, Coorneu, Numtri]=lecture_msh(nomMaillageNode,nomMaillageElement);

% définir le numéro de figure et visualiser le maillage 
num_figure = 3;
visu(num_figure,Numtri,Coorneu);

% afficher le nombre de noeuds et de triangles 
fprintf('nb. de noeuds : %d \n', Nbpt);
fprintf('nb. de triangles : %d \n', Nbtri);