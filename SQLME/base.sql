-- Commentaire en SQL
# Aussi commenteire en SQl

-- # Pur créer une BDD
CREATE DATABASE nom_de_la_BDD;
CREATE TABLE nom_de_la_table;


-- # Pour voir toutes les BDD présentes sur le serveur
SHOW DATABASES;


-- # Pour voir toutes les tables présentes sur la bdd
-- Attention au pluriel
SHOW TABLES;


-- Pour voir les incoherences de la BDD
SHOW WARNINGS;


-- Attention au pluriel
-- Pour se positionner sur une bdd afin de l'utiliser
USE nom_de_la_bdd;


-- Pour supprimer une BDD
DROP DATABASE nom_de_la_bdd;


-- #-----             table
DROP TABLE nom_de_la_table;


-- Pour vider une table sans la supprimer
TRUNCATE nom_de_la_table;

-- Pour voir la structure d'une table
DESC nom_de_la_table;

--  REQUETE DE SELECCION
-- Pour voir le contenu complet de la table, nous pouvons appeler tous les champs

SELECT id_employes, nom, prenom, sexe, service, date_embauche, salaire FROM employes;
-- Même chose avec *
SELECT * FROM employes;


-- Seulement les champs que nous interesent
SELECT nom, prenom FROM employes;

-- Exercise: Azffichez les services de la table employes
SELECT service FROM employes;


-- Affichez les differentes services, sans repetition
SELECT DISTINCT service FROM employes;

-- Les noms, prenoms, services uniquement des employes du service informatioue
SELECT nom, prenom, service, salaire FROM employes WHERE service='informatique';
MariaDB [entreprise]> SELECT nom, prenom, service, salaire FROM employes WHERE service='informatique';
+--------+---------+--------------+---------+
| nom    | prenom  | service      | salaire |
+--------+---------+--------------+---------+
| Vignal | Mathieu | informatique |    2000 |
| Durand | Damien  | informatique |    2250 |
| Chevel | Daniel  | informatique |    1700 |
+--------+---------+--------------+---------+
3 rows in set (0.00 sec)

-- WHERE => à la condition que

-- Affichage des employes ayant éte recruté entre le 1er janvier 2010 et aujourdhui
SELECT * FROM employes WHERE date_embauche BETWEEN "2010_01-01" and "2018-02-14";
SELECT CURDATE();
-- CURDATE est la date du jour
MariaDB [entreprise]> SELECT CURDATE();
+------------+
| CURDATE()  |
+------------+
| 2018-02-14 |
+------------+
1 row in set (0.00 sec)
SELECT * FROM employes WHERE date_embauche BETWEEN "2010_01-01" and CURDATE();
MariaDB [entreprise]> SELECT * FROM employes WHERE date_embauche BETWEEN "2010_01-01" and CURDATE();
+-------------+-----------+---------+------+---------------+---------------+---------+
| id_employes | prenom    | nom     | sexe | service       | date_embauche | salaire |
+-------------+-----------+---------+------+---------------+---------------+---------+
|         780 | Amandine  | Thoyer  | f    | communication | 2010-01-23    |    1500 |
|         802 | Damien    | Durand  | m    | informatique  | 2010-07-05    |    2250 |
|         854 | Daniel    | Chevel  | m    | informatique  | 2011-09-28    |    1700 |
|         876 | Nathalie  | Martin  | f    | juridique     | 2012-01-12    |    3200 |
|         900 | Benoit    | Lagarde | m    | production    | 2013-01-03    |    2550 |
|         933 | Emilie    | Sennard | f    | commercial    | 2014-09-11    |    1800 |
|         990 | Stephanie | Lafaye  | f    | assistant     | 2015-06-02    |    1775 |
+-------------+-----------+---------+------+---------------+---------------+---------+
7 rows in set (0.00 sec)

-- Utiliser des comparaisons
MariaDB [entreprise]> SELECT * FROM employes WHERE date_embauche>= "2010-10-01";
+-------------+-----------+---------+------+--------------+---------------+---------+
| id_employes | prenom    | nom     | sexe | service      | date_embauche | salaire |
+-------------+-----------+---------+------+--------------+---------------+---------+
|         854 | Daniel    | Chevel  | m    | informatique | 2011-09-28    |    1700 |
|         876 | Nathalie  | Martin  | f    | juridique    | 2012-01-12    |    3200 |
|         900 | Benoit    | Lagarde | m    | production   | 2013-01-03    |    2550 |
|         933 | Emilie    | Sennard | f    | commercial   | 2014-09-11    |    1800 |
|         990 | Stephanie | Lafaye  | f    | assistant    | 2015-06-02    |    1775 |
+-------------+-----------+---------+------+--------------+---------------+---------+
5 rows in set (0.00 sec)



