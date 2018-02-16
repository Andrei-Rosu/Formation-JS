-- commentaire SQL
# commentaire SQL

--# Pour créer une BDD
CREATE DATABASE nom_de_la_bdd;
CREATE SCHEMA nom_de_la_bdd;
CREATE TABLE nom_de_la_table;

--# Pour voir toutes les BDD présentent sur le serveur
SHOW DATABASES;
--# TABLE
SHOW TABLES;
--# WARNING
SHOW WARNINGS;

--# Pour se positionner sur une BDD afin de l'utiliser
USE nom_de_la_bdd;

--# pour supprimer une BDD
DROP DATABASE nom_de_la_bdd;
--# TABLE
DROP TABLE nom_de_la_table;

--# Pour vider une table sans la supprimer
TRUNCATE nom_de_la_table;

--# Pour voir la structure d'une table
DESC nom_de_la_table;

--# REQUETE DE SELECTION (question)
--# pour voir le contenu complet de la table, nous pouvons appeler tous les champs
SELECT id_employes, nom, prenom, sexe, service, date_embauche, salaire FROM employes;
--# même chose avec *
SELECT * FROM employes;

--# affichage des noms et prénoms uniquement
SELECT nom, prenom FROM employes;

--# EXERCICE: affichez les services de la table employes.
SELECT service FROM employes;

--# Affichez les différents services !
SELECT DISTINCT service FROM employes;

--# les noms, prénoms, services uniquement des employes du service informatique.
SELECT nom, prenom, service FROM employes WHERE service='informatique';

--# WHERE -> à la condition que

--# Affichage des employés ayant été recruté entre le 1er janvier 2010 et aujourd'hui
SELECT * FROM employes WHERE date_embauche BETWEEN "2010-01-01" AND '2018-02-14';

SELECT CURDATE(); --# affiche la date du jour
+------------+
| CURDATE()  |
+------------+
| 2018-02-14 |
+------------+
SELECT * FROM employes WHERE date_embauche BETWEEN "2010-01-01" AND CURDATE();
SELECT * FROM employes WHERE date_embauche >= "2010-01-01";

--# LIKE
--# afficher les employes ayant un prénom commençant par s
SELECT prenom, nom, service FROM employes WHERE prenom LIKE "s%";
--# terminant par ie
SELECT prenom, nom, service FROM employes WHERE prenom LIKE "%ie";
--# contenant ie n'importe où dans la chaine
SELECT prenom, nom, service FROM employes WHERE prenom LIKE "%ie%";

--# Exclusion - différent de
SELECT nom, prenom, service FROM employes WHERE service != 'informatique';
+----------------------+----------------------+---------------+
| nom                  | prenom               | service       |
+----------------------+----------------------+---------------+
| Laborde              | Jean-pierre          | direction     |
| Gallet               | Clement              | commercial    |
| Winter               | Thomas               | commercial    |
| Dubar                | Chloe                | production    |
| Fellier              | Elodie               | secretariat   |
| Grand                | Fabrice              | comptabilite  |
| Collier              | Melanie              | commercial    |
| Blanchet             | Laura                | direction     |
| Miller               | Guillaume            | commercial    |
| Perrin               | Celine               | commercial    |
| Cottet               | Julien               | secretariat   |
| Desprez              | Thierry              | secretariat   |
| Thoyer               | Amandine             | communication |
| Martin               | Nathalie             | juridique     |
| Lagarde              | Benoit               | production    |
| Sennard              | Emilie               | commercial    |
| Lafaye               | Stephanie            | assistant     |
+----------------------+----------------------+---------------+

--# Opérateurs de comparaison:
--# >  strictement supérieur
--# <  strictement inférieur
--# >= supérieur ou égal
--# <= inférieur ou égal
--# =  est égal à 
--# != est différent de

--# Nous voulons afficher les informations des employes ayant un salaire supérieur à 3000
SELECT salaire, nom, prenom FROM employes WHERE salaire > 3000;
+---------+----------+-------------+
| salaire | nom      | prenom      |
+---------+----------+-------------+
|    5000 | Laborde  | Jean-pierre |
|    3550 | Winter   | Thomas      |
|    3100 | Collier  | Melanie     |
|    4500 | Blanchet | Laura       |
|    3200 | Martin   | Nathalie    |
+---------+----------+-------------+

