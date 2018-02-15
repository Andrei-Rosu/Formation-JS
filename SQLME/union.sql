
USE bibliotheque;
SELECT prenom AS 'Liste personnes' FROM abonne UNION SELECT auteur FROM livre;
MariaDB [bibliotheque]> SELECT prenom AS 'Liste personnes' FROM abonne UNION SELECT auteur FROM livre;
+-------------------+
| Liste personnes   |
+-------------------+
| Guillaume         |
| Benoit            |
| Chloe             |
| Laura             |
| ANDREI            |
| GUY DE MAUPASSANT |
| HONORE DE BALZAC  |
| ALPHONSE DAUDET   |
| ALEXANDRE DUMAS   |
+-------------------+
9 rows in set (0.00 sec)

--Union fait un DISTINCT par defaut
-- Pour avoir toutes les informations: UNION ALL
SELECT prenom AS 'Liste personnes' FROM abonne UNION ALL SELECT auteur FROM livre;
MariaDB [bibliotheque]> SELECT prenom AS 'Liste personnes' FROM abonne UNION ALL SELECT auteur FROM livre;
+-------------------+
| Liste personnes   |
+-------------------+
| Guillaume         |
| Benoit            |
| Chloe             |
| Laura             |
| ANDREI            |
| GUY DE MAUPASSANT |
| GUY DE MAUPASSANT |
| HONORE DE BALZAC  |
| ALPHONSE DAUDET   |
| ALEXANDRE DUMAS   |
| ALEXANDRE DUMAS   |
+-------------------+
11 rows in set (0.01 sec)