-- LIKE
-- Afficher les employes ayant un nom commençant par s
SELECT nom, prenom, service FROM employes WHERE prenom LIKE "s%";
+--------+-----------+-----------+
| nom    | prenom    | service   |
+--------+-----------+-----------+
| Lafaye | Stephanie | assistant |
+--------+-----------+-----------+
1 row in set (0.00 sec)
-- Afficher les employes ayant un nom terminant par ie
SELECT nom, prenom, service FROM employes WHERE prenom LIKE "%ie";
MariaDB [entreprise]> SELECT nom, prenom, service FROM employes WHERE prenom LIKE "%ie";
+---------+-----------+-------------+
| nom     | prenom    | service     |
+---------+-----------+-------------+
| Fellier | Elodie    | secretariat |
| Collier | Melanie   | commercial  |
| Martin  | Nathalie  | juridique   |
| Sennard | Emilie    | commercial  |
| Lafaye  | Stephanie | assistant   |
+---------+-----------+-------------+
5 rows in set (0.00 sec)
-- Afficher les employes ayant un nom contenant ie n'importe ou dans la chaine
SELECT nom, prenom, service FROM employes WHERE prenom LIKE "%ie%";
MariaDB [entreprise]> SELECT nom, prenom, service FROM employes WHERE prenom LIKE "%ie%";
+---------+-------------+--------------+
| nom     | prenom      | service      |
+---------+-------------+--------------+
| Laborde | Jean-pierre | direction    |
| Fellier | Elodie      | secretariat  |
| Collier | Melanie     | commercial   |
| Cottet  | Julien      | secretariat  |
| Vignal  | Mathieu     | informatique |
| Desprez | Thierry     | secretariat  |
| Durand  | Damien      | informatique |
| Chevel  | Daniel      | informatique |
| Martin  | Nathalie    | juridique    |
| Sennard | Emilie      | commercial   |
| Lafaye  | Stephanie   | assistant    |
+---------+-------------+--------------+
11 rows in set (0.00 sec)


-- EXCLUSION


SELECT * FROM employes WHERE service !="informatique";

MariaDB [entreprise]> SELECT * FROM employes WHERE service !="informatique";
+-------------+-------------+----------+------+---------------+---------------+---------+
| id_employes | prenom      | nom      | sexe | service       | date_embauche | salaire |
+-------------+-------------+----------+------+---------------+---------------+---------+
|         350 | Jean-pierre | Laborde  | m    | direction     | 1999-12-09    |    5000 |
|         388 | Clement     | Gallet   | m    | commercial    | 2000-01-15    |    2300 |
|         415 | Thomas      | Winter   | m    | commercial    | 2000-05-03    |    3550 |
|         417 | Chloe       | Dubar    | f    | production    | 2001-09-05    |    1900 |
|         491 | Elodie      | Fellier  | f    | secretariat   | 2002-02-22    |    1600 |
|         509 | Fabrice     | Grand    | m    | comptabilite  | 2003-02-20    |    1900 |
|         547 | Melanie     | Collier  | f    | commercial    | 2004-09-08    |    3100 |
|         592 | Laura       | Blanchet | f    | direction     | 2005-06-09    |    4500 |
|         627 | Guillaume   | Miller   | m    | commercial    | 2006-07-02    |    1900 |
|         655 | Celine      | Perrin   | f    | commercial    | 2006-09-10    |    2700 |
|         699 | Julien      | Cottet   | m    | secretariat   | 2007-01-18    |    1390 |
|         739 | Thierry     | Desprez  | m    | secretariat   | 2009-11-17    |    1500 |
|         780 | Amandine    | Thoyer   | f    | communication | 2010-01-23    |    1500 |
|         876 | Nathalie    | Martin   | f    | juridique     | 2012-01-12    |    3200 |
|         900 | Benoit      | Lagarde  | m    | production    | 2013-01-03    |    2550 |
|         933 | Emilie      | Sennard  | f    | commercial    | 2014-09-11    |    1800 |
|         990 | Stephanie   | Lafaye   | f    | assistant     | 2015-06-02    |    1775 |
+-------------+-------------+----------+------+---------------+---------------+---------+
17 rows in set (0.00 sec)

-- OPERATEURS DE COMPARAISON
-- >
-- <
--
--
--
--
--





-- ORDER BY
-- Ordonne selon le prenom
SELECT prenom, nom, salaire FROM employes ORDER by prenom; 
-- ASC par défaut
SELECT prenom, nom, salaire FROM employes ORDER by prenom DESC; 
-- DESC => desc
SELECT prenom, nom, salaire FROM employes ORDER by salaire DESC;
MariaDB [entreprise]> SELECT prenom, nom, salaire FROM employes ORDER by salaire DESC;
+-------------+----------+---------+
| prenom      | nom      | salaire |
+-------------+----------+---------+
| Jean-pierre | Laborde  |    5000 |
| Laura       | Blanchet |    4500 |
| Thomas      | Winter   |    3550 |
| Nathalie    | Martin   |    3200 |
| Melanie     | Collier  |    3100 |
| Celine      | Perrin   |    2700 |
| Benoit      | Lagarde  |    2550 |
| Clement     | Gallet   |    2300 |
| Damien      | Durand   |    2250 |
| Mathieu     | Vignal   |    2000 |
| Fabrice     | Grand    |    1900 |
| Chloe       | Dubar    |    1900 |
| Guillaume   | Miller   |    1900 |
| Emilie      | Sennard  |    1800 |
| Stephanie   | Lafaye   |    1775 |
| Daniel      | Chevel   |    1700 |
| Elodie      | Fellier  |    1600 |
| Amandine    | Thoyer   |    1500 |
| Thierry     | Desprez  |    1500 |
| Julien      | Cottet   |    1390 |
+-------------+----------+---------+
20 rows in set (0.00 sec)