--# ORDER BY
--# ordonné selon le prénom:
SELECT prenom, nom, salaire FROM employes ORDER BY prenom; --# (ASC par défaut (ascendant))
SELECT prenom, nom, salaire FROM employes ORDER BY prenom DESC; --# (DESC = descendant)

SELECT prenom, nom, salaire FROM employes ORDER BY salaire DESC, prenom ASC;

--# LIMIT
SELECT * FROM employes ORDER BY nom LIMIT 0, 3;
SELECT * FROM employes ORDER BY nom LIMIT 3, 3;
SELECT * FROM employes ORDER BY nom LIMIT 6, 3;
--# LIMIT permet de limiter le nombre de résultat. le premier chiffre représente la position de départ. 2ème chiffre représente le nombre de ligne à récupérer.
--# si on ne fourni qu'une seule valeur à LIMIT, cette valeur représente le nombre de ligne à récupérer.


--# salaire annuel des employes:
SELECT prenom, salaire*12 FROM employes;
--# en donnant un surnom au salaire*12
SELECT prenom, salaire*12 AS salaire_annuel FROM employes;
SELECT prenom, salaire*12 AS 'salaire annuel' FROM employes;

--# SUM()
--# masse salariale
SELECT SUM(salaire*12) AS 'Masse salariale' FROM employes;

--# AVG()
--# le salaire moyen
SELECT AVG(salaire) AS 'Salaire moyen' FROM employes;
+---------------+
| Salaire moyen |
+---------------+
|     2291.1905 |
+---------------+

--# ROUND()
--# Pour arrondir
SELECT ROUND(AVG(salaire)) AS 'Salaire moyen' FROM employes; --# résultat entier
SELECT ROUND(AVG(salaire), 2) AS 'Salaire moyen' FROM employes; --# résultat avec 2 décimales (2eme argument.)


--# COUNT()
SELECT COUNT(*) AS 'nombre de femme' FROM employes WHERE sexe = "f";
--# COUNT() permet de compter le nombre de ligne. il est possible de mettre un count() sur un champs spécifique exemple: COUNT(service) mais si ce champs contient la valeur null, le COUNT() n'en tiendra pas compte.

--# MIN() & MAX()
--# affichage du salaire max de la table
SELECT MAX(salaire) FROM employes;
SELECT prenom, MIN(salaire) FROM employes; --# incorrect

--# Avec une requete imbriquée
SELECT prenom, salaire FROM employes WHERE salaire = (SELECT MIN(salaire) FROM employes);
--# Avec un order by + limit
SELECT prenom, salaire FROM employes ORDER BY salaire LIMIT 0, 1;

--# Une condition sur plusieurs valeurs
SELECT * FROM employes WHERE service IN ('informatique', 'comptabilite');
--# L'inverse 
SELECT * FROM employes WHERE service NOT IN ('informatique', 'comptabilite');

--# AND
SELECT nom, prenom, service, salaire FROM employes WHERE service = 'commercial' AND salaire <= 2000;
+---------+-----------+------------+---------+
| nom     | prenom    | service    | salaire |
+---------+-----------+------------+---------+
| Miller  | Guillaume | commercial |    1900 |
| Sennard | Emilie    | commercial |    1800 |
+---------+-----------+------------+---------+

--# OR
SELECT * FROM employes WHERE service = "production" AND (salaire = 1900 OR salaire = 2300);
SELECT * FROM employes WHERE service = "informatique" OR service = 'comptabilite';

--# GROUP BY 
SELECT service, COUNT(*) AS 'nombre d\'employés' FROM employes;
SELECT service, COUNT(*) AS 'nombre d\'employés' FROM employes GROUP BY service;
+---------------+-------------------+
| service       | nombre demployés  |
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

--# Pour mettre une condition sur un GROUP BY HAVING
SELECT service, COUNT(*) AS 'nombre d\'employés' FROM employes GROUP BY service HAVING COUNT(*) >= 2;
+--------------+-------------------+
| service      | nombre demployés  |
+--------------+-------------------+
| commercial   |                 6 |
| direction    |                 2 |
| informatique |                 3 |
| production   |                 2 |
| secretariat  |                 3 |
+--------------+-------------------+

--###################################
--# REQUETE D'ENREGISTREMENT - INSERT INTO

INSERT INTO employes (id_employes, nom, prenom, sexe, service, salaire, date_embauche) VALUES (991, 'Quittard', 'Mathieu', 'm', 'informatique', 2000, '2018-02-14');

