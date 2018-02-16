--# https://dev.mysql.com/doc/refman/5.5/en/functions.html

--# FONCTIONS PREDEFINIES 
--# Inscrite dans le langage, le développeur ne fait que l'exécuter.
SELECT DATABASE(); --# la BDD actuellement utilisée
SELECT VERSION(); --# affiche la version mysql

USE bibliotheque;
INSERT INTO abonne (prenom) VALUES ('test');
SELECT LAST_INSERT_ID(); -- # le dernier id inséré(clé primaire) 

--# DATE_ADD ou ADDDATE (pour les jours ADDDATE) afin de rajouter une intervale et d'obtenir la date correspondante.
SELECT DATE_ADD('2018-02-15', INTERVAL 31 DAY); --# rajoute une intervale
SELECT DATE_ADD(CURDATE(), INTERVAL 31 YEAR);
SELECT DATE_ADD(CURDATE(), INTERVAL 10 MONTH);
SELECT DATE_ADD(CURDATE(), INTERVAL -31 WEEK); --# on enlève
--#
SELECT ADDDATE(CURDATE(), 31); --# rajoute des jours

SELECT CURDATE(); --# la date du jour
SELECT CURTIME(); --# l'heure au format HH:MM:SS
SELECT NOW(); --# Affiche et la date et l'heure
+---------------------+
| NOW()               |
+---------------------+
| 2018-02-15 17:01:34 |
+---------------------+

--# Formatage des dates:
--# DATE_FORMAT() prend 2 arguments: 1er: la date concernée, 2ème le format souhaité
SELECT date_format('2018-02-15 17:07:40', '%d/%m/%Y à %H:%i:%s');
SELECT date_format(CURTIME(), '%H:%i:%s');
SELECT DATE_FORMAT(date_sortie, '%d/%m/%Y') AS 'Date fr' FROM emprunt;

SELECT date_format("2018-02-16 11:26:10", "%Hh %imin %ss");
+-----------------------------------------------------+
| date_format("2018-02-16 11:26:10", "%Hh %imin %ss") |
+-----------------------------------------------------+
| 11h 26min 10s                                       |
+-----------------------------------------------------+
1 row in set (0.00 sec)

SELECT CONCAT( date_format("2018-02-16 11:26:10", "%H"), "h");
+--------------------------------------------------------+
| CONCAT( date_format("2018-02-16 11:26:10", "%H"), "h") |
+--------------------------------------------------------+
| 11h                                                    |
+--------------------------------------------------------+

--# %d est un token (jeton de remplacement) permettant d'afficher l'information correspondante lors de l'exécution de la fonction.
--# %Y en majuscule pour avoir l'année en 4 chiffres
--# %H en majuscule pour avoir l'heure sur 24 (%h pour l'avoir sur 12)

SELECT DAYNAME('2018-02-15'); --# le nom du jour correspondant

--#
SELECT PASSWORD("mon mot de passe");
+-------------------------------------------+
| PASSWORD("mon mot de passe")              |
+-------------------------------------------+
| *DA793D3BC059685BB32D33B01DF458DD43CBE127 |
+-------------------------------------------+

--# 
SELECT 1+1;
SELECT 325435*35738;
+--------------+
| 325435*35738 |
+--------------+
|  11630396030 |
+--------------+

--# Concaténation
SELECT CONCAT("a", "b", "c");
+-----------------------+
| CONCAT("a", "b", "c") |
+-----------------------+
| abc                   |
+-----------------------+
SELECT CONCAT_WS(" - ", "a", "b", "c"); --# CONCAT_WS() = contaténation With Separator
--" Avec CONCAT_WS() le premier argument (ici " - ") est le séparateur.
+---------------------------------+
| CONCAT_WS(" - ", "a", "b", "c") |
+---------------------------------+
| a - b - c                       |
+---------------------------------+
SELECT CONCAT_WS(' - ', auteur, titre) AS 'les livres' FROM livre;
+-------------------------------------------+
| les livres                                |
+-------------------------------------------+
| GUY DE MAUPASSANT - Une vie               |
| GUY DE MAUPASSANT - Bel-Ami               |
| HONORE DE BALZAC - Le père Goriot         |
| ALPHONSE DAUDET - Le Petit chose          |
| ALEXANDRE DUMAS - La Reine Margot         |
| ALEXANDRE DUMAS - Les Trois Mousquetaires |
+-------------------------------------------+

--#
SELECT LENGTH("abcé"); --# permet de compter le nombre de caractères dans la chaine fournie en argument.

--# 
SELECT UPPER("bonjour"); --# inverse LOWER()
+------------------+
| UPPER("bonjour") |
+------------------+
| BONJOUR          |
+------------------+

--# 
SELECT TRIM("     Bonjour à tous              ");
+-------------------------------------------+
| TRIM("     Bonjour à tous              ") |
+-------------------------------------------+
| Bonjour à tous                            |
+-------------------------------------------+