--Ordonné sélon le salaire et le prenom

SELECT prenom, nom, salaire FROM employes ORDER by salaire DESC, prenom ASC;
MariaDB [entreprise]> SELECT prenom, nom, salaire FROM employes ORDER by salaire DESC, prenom ASC;
+-------------+----------+---------+
| prenom      | nom      | salaire |
+-------------+----------+---------+
| Jean-pierre | Laborde  |    5000 |
| Laura       | Blanchet |    4500 |
| Thomas      | Winter   |    3550 |
| Nathalie    | Martin   |    3200 |
| Melanie     | Collier  |    3100 |
| Celine      | Perrin   |    2700 |
| Benoit      | Lagarde  |    2550 |
| Clement     | Gallet   |    2300 |
| Damien      | Durand   |    2250 |
| Mathieu     | Vignal   |    2000 |
| Chloe       | Dubar    |    1900 |
| Fabrice     | Grand    |    1900 |
| Guillaume   | Miller   |    1900 |
| Emilie      | Sennard  |    1800 |
| Stephanie   | Lafaye   |    1775 |
| Daniel      | Chevel   |    1700 |
| Elodie      | Fellier  |    1600 |
| Amandine    | Thoyer   |    1500 |
| Thierry     | Desprez  |    1500 |
| Julien      | Cottet   |    1390 |
+-------------+----------+---------+
20 rows in set (0.00 sec)

-- LIMIT

SELECT * FROM employes ORDER BY position de depart, nombre de lignes a recuperer,
SELECT * FROM employes ORDER BY nom LIMIT 0,3;
MariaDB [entreprise]> SELECT * FROM employes ORDER BY nom LIMIT 0,3;
+-------------+---------+----------+------+--------------+---------------+---------+
| id_employes | prenom  | nom      | sexe | service      | date_embauche | salaire |
+-------------+---------+----------+------+--------------+---------------+---------+
|         592 | Laura   | Blanchet | f    | direction    | 2005-06-09    |    4500 |
|         854 | Daniel  | Chevel   | m    | informatique | 2011-09-28    |    1700 |
|         547 | Melanie | Collier  | f    | commercial   | 2004-09-08    |    3100 |
+-------------+---------+----------+------+--------------+---------------+---------+
3 rows in set (0.00 sec)
SELECT * FROM employes ORDER BY nom LIMIT 3,6;
MariaDB [entreprise]> SELECT * FROM employes ORDER BY nom LIMIT 3,6;
+-------------+---------+---------+------+--------------+---------------+---------+
| id_employes | prenom  | nom     | sexe | service      | date_embauche | salaire |
+-------------+---------+---------+------+--------------+---------------+---------+
|         699 | Julien  | Cottet  | m    | secretariat  | 2007-01-18    |    1390 |
|         739 | Thierry | Desprez | m    | secretariat  | 2009-11-17    |    1500 |
|         417 | Chloe   | Dubar   | f    | production   | 2001-09-05    |    1900 |
|         802 | Damien  | Durand  | m    | informatique | 2010-07-05    |    2250 |
|         491 | Elodie  | Fellier | f    | secretariat  | 2002-02-22    |    1600 |
|         388 | Clement | Gallet  | m    | commercial   | 2000-01-15    |    2300 |
+-------------+---------+---------+------+--------------+---------------+---------+
6 rows in set (0.00 sec)
SELECT * FROM employes ORDER BY nom LIMIT 6,3;
MariaDB [entreprise]> SELECT * FROM employes ORDER BY nom LIMIT 6,3;
+-------------+---------+---------+------+--------------+---------------+---------+
| id_employes | prenom  | nom     | sexe | service      | date_embauche | salaire |
+-------------+---------+---------+------+--------------+---------------+---------+
|         802 | Damien  | Durand  | m    | informatique | 2010-07-05    |    2250 |
|         491 | Elodie  | Fellier | f    | secretariat  | 2002-02-22    |    1600 |
|         388 | Clement | Gallet  | m    | commercial   | 2000-01-15    |    2300 |
+-------------+---------+---------+------+--------------+---------------+---------+
3 rows in set (0.00 sec)

-- LIMIT permet de limiter le nombre des resultats. Le premier chiffre represente la position de depart, la deuxieme, le nombre de lignes à recuperer
-- Si on ne  fourni q'une seule valeur à LIMIT cette valeur represente le nombre des lignes à recuperer

-- Salaire annuel des employes
SELECT prenom, salaire*12 FROM employes;
SELECT prenom, salaire*12 AS 'Salaire Annuel' FROM employes;
MariaDB [entreprise]> SELECT prenom, salaire*12 AS 'Salaire Annuel' FROM employes;
+-------------+----------------+
| prenom      | Salaire Annuel |
+-------------+----------------+
| Jean-pierre |          60000 |
| Clement     |          27600 |
| Thomas      |          42600 |
| Chloe       |          22800 |
| Elodie      |          19200 |
| Fabrice     |          22800 |
| Melanie     |          37200 |
| Laura       |          54000 |
| Guillaume   |          22800 |
| Celine      |          32400 |
| Julien      |          16680 |
| Mathieu     |          24000 |
| Thierry     |          18000 |
| Amandine    |          18000 |
| Damien      |          27000 |
| Daniel      |          20400 |
| Nathalie    |          38400 |
| Benoit      |          30600 |
| Emilie      |          21600 |
| Stephanie   |          21300 |
+-------------+----------------+
20 rows in set (0.00 sec)




