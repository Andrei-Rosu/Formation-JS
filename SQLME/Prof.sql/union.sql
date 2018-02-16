--# UNION permet de fusionner plusieurs resultats dans une meme colonne

USE bibliotheque;

--# afficher les auteurs et les abonnes dans une meme colonne
SELECT prenom AS 'liste personne' FROM abonne UNION SELECT auteur FROM livre;
--#
SELECT prenom AS 'liste personne' FROM abonne
UNION
SELECT auteur FROM livre;

--# UNION fait un DISTINCT par defaut
--# Pour avoir toutes les infos : UNION ALL
SELECT prenom AS 'liste personne' FROM abonne
UNION ALL
SELECT auteur FROM livre;