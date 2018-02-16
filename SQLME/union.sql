
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








-- ############################### CONCATENATION###################################--



SELECT CONCAT("a","b","c","d")
SELECT CONCAT_WS( '-', auteur, titre) AS 'Les livres' FROM livre;
MariaDB [bibliotheque]> SELECT CONCAT_WS( '-', auteur, titre) AS 'Les livres' FROM livre;
ERROR 2006 (HY000): MySQL server has gone away
No connection. Trying to reconnect...
Connection id:    1736
Current database: bibliotheque

+-----------------------------------------+
| Les livres                              |
+-----------------------------------------+
| GUY DE MAUPASSANT-Une vie               |
| GUY DE MAUPASSANT-Bel-Ami               |
| HONORE DE BALZAC-Le p?re Goriot         |
| ALPHONSE DAUDET-Le Petit chose          |
| ALEXANDRE DUMAS-La Reine Margot         |
| ALEXANDRE DUMAS-Les Trois Mousquetaires |
+-----------------------------------------+
6 rows in set (0.01 sec)

--################################################################################################

SELECT LENGTH("ABC"); ---  Permet de compter le nombre de charactères dans une chaine
MariaDB [bibliotheque]> SELECT LENGTH("ABC");
+---------------+
| LENGTH("ABC") |
+---------------+
|             3 |
+---------------+
1 row in set (0.00 sec)

--####################################################################################################


SELECT UPPER("bonjour");


MariaDB [bibliotheque]> SELECT UPPER("bonjour");
+------------------+
| UPPER("bonjour") |
+------------------+
| BONJOUR          |
+------------------+
1 row in set (0.01 sec)


SELECT LOWER("BONJOUR");


+------------------+
| LOWER("BONJOUR") |
+------------------+
| bonjour          |
+------------------+
1 row in set (0.00 sec)


SELECT TRIM("     Bonjour a tous          ");


MariaDB [bibliotheque]> SELECT TRIM("     Bonjour a tous          ");
+---------------------------------------+
| TRIM("     Bonjour a tous          ") |
+---------------------------------------+
| Bonjour a tous                        |
+---------------------------------------+
1 row in set (0.00 sec)