SELECT SUM(salaire*12) AS 'Masse Salariale' FROM employes;
MariaDB [entreprise]> SELECT SUM(salaire*12) AS 'Masse Salariale' FROM employes;
+-----------------+
| Masse Salariale |
+-----------------+
|          577380 |
+-----------------+
1 row in set (0.01 sec)
MariaDB [entreprise]> SELECT SUM(salaire) AS 'Masse Salariale' FROM employes;
+-----------------+
| Masse Salariale |
+-----------------+
|           48115 |
+-----------------+
1 row in set (0.00 sec)






SELECT AVG(salaire) AS 'Salaire Moyen' from employes;
MariaDB [entreprise]> SELECT AVG(salaire) AS 'Salaire Moyen' from employes;
+---------------+
| Salaire Moyen |
+---------------+
|     2405.7500 |
+---------------+
1 row in set (0.00 sec)
SELECT ROUND(AVG(salaire)) AS 'Salaire Moyen' from employes;
MariaDB [entreprise]> SELECT ROUND(AVG(salaire)) AS 'Salaire Moyen' from employes;
+---------------+
| Salaire Moyen |
+---------------+
|          2406 |
+---------------+
1 row in set (0.00 sec)
SELECT ROUND(AVG(salaire), 2) AS 'Salaire Moyen' from employes;







-- COUNT()


SELECT COUNT(*) AS 'Nobre des Femmes ' FROM employes WHERE sexe="f";
MariaDB [entreprise]> SELECT COUNT(*) AS 'Nobre des Femmes ' FROM employes WHERE sexe="f";
+-------------------+
| Nobre des Femmes  |
+-------------------+
|                 9 |
+-------------------+
1 row in set (0.00 sec)

-- COUNT permet de compter le nombre des lignes. Il est possible de mettre un COUNT() sur un champs specifique?. EXEMPLE: COUNT(service), mais si ce champ contient la valeur NULL, le COUNT n'en tiendra pas compte.

-- MIN & MAX

-- Affichage du salaire max de la table
SELECT MAX(salaire)FROM employes;

MariaDB [entreprise]> SELECT MAX(salaire)FROM employes;
+--------------+
| MAX(salaire) |
+--------------+
|         5000 |
+--------------+
1 row in set (0.01 sec)

SELECT prenom,MIN(salaire) FROM employes;-- incorrect
-- Pour avoir le salaire minimum=> Avec une requette imbriquee
SELECT prenom, salaire FROM employes WHERE salaire = (SELECT MIN(salaire) FROM employes);
-- Avec un ORDER=LIMIT
SELECT prenom, salaire FROM employes ORDER BY salaire LIMIT 0,1;

-- Une condition sur plusieurs valeurs

SELECT * FROM employes WHERE service IN ('informatique','comptabilite');
MariaDB [entreprise]> SELECT * FROM employes WHERE service IN ('informatique','comptabilite');
+-------------+---------+--------+------+--------------+---------------+---------+
| id_employes | prenom  | nom    | sexe | service      | date_embauche | salaire |
+-------------+---------+--------+------+--------------+---------------+---------+
|         509 | Fabrice | Grand  | m    | comptabilite | 2003-02-20    |    1900 |
|         701 | Mathieu | Vignal | m    | informatique | 2008-12-03    |    2000 |
|         802 | Damien  | Durand | m    | informatique | 2010-07-05    |    2250 |
|         854 | Daniel  | Chevel | m    | informatique | 2011-09-28    |    1700 |
+-------------+---------+--------+------+--------------+---------------+---------+
4 rows in set (0.00 sec)

SELECT * FROM employes WHERE service ='informatique' OR service ='comptabilite';
MariaDB [entreprise]> SELECT * FROM employes WHERE service ='informatique' OR service ='comptabilite';
+-------------+---------+--------+------+--------------+---------------+---------+
| id_employes | prenom  | nom    | sexe | service      | date_embauche | salaire |
+-------------+---------+--------+------+--------------+---------------+---------+
|         509 | Fabrice | Grand  | m    | comptabilite | 2003-02-20    |    1900 |
|         701 | Mathieu | Vignal | m    | informatique | 2008-12-03    |    2000 |
|         802 | Damien  | Durand | m    | informatique | 2010-07-05    |    2250 |
|         854 | Daniel  | Chevel | m    | informatique | 2011-09-28    |    1700 |
+-------------+---------+--------+------+--------------+---------------+---------+
4 rows in set (0.00 sec)

-- L'inverse