INSERT INTO employes VALUES (992, 'Mathieu2', 'Quittard2', 'm', 'informatique', CURDATE(), 2000);
INSERT INTO employes VALUES (NULL, 'Mathieu2', 'Quittard2', 'm', 'informatique', CURDATE(), 2000);
INSERT INTO employes (nom, prenom) VALUES ("test", "test");
INSERT INTO employes (nom, prenom, sexe, service, salaire, date_embauche) VALUES ( 'Quittard', 'Mathieu', 'm', 'informatique', 2000, '2018-02-14');

--###################################
--# REQUETE DE MODIFICATION - UPDATE
SELECT * FROM employes;
UPDATE employes SET salaire = 1395, nom = 'Cotte' WHERE id_employes = 699;
SELECT * FROM employes;

--###################################
--# REQUETE DE SUPPRESSION - DELETE
SELECT * FROM employes;
DELETE FROM employes WHERE nom LIKE 'quittard%';
DELETE FROM employes WHERE id_employes = 350;
SELECT * FROM employes;

DELETE FROM employes; --# équivalent à TRUNCATE

--# EXERCICES:
--# 1 - Afficher la profession de l'employé 547
SELECT service, id_employes FROM employes WHERE id_employes = 547;
+------------+-------------+
| service    | id_employes |
+------------+-------------+
| commercial |         547 |
+------------+-------------+
--# 2 - Afficher la date d'embauche d'Amandine
SELECT date_embauche, prenom FROM employes WHERE prenom = "amandine"; 
+---------------+----------+
| date_embauche | prenom   |
+---------------+----------+
| 2010-01-23    | Amandine |
+---------------+----------+
--# 3 - Afficher le nom de famille de Guillaume
SELECT nom, prenom FROM employes WHERE prenom = "guillaume";
+--------+-----------+
| nom    | prenom    |
+--------+-----------+
| Miller | Guillaume |
+--------+-----------+
--# 4 - Afficher le nombre de personnes ayant un id commençant par le chiffre 5
SELECT COUNT(id_employes) AS 'Nombre d\'employé' FROM employes WHERE id_employes LIKE '5%';
+------------------+
| Nombre demployé  |
+------------------+
|                3 |
+------------------+
--# 5 - Afficher le nombre de commerciaux
SELECT COUNT(*) AS 'Nombre de commerciaux' FROM employes WHERE service = "commercial";
--# 6 - Afficher le salaire moyen des informaticiens
SELECT AVG(salaire) AS 'Salaire moyen des informaticiens' FROM employes WHERE service = "informatique";
--# 7 - Afficher les 5 premiers employés après avoir classé leur nom par ordre alphabétique
SELECT * FROM employes ORDER BY nom LIMIT 0, 5;
--# 8 - Afficher le coût des commerciaux sur une année
SELECT SUM(salaire*12) AS 'masse salariale commerciale' FROM employes WHERE service = "commercial";
--# 9 - Afficher le salaire moyen par service
SELECT service, ROUND(AVG(salaire), 2) AS salaire_moyen FROM employes GROUP BY service;
--# 10 - Afficher le nombre de recrutement sur l'année 2010 avec un alias (AS)
SELECT COUNT(*) AS 'nb de recrutement en 2010' FROM employes WHERE date_embauche LIKE '2010%';
+---------------------------+
| nb de recrutement en 2010 |
+---------------------------+
|                         2 |
+---------------------------+
SELECT COUNT(*) AS 'nb de recrutement en 2010' FROM employes WHERE date_embauche BETWEEN "2010-01-01" AND '2010-12-31';
SELECT COUNT(*) AS 'nb de recrutement en 2010' FROM employes WHERE date_embauche >= '2010-01-01' AND date_embauche <= '2010-12-31'; 
--# 11 - Afficher le salaire moyen des employes ayant été recrutés sur la période de 2005 à 2007 inclu
SELECT ROUND(AVG(salaire), 2) AS 'Salaire moyen' FROM employes WHERE date_embauche BETWEEN "2005-01-01" AND "2007-12-31";
+---------------+
| Salaire moyen |
+---------------+
|       2622.50 |
+---------------+
--# 12 - Afficher le nombre de différent service
SELECT COUNT(DISTINCT service) AS 'nb de différent service' FROM employes;
+-------------------------+
| nb de différent service |
+-------------------------+
|                       9 |
+-------------------------+
--# 13 - Afficher tous les employés sauf ceux des services production et secrétariat
SELECT nom, prenom, service FROM employes WHERE service NOT IN ('production', 'secretariat');
SELECT nom, prenom, service FROM employes WHERE service != 'production' AND service != 'secretariat';
+----------+-------------+---------------+
| nom      | prenom      | service       |
+----------+-------------+---------------+
| Laborde  | Jean-pierre | direction     |
| Gallet   | Clement     | commercial    |
| Winter   | Thomas      | commercial    |
| Grand    | Fabrice     | comptabilite  |
| Collier  | Melanie     | commercial    |
| Blanchet | Laura       | direction     |
| Miller   | Guillaume   | commercial    |
| Perrin   | Celine      | commercial    |
| Vignal   | Mathieu     | informatique  |
| Thoyer   | Amandine    | communication |
| Durand   | Damien      | informatique  |
| Chevel   | Daniel      | informatique  |
| Martin   | Nathalie    | juridique     |
| Sennard  | Emilie      | commercial    |
| Lafaye   | Stephanie   | assistant     |
+----------+-------------+---------------+
--# 14 - Afficher conjointement le nombre de femme et le nombre d'homme
SELECT sexe, COUNT(*) AS 'nombre' FROM employes GROUP BY sexe;
+------+--------+
| sexe | nombre |
+------+--------+
| m    |     11 |
| f    |      9 |
+------+--------+
--# 15 - Qui a été embauché en dernier 
SELECT * FROM employes ORDER BY date_embauche DESC LIMIT 0, 1;
SELECT * FROM employes WHERE date_embauche = (SELECT MAX(date_embauche) FROM employes);
+-------------+-----------+--------+------+-----------+---------------+---------+
| id_employes | prenom    | nom    | sexe | service   | date_embauche | salaire |
+-------------+-----------+--------+------+-----------+---------------+---------+
|         990 | Stephanie | Lafaye | f    | assistant | 2015-06-02    |    1775 |
+-------------+-----------+--------+------+-----------+---------------+---------+
--# 16 - Afficher les informations de l'employé du service commercial ayant le salaire le plus élevé.
SELECT * FROM employes WHERE service = 'commercial' ORDER BY salaire DESC LIMIT 0, 1;
SELECT nom, prenom FROM employes WHERE service = 'commercial' ORDER BY salaire DESC LIMIT 0, 1;
+-------------+--------+--------+------+------------+---------------+---------+
| id_employes | prenom | nom    | sexe | service    | date_embauche | salaire |
+-------------+--------+--------+------+------------+---------------+---------+
|         415 | Thomas | Winter | m    | commercial | 2000-05-03    |    3550 |
+-------------+--------+--------+------+------------+---------------+---------+
--# 17 - Afficher le prenom du comptable ayant le salaire le plus élevé
SELECT * FROM employes WHERE service = 'comptabilite' ORDER BY salaire DESC LIMIT 0, 1;
+-------------+---------+-------+------+--------------+---------------+---------+
| id_employes | prenom  | nom   | sexe | service      | date_embauche | salaire |
+-------------+---------+-------+------+--------------+---------------+---------+
|         509 | Fabrice | Grand | m    | comptabilite | 2003-02-20    |    1900 |
+-------------+---------+-------+------+--------------+---------------+---------+
--# 18 - Afficher les commerciaux ayant été recruté avant 2005 de sexe masculin et gagnant un salaire supérieur à 2500
SELECT * 
FROM employes 
WHERE service = 'commercial' 
AND date_embauche < '2005-01-01' 
AND sexe = "m"
AND salaire > 2500;
+-------------+--------+--------+------+------------+---------------+---------+
| id_employes | prenom | nom    | sexe | service    | date_embauche | salaire |
+-------------+--------+--------+------+------------+---------------+---------+
|         415 | Thomas | Winter | m    | commercial | 2000-05-03    |    3550 |
+-------------+--------+--------+------+------------+---------------+---------+
--# 19 - Afficher le prenom de l'informaticien ayant été recruté en premier
SELECT prenom, service 
FROM employes 
WHERE service = "informatique"
ORDER BY date_embauche 
LIMIT 0, 1;
+---------+--------------+
| prenom  | service      |
+---------+--------------+
| Mathieu | informatique |
+---------+--------------+
--# 20 - Augmenter chaque employé de 100€
SELECT * FROM employes;
UPDATE employes SET salaire = (salaire + 100);
SELECT * FROM employes;












