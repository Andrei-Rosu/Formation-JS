


-- FONCTIONS PREDEFINIES------
-- Inscrite dans le langage, le développeu ne fait que l'executer.


SELECT DATABASE();-- Affiche le nom de la BDD actuelle



MariaDB [bibliotheque]> SELECT DATABASE();
+--------------+
| DATABASE()   |
+--------------+
| bibliotheque |
+--------------+
1 row in set (0.00 sec)


SELECT VERSION(); --Affiche  la version mySQL
MariaDB [bibliotheque]> SELECT VERSION();



+-----------------+
| VERSION()       |
+-----------------+
| 10.1.26-MariaDB |
+-----------------+
1 row in set (0.00 sec)


USE bibliotheque;
INSERT INTO abonne(prenom) VALUES ('test');



SELECT LAST_INSERT_ID(); -- Le dernier id inséré



MariaDB [bibliotheque]> SELECT LAST_INSERT_ID(); -- Le dernier id inséré
+------------------+
| LAST_INSERT_ID() |
+------------------+
|                6 |
+------------------+
1 row in set (0.01 sec)

MariaDB [bibliotheque]> select * from abonne;
+-----------+-----------+
| id_abonne | prenom    |
+-----------+-----------+
|         1 | Guillaume |
|         2 | Benoit    |
|         3 | Chloe     |
|         4 | Laura     |
|         5 | ANDREI    |
|         6 | test      |
+-----------+-----------+
6 rows in set (0.00 sec)




SELECT DATE_ADD('2018-02-15', INTERVAL 31 DAY);-----------    Rajoute un interval



MariaDB [bibliotheque]> SELECT DATE_ADD('2018-02-15', INTERVAL 31 DAY);
SELECT DATE_ADD(CURDATE(), INTERVAL 31 YEAR);
MariaDB [bibliotheque]> SELECT DATE_ADD(CURDATE(), INTERVAL 31 YEAR);
+---------------------------------------+
| DATE_ADD(CURDATE(), INTERVAL 31 YEAR) |
+---------------------------------------+
| 2049-02-15                            |
+---------------------------------------+
1 row in set (0.00 sec)
+-----------------------------------------+
| DATE_ADD('2018-02-15', INTERVAL 31 DAY) |
+-----------------------------------------+
| 2018-03-18                              |
+-----------------------------------------+
1 row in set (0.01 sec)


-- DATE_ADD ou ADDDATE (pour les jours ADDATE) afin de rajouter une intervale et d'obtenir la date correspondante


SELECT ADDDATE(CURDATE(),31);----------------------  Rajoute des jours



MariaDB [bibliotheque]> SELECT ADDDATE(CURDATE(),31);
+-----------------------+
| ADDDATE(CURDATE(),31) |
+-----------------------+
| 2018-03-18            |
+-----------------------+
1 row in set (0.00 sec)

SELECT DATE_ADD(CURDATE(), INTERVAL -31 YEAR);------------   On enlève

MariaDB [bibliotheque]> SELECT DATE_ADD(CURDATE(), INTERVAL -31 YEAR);
+----------------------------------------+
| DATE_ADD(CURDATE(), INTERVAL -31 YEAR) |
+----------------------------------------+
| 1987-02-15                             |
+----------------------------------------+
1 row in set (0.00 sec)

SELECT