SELECT * FROM employes WHERE service NOT IN ('informatique','comptabilite');
MariaDB [entreprise]> SELECT * FROM employes WHERE service NOT IN ('informatique','comptabilite');
+-------------+-------------+----------+------+---------------+---------------+---------+
| id_employes | prenom      | nom      | sexe | service       | date_embauche | salaire |
+-------------+-------------+----------+------+---------------+---------------+---------+
|         350 | Jean-pierre | Laborde  | m    | direction     | 1999-12-09    |    5000 |
|         388 | Clement     | Gallet   | m    | commercial    | 2000-01-15    |    2300 |
|         415 | Thomas      | Winter   | m    | commercial    | 2000-05-03    |    3550 |
|         417 | Chloe       | Dubar    | f    | production    | 2001-09-05    |    1900 |
|         491 | Elodie      | Fellier  | f    | secretariat   | 2002-02-22    |    1600 |
|         547 | Melanie     | Collier  | f    | commercial    | 2004-09-08    |    3100 |
|         592 | Laura       | Blanchet | f    | direction     | 2005-06-09    |    4500 |
|         627 | Guillaume   | Miller   | m    | commercial    | 2006-07-02    |    1900 |
|         655 | Celine      | Perrin   | f    | commercial    | 2006-09-10    |    2700 |
|         699 | Julien      | Cottet   | m    | secretariat   | 2007-01-18    |    1390 |
|         739 | Thierry     | Desprez  | m    | secretariat   | 2009-11-17    |    1500 |
|         780 | Amandine    | Thoyer   | f    | communication | 2010-01-23    |    1500 |
|         876 | Nathalie    | Martin   | f    | juridique     | 2012-01-12    |    3200 |
|         900 | Benoit      | Lagarde  | m    | production    | 2013-01-03    |    2550 |
|         933 | Emilie      | Sennard  | f    | commercial    | 2014-09-11    |    1800 |
|         990 | Stephanie   | Lafaye   | f    | assistant     | 2015-06-02    |    1775 |
+-------------+-------------+----------+------+---------------+---------------+---------+
16 rows in set (0.00 sec)




-- AND


SELECT nom, prenom, service, salaire FROM employes WHERE service='commercial' AND salaire <=2000; 
MariaDB [entreprise]> SELECT nom, prenom, service, salaire FROM employes WHERE service='commercial' AND salaire <=2000;
+---------+-----------+------------+---------+
| nom     | prenom    | service    | salaire |
+---------+-----------+------------+---------+
| Miller  | Guillaume | commercial |    1900 |
| Sennard | Emilie    | commercial |    1800 |
+---------+-----------+------------+---------+
2 rows in set (0.00 sec)




-- OR


SELECT * FROM employes WHERE service ='production' AND(salaire = 1900 OR salaire = 2300);
MariaDB [entreprise]> SELECT * FROM employes WHERE service ='production' AND(salaire = 1900 OR salaire = 2300);
+-------------+--------+-------+------+------------+---------------+---------+
| id_employes | prenom | nom   | sexe | service    | date_embauche | salaire |
+-------------+--------+-------+------+------------+---------------+---------+
|         417 | Chloe  | Dubar | f    | production | 2001-09-05    |    1900 |
+-------------+--------+-------+------+------------+---------------+---------+
1 row in set (0.00 sec)



SELECT * FROM employes WHERE service ='informatique' OR service='comptabilite';

MariaDB [entreprise]> SELECT * FROM employes WHERE service ='informatique' OR service='comptabilite';
+-------------+---------+--------+------+--------------+---------------+---------+
| id_employes | prenom  | nom    | sexe | service      | date_embauche | salaire |
+-------------+---------+--------+------+--------------+---------------+---------+
|         509 | Fabrice | Grand  | m    | comptabilite | 2003-02-20    |    1900 |
|         701 | Mathieu | Vignal | m    | informatique | 2008-12-03    |    2000 |
|         802 | Damien  | Durand | m    | informatique | 2010-07-05    |    2250 |
|         854 | Daniel  | Chevel | m    | informatique | 2011-09-28    |    1700 |
+-------------+---------+--------+------+--------------+---------------+---------+
4 rows in set (0.00 sec)




-- GROUP BY

SELECT service, COUNT(*)AS 'nombre d\'employes' from employes;
MariaDB [entreprise]> SELECT service, COUNT(*)AS 'nombre d\'employes' from employes;
+-----------+-------------------+
| service   | nombre d'employes |
+-----------+-------------------+
| direction |                20 |
+-----------+-------------------+
1 row in set (0.00 sec)


-- erronne

SELECT service, COUNT(*)AS 'nombre d\'employes' from employes GROUP BY service;
MariaDB [entreprise]> SELECT service, COUNT(*)AS 'nombre d\'employes' from employes GROUP BY service;
+---------------+-------------------+
| service       | nombre d'employes |
+---------------+-------------------+
| assistant     |                 1 |
| commercial    |                 6 |
| communication |                 1 |
| comptabilite  |                 1 |
| direction     |                 2 |
| informatique  |                 3 |
| juridique     |                 1 |
| production    |                 2 |
| secretariat   |                 3 |
+---------------+-------------------+
9 rows in set (0.00 sec)


########################################################################################################


----------------------------  REQUETTE D'ENREGISTREMENT  -------------------------------

