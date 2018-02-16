--# UNION permet de fusionner plusieurs résultat dans une même colonne.

USE bibliotheque;
--# Afficher les auteurs et les abonnés dans une même colonne
SELECT prenom AS 'liste personne' FROM abonne UNION SELECT auteur FROM livre;
--#
SELECT prenom AS 'liste personne' FROM abonne 
UNION
SELECT auteur FROM livre;
+-------------------+
| liste personne    |
+-------------------+
| Guillaume         |
| Benoit            |
| Chloe             |
| Laura             |
| Mathieu           |
| GUY DE MAUPASSANT |
| HONORE DE BALZAC  |
| ALPHONSE DAUDET   |
| ALEXANDRE DUMAS   |
+-------------------+

--# UNION fait un DISTINCT par défaut
--# Pour avoir toutes les informations: UNION ALL
SELECT prenom AS 'liste personne' FROM abonne 
UNION ALL
SELECT auteur FROM livre;
+-------------------+
| liste personne    |
+-------------------+
| Guillaume         |
| Benoit            |
| Chloe             |
| Laura             |
| Mathieu           |
| GUY DE MAUPASSANT |
| GUY DE MAUPASSANT |
| HONORE DE BALZAC  |
| ALPHONSE DAUDET   |
| ALEXANDRE DUMAS   |
| ALEXANDRE DUMAS   |
+-------------------+