INSERT INTO employes (id_employes, nom, prenom, sexe, service, salaire, date_embauche) VALUES (991, 'Rosu','Andrei','m','informatique','6000', CURDATE());

MariaDB [entreprise]> INSERT INTO employes (id_employes, nom, prenom, sexe, service, salaire, date_embauche) VALUES (991, 'Rosu','Andrei','m','informatique','6000', CURDATE());
Query OK, 1 row affected (0.01 sec)
MariaDB [entreprise]> SELECT * FROM employes;
+-------------+-------------+----------+------+---------------+---------------+---------+
| id_employes | prenom      | nom      | sexe | service       | date_embauche | salaire |
+-------------+-------------+----------+------+---------------+---------------+---------+
|         350 | Jean-pierre | Laborde  | m    | direction     | 1999-12-09    |    5000 |
|         388 | Clement     | Gallet   | m    | commercial    | 2000-01-15    |    2300 |
|         415 | Thomas      | Winter   | m    | commercial    | 2000-05-03    |    3550 |
|         417 | Chloe       | Dubar    | f    | production    | 2001-09-05    |    1900 |
|         491 | Elodie      | Fellier  | f    | secretariat   | 2002-02-22    |    1600 |
|         509 | Fabrice     | Grand    | m    | comptabilite  | 2003-02-20    |    1900 |
|         547 | Melanie     | Collier  | f    | commercial    | 2004-09-08    |    3100 |
|         592 | Laura       | Blanchet | f    | direction     | 2005-06-09    |    4500 |
|         627 | Guillaume   | Miller   | m    | commercial    | 2006-07-02    |    1900 |
|         655 | Celine      | Perrin   | f    | commercial    | 2006-09-10    |    2700 |
|         699 | Julien      | Cottet   | m    | secretariat   | 2007-01-18    |    1390 |
|         701 | Mathieu     | Vignal   | m    | informatique  | 2008-12-03    |    2000 |
|         739 | Thierry     | Desprez  | m    | secretariat   | 2009-11-17    |    1500 |
|         780 | Amandine    | Thoyer   | f    | communication | 2010-01-23    |    1500 |
|         802 | Damien      | Durand   | m    | informatique  | 2010-07-05    |    2250 |
|         854 | Daniel      | Chevel   | m    | informatique  | 2011-09-28    |    1700 |
|         876 | Nathalie    | Martin   | f    | juridique     | 2012-01-12    |    3200 |
|         900 | Benoit      | Lagarde  | m    | production    | 2013-01-03    |    2550 |
|         933 | Emilie      | Sennard  | f    | commercial    | 2014-09-11    |    1800 |
|         990 | Stephanie   | Lafaye   | f    | assistant     | 2015-06-02    |    1775 |
|         991 | Andrei      | Rosu     | m    | informatique  | 2018-02-14    |    6000 |
+-------------+-------------+----------+------+---------------+---------------+---------+
21 rows in set (0.00 sec)

INSERT INTO employes VALUES (NULL, 'Mathieu','Quittard','m');

MariaDB [entreprise]> 
INSERT INTO employes (NULL, 'Mathieu','Quittard','m');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'NULL, 'Mathieu','Quittard','m')' at line 1

MariaDB [entreprise]>
INSERT INTO employes VALUES (NULL, 'Mathieu','Quittard','m');
ERROR 1136 (21S01): Column count doesn't match value count at row 1'

INSERT INTO employes (nom,prenom) VALUES ("test","test");

MariaDB [entreprise]> SELECT * FROM employes;
+-------------+-------------+----------+------+---------------+---------------+---------+
| id_employes | prenom      | nom      | sexe | service       | date_embauche | salaire |
+-------------+-------------+----------+------+---------------+---------------+---------+
|         350 | Jean-pierre | Laborde  | m    | direction     | 1999-12-09    |    5000 |
|         388 | Clement     | Gallet   | m    | commercial    | 2000-01-15    |    2300 |
|         415 | Thomas      | Winter   | m    | commercial    | 2000-05-03    |    3550 |
|         417 | Chloe       | Dubar    | f    | production    | 2001-09-05    |    1900 |
|         491 | Elodie      | Fellier  | f    | secretariat   | 2002-02-22    |    1600 |
|         509 | Fabrice     | Grand    | m    | comptabilite  | 2003-02-20    |    1900 |
|         547 | Melanie     | Collier  | f    | commercial    | 2004-09-08    |    3100 |
|         592 | Laura       | Blanchet | f    | direction     | 2005-06-09    |    4500 |
|         627 | Guillaume   | Miller   | m    | commercial    | 2006-07-02    |    1900 |
|         655 | Celine      | Perrin   | f    | commercial    | 2006-09-10    |    2700 |
|         699 | Julien      | Cottet   | m    | secretariat   | 2007-01-18    |    1390 |
|         701 | Mathieu     | Vignal   | m    | informatique  | 2008-12-03    |    2000 |
|         739 | Thierry     | Desprez  | m    | secretariat   | 2009-11-17    |    1500 |
|         780 | Amandine    | Thoyer   | f    | communication | 2010-01-23    |    1500 |
|         802 | Damien      | Durand   | m    | informatique  | 2010-07-05    |    2250 |
|         854 | Daniel      | Chevel   | m    | informatique  | 2011-09-28    |    1700 |
|         876 | Nathalie    | Martin   | f    | juridique     | 2012-01-12    |    3200 |
|         900 | Benoit      | Lagarde  | m    | production    | 2013-01-03    |    2550 |
|         933 | Emilie      | Sennard  | f    | commercial    | 2014-09-11    |    1800 |
|         990 | Stephanie   | Lafaye   | f    | assistant     | 2015-06-02    |    1775 |
|         991 | Andrei      | Rosu     | m    | informatique  | 2018-02-14    |    6000 |
|         992 | test        | test     | m    |               | 0000-00-00    |       0 |
+-------------+-------------+----------+------+---------------+---------------+---------+
22 rows in set (0.00 sec)



########################################################################################################


----------------------------  REQUETTE DE MODIFICATION -------------------------------



SELECT * FROM employes;
UPDATE employes SET salaire =1395, nom ='Cotte' WHERE id_employes = 699;

SELECT * FROM employes;
MariaDB [entreprise]> UPDATE employes SET salaire =1395, nom ='Cotte' WHERE id_employes = 699;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [entreprise]>
MariaDB [entreprise]> SELECT * FROM employes;
+-------------+-------------+----------+------+---------------+---------------+---------+
| id_employes | prenom      | nom      | sexe | service       | date_embauche | salaire |
+-------------+-------------+----------+------+---------------+---------------+---------+
|         350 | Jean-pierre | Laborde  | m    | direction     | 1999-12-09    |    5000 |
|         388 | Clement     | Gallet   | m    | commercial    | 2000-01-15    |    2300 |
|         415 | Thomas      | Winter   | m    | commercial    | 2000-05-03    |    3550 |
|         417 | Chloe       | Dubar    | f    | production    | 2001-09-05    |    1900 |
|         491 | Elodie      | Fellier  | f    | secretariat   | 2002-02-22    |    1600 |
|         509 | Fabrice     | Grand    | m    | comptabilite  | 2003-02-20    |    1900 |
|         547 | Melanie     | Collier  | f    | commercial    | 2004-09-08    |    3100 |
|         592 | Laura       | Blanchet | f    | direction     | 2005-06-09    |    4500 |
|         627 | Guillaume   | Miller   | m    | commercial    | 2006-07-02    |    1900 |
|         655 | Celine      | Perrin   | f    | commercial    | 2006-09-10    |    2700 |
|         699 | Julien      | Cotte    | m    | secretariat   | 2007-01-18    |    1395 |
|         701 | Mathieu     | Vignal   | m    | informatique  | 2008-12-03    |    2000 |
|         739 | Thierry     | Desprez  | m    | secretariat   | 2009-11-17    |    1500 |
|         780 | Amandine    | Thoyer   | f    | communication | 2010-01-23    |    1500 |
|         802 | Damien      | Durand   | m    | informatique  | 2010-07-05    |    2250 |
|         854 | Daniel      | Chevel   | m    | informatique  | 2011-09-28    |    1700 |
|         876 | Nathalie    | Martin   | f    | juridique     | 2012-01-12    |    3200 |
|         900 | Benoit      | Lagarde  | m    | production    | 2013-01-03    |    2550 |
|         933 | Emilie      | Sennard  | f    | commercial    | 2014-09-11    |    1800 |
|         990 | Stephanie   | Lafaye   | f    | assistant     | 2015-06-02    |    1775 |
|         991 | Andrei      | Rosu     | m    | informatique  | 2018-02-14    |    6000 |
|         992 | test        | test     | m    |               | 0000-00-00    |       0 |
+-------------+-------------+----------+------+---------------+---------------+---------+
22 rows in set (0.00 sec)


########################################################################################################


----------------------------  REQUETTE DE SUPPRESSION -------------------------------


SELECT * FROM employes;
DELETE FROM employes WHERE nom LIKE 'Laborde';
SELECT * FROM employes;
MariaDB [entreprise]> SELECT * FROM employes;
+-------------+-----------+----------+------+---------------+---------------+---------+
| id_employes | prenom    | nom      | sexe | service       | date_embauche | salaire |
+-------------+-----------+----------+------+---------------+---------------+---------+
|         388 | Clement   | Gallet   | m    | commercial    | 2000-01-15    |    2300 |
|         415 | Thomas    | Winter   | m    | commercial    | 2000-05-03    |    3550 |
|         417 | Chloe     | Dubar    | f    | production    | 2001-09-05    |    1900 |
|         491 | Elodie    | Fellier  | f    | secretariat   | 2002-02-22    |    1600 |
|         509 | Fabrice   | Grand    | m    | comptabilite  | 2003-02-20    |    1900 |
|         547 | Melanie   | Collier  | f    | commercial    | 2004-09-08    |    3100 |
|         592 | Laura     | Blanchet | f    | direction     | 2005-06-09    |    4500 |
|         627 | Guillaume | Miller   | m    | commercial    | 2006-07-02    |    1900 |
|         655 | Celine    | Perrin   | f    | commercial    | 2006-09-10    |    2700 |
|         699 | Julien    | Cotte    | m    | secretariat   | 2007-01-18    |    1395 |
|         701 | Mathieu   | Vignal   | m    | informatique  | 2008-12-03    |    2000 |
|         739 | Thierry   | Desprez  | m    | secretariat   | 2009-11-17    |    1500 |
|         780 | Amandine  | Thoyer   | f    | communication | 2010-01-23    |    1500 |
|         802 | Damien    | Durand   | m    | informatique  | 2010-07-05    |    2250 |
|         854 | Daniel    | Chevel   | m    | informatique  | 2011-09-28    |    1700 |
|         876 | Nathalie  | Martin   | f    | juridique     | 2012-01-12    |    3200 |
|         900 | Benoit    | Lagarde  | m    | production    | 2013-01-03    |    2550 |
|         933 | Emilie    | Sennard  | f    | commercial    | 2014-09-11    |    1800 |
|         990 | Stephanie | Lafaye   | f    | assistant     | 2015-06-02    |    1775 |
|         991 | Andrei    | Rosu     | m    | informatique  | 2018-02-14    |    6000 |
|         992 | test      | test     | m    |               | 0000-00-00    |       0 |
+-------------+-----------+----------+------+---------------+---------------+---------+
21 rows in set (0.00 sec)


DELETE FROM employes;




########################################################################################################
--# EXERCICES:
--# 1 - Afficher la profession de l'employé 547
--# 2 - Afficher la date d'embauche d'Amandine
--# 3 - Afficher le nom de famille de Guillaume
--# 4 - Afficher le nombre de personnes ayant un id commençant par le chiffre 5
--# 5 - Afficher le nombre de commerciaux
--# 6 - Afficher le salaire moyen des informaticiens
--# 7 - Afficher les 5 premiers employés après avoir classé leur nom par ordre alphabétique
--# 8 - Afficher le coût des commerciaux sur une année
--# 9 - Afficher le salaire moyen par service
--# 10 - Afficher le nombre de recrutement sur l'année 2010 avec un alias (AS)
--# 11 - Afficher le salaire moyen des employes ayant été recrutés sur la période de 2005 à 2007 inclu
--# 12 - Afficher le nombre de différent service
--# 13 - Afficher tous les employés sauf ceux des services production et secrétariat
--# 14 - Afficher conjointement le nombre de femme et le nombre d'homme
--# 15 - Qui a été embauché en dernier 
--# 16 - Afficher les informations de l'employé du service commercial ayant le salaire le plus élevé.
--# 17 - Afficher le prenom du comptable ayant le salaire le plus élevé
--# 18 - Afficher les commerciaux ayant été recrut" avant 205 de sexe masculin et gagnant un salaire supérieur à 2500
--# 19 - Afficher le prenom de l'informaticien ayant été recruté en premier
--# 20 - Augmenter chaque employé de 100€
SELECT service FROM employes WHERE =547;
SELECT date_embauche FROM employes WHERE prenom='Amandine';
SELECT nom FROM employes WHERE prenom='Guillaume';
SELECT COUNT(*) AS 'Employaux avec Id commençant par 5'FROM employes WHERE id_employes LIKE "5%";
SELECT COUNT(*) AS 'Commerciaux' FROM employes WHERE service='commercial';
SELECT AVG(salaire) AS 'Salaire Moyen' from employes WHERE service='informatique';
SELECT * FROM employes ORDER BY nom LIMIT 0,5;
SELECT SUM(salaire*12) AS 'Cout commerciaux' FROM employes WHERE service='commercial' ;
SELECT service,AVG(salaire) FROM employes GROUP BY service ORDER BY salaire;
SELECT COUNT(*) AS 'Embauches en 2010' FROM employes WHERE date_embauche LIKE "%2010%";
--# 11 - Afficher le salaire moyen des employes ayant été recrutés sur la période de 2005 à 2007 inclu

SELECT AVG(salaire) AS 'Salaire Moyen embauches 2007-2010' from employes WHERE date_embauche BETWEEN "2007-01-01" AND "2010-01-01";

--# 12 - Afficher le nombre de différent service



SELECT COUNT(DISTINCT service) AS 'Services' FROM employes;

--# 13 - Afficher tous les employés sauf ceux des services production et secrétariat

SELECT * FROM employes WHERE service !="production" AND service !="secretariat";

--# 14 - Afficher conjointement le nombre de femme et le nombre d'homme

SELECT sexe,COUNT(*)FROM employes WHERE sexe="f" OR sexe="m" GROUP BY sexe;
--# 15 - Qui a été embauché en dernier
SELECT * FROM employes ORDER by date_embauche DESC LIMIT 0,1;

--# 16 - Afficher les informations de l'employé du service commercial ayant le salaire le plus élevé.

SELECT * FROM employes WHERE service="commercial" ORDER by salaire desc LIMIT 0,5;

--# 17 - Afficher le prenom du comptable ayant le salaire le plus élevé

SELECT * FROM employes WHERE service="comptabilite" ORDER by salaire desc LIMIT 0,1;

--# 18 - Afficher les commerciaux ayant été recrut" avant 205 de sexe masculin et gagnant un salaire supérieur à 2500

SELECT * FROM employes WHERE service ="commercial" AND date_embauche < "2005-01-01" AND sexe="m" AND salaire >2500;















