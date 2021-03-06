--# Création de la BDD
CREATE DATABASE bibliotheque;
--# on se positionne sur la BDD
Use bibliotheque;

--# Faire un copier/coller du contenu du fichier bibliotheque.sql


--# Si on veut vérifier que nos tables ont bien été enregistrées et vérifier qu'elles sont bien remplies:
SHOW TABLES;
SELECT * FROM abonne; SELECT * FROM emprunt; SELECT * FROM livre;

--# NULL ne peut pas etre testé avec "=". cette valeur se teste avec IS/IS NOT

--# Afficher les id livres qui n'ont pas été rendus
SELECT id_livre FROM emprunt WHERE date_rendu IS NULL;

--# Affichage des titres des livres qui n'ont pas été rendus à la bibliothèque
SELECT titre FROM livre WHERE id_livre IN 
	(SELECT id_livre FROM emprunt WHERE date_rendu IS NULL);	/*  Attention à bien mettre un IN au lieu de "="   */
--# Affichage des prenom des abonnés qui n'ont pas rendu leur livre à la bibliothèque	
SELECT prenom FROM abonne WHERE id_abonne IN (SELECT id_abonne FROM emprunt WHERE date_rendu IS NULL);

--# Les jointures répondent à tous les cas de figure. Les imbriquées ne répondent qu'aux requetes d'une seule table. Mais les imbriquées sont plus rapide que les jointures. (de meme le IF est tjrs plus rapide que le switch case.)

--# Affichage des id_livre que Chloé	a emprunté à la bibliothèque
	SELECT id_livre from emprunt WHERE id_abonne = (SELECT id_abonne FROM abonne WHERE prenom="chloe");/*Fonctionne aussi avec le IN */
	
--# Affichage des prénoms des abonnés ayant emprunté un livre le 19-12-2014
	SELECT prenom 
	FROM abonne 
	WHERE id_abonne IN 
		(SELECT id_abonne 
		FROM emprunt 
		WHERE date_sortie="2014-12-19");

--# Affichage du nombre de livres que Guillaume a déjà emprunté à la bibliothèque
SELECT COUNT(id_livre) AS NBRE_DE_LIVRE 
FROM emprunt 
WHERE id_abonne= 
	(SELECT id_abonne 
	FROM abonne 
	WHERE prenom= "guillaume"); /*si on avait considéré que le client avait emprunté plusiurs fois le meme livre, on aurait pu rester sur 2 tables en appliquant simple un DISTINCT devant COUNT(id_livre)*/

--# Afffichage des prénoms des abonnés ayant déjà emprunté un ilvre d'Alphonse DAUDET
SELECT * FROM abonne WHERE id_abonne IN (SELECT id_abonne FROM emprunt WHERE id_livre IN (SELECT id_livre FROM LIVRE WHERE auteur LIKE "%daudet")); /*SQL n'est pas sensible a la casse meme pour les valeurs des champs*/ 
--# ou encore:
SELECT * FROM abonne WHERE id_abonne IN (SELECT id_abonne FROM emprunt WHERE id_livre IN (SELECT id_livre FROM LIVRE WHERE auteur = "ALPHONSE DAUDET"));
	
--# Nous aimerions connaitre le ou les titres du/des livres empruntés par chloé	
SELECT * FROM livre WHERE id_livre IN (SELECT id_livre FROM emprunt WHERE id_abonne IN (SELECT id_abonne FROM abonne WHERE prenom= "CHLOE"));
--# Nous aimerions connaitre le ou les titres du/des livres que n'a pas empruntés chloé	
SELECT * FROM livre WHERE id_livre NOT IN (SELECT id_livre FROM emprunt WHERE id_abonne IN (SELECT id_abonne FROM abonne WHERE prenom= "CHLOE"));
--# Nous aimerions maintenant connaitre le ou les titres du/des livres que Chloé n'a pas encore rendu	
SELECT * FROM livre WHERE id_livre IN (SELECT id_livre FROM emprunt WHERE id_abonne IN (SELECT id_abonne FROM abonne WHERE prenom= "CHLOE") AND date_rendu IS NULL);
--# ou encore:
SELECT * FROM livre WHERE id_livre IN (SELECT id_livre FROM emprunt WHERE date_rendu IS NULL  AND id_abonne IN (SELECT id_abonne FROM abonne WHERE prenom= "CHLOE"));

--# QUI A EMPRUNTE LE PLUS DE LIVRES?
select * from abonne WHERE id_abonne=(select id_abonne FROM emprunt group by id_abonne order by COUNT(id_livre) DESC LIMIT 0,1);
--# CETTE LIGNE NE FONCTIONNE PAS CAR LE GROUP BY DOIT VENIR AVANT LE ORDER BY:
select * from abonne WHERE id_abonne=(select id_abonne FROM emprunt order by COUNT(id_livre) DESC group by id_abonne LIMIT 0,1);

--# LA JOINTURE EST TOUJOURS FAISABLE QQ SOIT LA REQUETE
--# Nous aimerions connaitre les dates de rendu et de sortie pour l'abonné Guilaume
SELECT date_rendu, date_sortie, prenom 
FROM abonne, emprunt 
WHERE prenom = "guillaume" 
AND emprunt.id_abonne = abonne.id_abonne;
+------------+-------------+-----------+
| date_rendu | date_sortie | prenom    |
+------------+-------------+-----------+
| 2014-12-18 | 2014-12-17  | Guillaume |
| 2014-12-28 | 2014-12-19  | Guillaume |
+------------+-------------+-----------+
SELECT e.date_rendu, e.date_sortie, a.prenom 
FROM abonne a, emprunt e
WHERE a.prenom = "guillaume" 
AND e.id_abonne = a.id_abonne;

--# Refaire la requete en imbriqué:
Select date_rendu, date_sortie from emprunt WHERE id_abonne=(select id_abonne from abonne where prenom="guillaume");
+------------+-------------+
| date_rendu | date_sortie |
+------------+-------------+
| 2014-12-18 | 2014-12-17  |
| 2014-12-28 | 2014-12-19  |
+------------+-------------+
--# En requete imbriquée on ne peut pas afficher le prenom car il appartient a une autre table. C'est soit l'une soit l'autre table mais pas les 2!

--# Nous aimerions connaitre les dates de sortie et de rendu pour le(s) livre(s) écrit(s) par Alphonse DAUDET

--# 1ere ligne : ce que l'on doit afficher
--# 2eme ligne : les tables dont nous avons besoin
--# 3eme ligne et les suivantes: la/les conditions
--# ensuite, si besoin les GROUP BY / ORDER BY ...
SELECT date_sortie, date_rendu, auteur FROM emprunt e, livre l WHERE e.id_livre=l.id_livre and auteur="ALPHONSE DAUDET"; 


--# Qui a emprunté le livre "une vie" sur l'année 2014:
SELECT prenom,titre,date_sortie AS DATE_EMPRUNTEE FROM abonne a, emprunt e, livre l WHERE e.id_livre=l.id_livre and e.id_abonne=a.id_abonne and titre= "une vie" AND date_sortie BETWEEN "2014-01-01" AND "2014-12-31"; 
--# ou encore:
SELECT prenom,titre,date_sortie AS DATE_EMPRUNTEE FROM abonne a, emprunt e, livre l WHERE e.id_livre=l.id_livre and e.id_abonne=a.id_abonne and titre= "une vie" AND date_sortie LIKE "2014%"; 

--# Nous aimerions connaitre le nombre de livres empruntés par chaque abonnés
SELECT count(e.id_livre) AS Nb_de_livres_empruntes, a.prenom 
FROM emprunt e, abonne a 
WHERE e.id_abonne=a.id_abonne 
group by prenom 
order by Nb_de_livres_empruntes DESC 
LIMIT 0,1;  
/* Attention le "é" renvoi une erreur de syntaxe dans Nb_de_livres_empruntés */ 
/*le COUNT, il vaut mieux toujours l'appliquer sur le id car le champ id ne peut pas etre vide*/

--# Nous aimerions connaitre le nombre de livre à rendre pour chaque abonné:
SELECT prenom,count(id_livre) AS Nombre_de_livres_a_rendre
FROM abonne a, emprunt e
WHERE e.id_abonne=a.id_abonne
AND date_rendu IS NULL 
GROUP BY prenom;

--# QUI a pris Quoi et Quand ?
select prenom, titre, date_sortie
FROM abonne a, emprunt e, livre l
WHERE a.id_abonne = e.id_abonne
AND l.id_livre = e.id_livre;

insert into abonne values(NULL,"jonathan");
--ou encore:
insert into abonne(prenom) VALUES('Jonathan');

--#Affichage des prenoms avec les id_livre qu'ils ont emprunté.
SELECT a.prenom,e.id_livre
FROM emprunt e,abonne a
WHERE a.id_abonne= e.id_abonne;

--# JOINTURES EXTERNES (sans correspondance exigée)
SELECT a.prenom,e.id_livre, l.auteur FROM abonne a LEFT JOIN emprunt e ON e.id_abonne=a.id_abonne; /*ON c est la meme chose qu un WHERE sur un LEFT/RIGHT JOIN. LE LEFT/RIGHT donne la priorité d'affichage de la table. LEFT/RIGHT combiné au ON va demander d'afficher également, s'il existent, les lignes ayant un champ id NULL à GAUCHE/DROITE, en fonction du LEFT/RIGHT JOIN   */
+-----------+----------+
| prenom    | id_livre |
+-----------+----------+
| Guillaume |      100 |
| Benoit    |      101 |
| Chloe     |      100 |
| Laura     |      103 |
| Guillaume |      104 |
| Benoit    |      105 |
| Chloe     |      105 |
| Benoit    |      100 |
| jonathan  |     NULL |
+-----------+----------+
--# De meme, sur 3 tables, 
SELECT a.prenom, e.id_livre, l.auteur 
FROM abonne a
LEFT JOIN emprunt e ON e.id_abonne=a.id_abonne
LEFT JOIN livre l ON e.id_livre=l.id_livre;

+-----------+----------+-------------------+
| prenom    | id_livre | auteur            |
+-----------+----------+-------------------+
| Guillaume |      100 | GUY DE MAUPASSANT |
| Benoit    |      101 | GUY DE MAUPASSANT |
| Chloe     |      100 | GUY DE MAUPASSANT |
| Laura     |      103 | ALPHONSE DAUDET   |
| Guillaume |      104 | ALEXANDRE DUMAS   |
| Benoit    |      105 | ALEXANDRE DUMAS   |
| Chloe     |      105 | ALEXANDRE DUMAS   |
| Benoit    |      100 | GUY DE MAUPASSANT |
| jonathan  |     NULL | NULL              |
+-----------+----------+-------------------+

--# La jointure externe permet de donner la priorité a une table sur laquelle on récupère tout le contenu demandé ( sur les exemples au dessus, les prénoms de la table abonne) puis on rajoute les informations des autres tables sur la base des relations.(emprunt.id_abonne doit être égal à abonne.id_abonne)
































































//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


-- commentaire SQL
# commentaire SQL

--# Pour créer une BDD
CREATE DATABASE nom_de_la_bdd;

CREATE TABLE nom_de_la_table;

--# Pour voir toutes les BDD présentes sur le serveur
SHOW DATABASES;
--# Pour voir toutes les Tables présentes
SHOW TABLES;
--# Pour voir toutes les WARNINGS
SHOW WARNINGS;


--# Pour se positionner sur une BDD afin de l'utiliser
USE nom_de_la_bdd;

--# Pour supprimer une BDD
DROP DATABASE nom_de_la_bdd;
--# Table
DROP TABLE nom_de_la_table;

--#Pour vider une tabl sans la supprimer
TRUNCATE nom_de_la_table;

--# Pour voir la structure d'une table
DESC nom_de_la_table;

--# REQUETE DE SELECTION (question)
--# Pour voir le contenu complet de la table, nous pouvons appeler tous les champs (colonnes, c est la mme chose)
SELECT id_employes, sexe, service, date_embauche, nom, prenom, salaire FROM employes;
--# la meme chose avec *
SELECT * FROM employes;
--# Affichage des noms et prénoms uniquement
SELECT nom, prenom FROM employes;

--# EXERCICE: affichez les services de la table employes.
SELECT service FROM employes;

--# Affichez les differents services !
SELECT DISTINCT service FROM employes;

--# les noms, prénom, services uniquement des employés du service informatique.
SELECT nom, prenom, service FROM employes WHERE service='informatique';
--# WHERE -> à la condition que...


--# Affichage des employés ayant été recrutés entre le 1er Janvier 20 et aujourd'hui
SELECT * FROM employes WHERE date_embauche BETWEEN "2010-01-01" AND '2018-02-14';

SELECT CURDATE();
+------------+
| CURDATE()  |
+------------+
| 2018-02-14 |
+------------+
SELECT * FROM employes WHERE date_embauche BETWEEN "2010-01-01" AND CURDATE();
SELECT * FROM employes WHERE date_embauche >= "2010-01-01";

--# LIKE 
--# Afficher les employes ayant un prenom commencant par salaire
SELECT prenom, nom, service FROM employes WHERE prenom LIKE "s%";
--# terminant par ie
SELECT prenom, nom, service FROM employes WHERE prenom LIKE "%ie";
--# contenant ie
SELECT prenom, nom, service FROM employes WHERE prenom LIKE "%ie%";


--# Exclusion - Différent de
SELECT prenom, nom, service FROM employes WHERE service != 'informatique';
+-------------+----------+---------------+
| prenom      | nom      | service       |
+-------------+----------+---------------+
| Jean-pierre | Laborde  | direction     |
| Clement     | Gallet   | commercial    |
| Thomas      | Winter   | commercial    |
| Chloe       | Dubar    | production    |
| Elodie      | Fellier  | secretariat   |
| Fabrice     | GrAND    | comptabilite  |
| Melanie     | Collier  | commercial    |
| Laura       | Blanchet | direction     |
| Guillaume   | Miller   | commercial    |
| Celine      | Perrin   | commercial    |
| Julien      | Cottet   | secretariat   |
| Thierry     | Desprez  | secretariat   |
| AmANDine    | Thoyer   | communication |
| Nathalie    | Martin   | juridique     |
| Benoit      | Lagarde  | production    |
| Emilie      | Sennard  | commercial    |
| Stephanie   | Lafaye   | assistant     |
+-------------+----------+---------------+
--# Opérateurs de comparaison:

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

--# ORDER BY (fonctionne sur les lettre et les chiffres)
--# ordonné selon le prénom
SELECT salaire, nom, prenom FROM employes ORDER BY prenom;
--# ordonné par défaut en ASC. ce n est pas necessaire de le mettre
SELECT salaire, nom, prenom FROM employes ORDER BY prenom ASC;
--# ordonné par ordre DESCendant
SELECT salaire, nom, prenom FROM employes ORDER BY prenom DESC;
--# ordonné par ordre DESCendant, sur une ou plusieurs info
SELECT salaire, nom, prenom FROM employes ORDER BY salaire DESC, prenom ASC;

--# LIMIT     POSITION DE DEPART   ET    NOMBRE DE LIGNES A RECUPERER
SELECT * FROM employes ORDER BY nom LIMIT 0, 3;  --# 0,3 ca s'appelle "une instruction du language" de meme que "SELECT".
SELECT * FROM employes ORDER BY nom LIMIT 3, 3;
SELECT * FROM employes ORDER BY nom LIMIT 6, 3;
--# LIMIT permet de LIMITer le nombre de resultats. Le premier chiffre représente la position de départ. 2eme chiffre représente le nombre de lignes à récupérer.
--#si on ne fournit qu'1 seule valeur à LIMMIT, cette valeur représente le nbre de lignes à récupérer depuis la premiere ligne du tableau.

--#salaire annuel des employes:
SELECT prenom, salaire*12 FROM employes;

--# en donnant un surnom au salaire*12
SELECT prenom, salaire*12 AS 'salaire annuel' FROM employes;
SELECT prenom, salaire*12 AS salaire_annuel FROM employes;

--# SUM()
--# masse salariale
SELECT SUM(salaire*12) AS 'Masse Salariale' FROM employes;

--# AVG()
--# le salaire moyen
SELECT AVG(salaire*12) AS 'Salaire moyen' FROM employes;

--# ROUND()
--# Pour Arrondir
SELECT ROUND(AVG(salaire)) AS 'Salaire moyen' FROM employes; --# résultat entier à la val superieure
SELECT ROUND(AVG(salaire),2) AS 'Salaire moyen' FROM employes; --# résultat avec 2 chiffre apres la virgule. le 2 represente le nb de decimales que l on souhaite obtenir. et correspond au 2e argument

--# Connaitre le nombre de lignes présentes 
--#COUNT()
SELECT COUNT(*) AS 'nombre de femmes' FROM employes WHERE sexe='f';  --# NULL n est pas une valeur. /**/
--# COUNT() permet de compter le nbre de lignes. Il est possible de mettre un COUNT() sur un champ spécifique.
--#ex: COUNT(service) mais si ce champ contient la valeur NULLL, le COUNT() n'en tiendra pas compte.

--# MIN() et MAX()
SELECT MAX(salaire) FROM employes;

--# Avec une requête imbriquée
SELECT prenom, salaire FROM employes WHERE salaire=(SELECT MIN(salaire) FROM employes);
--# ou encore, de façon équivalente, et plus performante:
SELECT prenom, salaire FROM employes ORDER BY salaire LIMIT 0,1;

--# Une condition sur plusieurs valeurs
SELECT * FROM employes WHERE service IN ('informatique', 'comptabilite');
--# L'inverse
SELECT * FROM employes WHERE service NOT IN ('informatique', 'comptabilite');

--# AND
SELECT nom, prenom, service, salaire FROM employes WHERE service='commercial' AND salaire <= 2000;
--# OR
SELECT * FROM employes WHERE service='production' AND (salaire=1900 OR salaire = 2300);
+-------------+--------+-------+------+------------+---------------+---------+
| id_employes | prenom | nom   | sexe | service    | date_embauche | salaire |
+-------------+--------+-------+------+------------+---------------+---------+
|         417 | Chloe  | Dubar | f    | production | 2001-09-05    |    1900 |
+-------------+--------+-------+------+------------+---------------+---------+
--# sans les parenthese on recuperera ceux qui sont commercial et gagnent 1900€ ou tous ceux qui gagnent 2300, quel que soit leur profession.
SELECT * FROM employes WHERE service='production' AND salaire=1900 OR salaire = 2300;
+-------------+---------+--------+------+------------+---------------+---------+
| id_employes | prenom  | nom    | sexe | service    | date_embauche | salaire |
+-------------+---------+--------+------+------------+---------------+---------+
|         388 | Clement | Gallet | m    | commercial | 2000-01-15    |    2300 |
|         417 | Chloe   | Dubar  | f    | production | 2001-09-05    |    1900 |
+-------------+---------+--------+------+------------+---------------+---------+

--# GROUP BY
--# pour regrouper des informations selon une information; Permet de retourner le nbre d employes selon le service. le resultat est traite par ordre alphabetique au niveau du champ service
SELECT service, COUNT(*) AS "nombre d\'employés" FROM employes GROUP BY service;
+---------------+-------------------+
| service       | nombre d employes |
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
--# Pour mettre une condition sur un GROUP BY: on utilisera un GROUP BY HAVING  (regroupe sur ... a partir du moment ou ils ont...)
SELECT service, COUNT(*) AS "nombre d\'employés" FROM employes GROUP BY service HAVING COUNT(*)>= 2;
+---------------+-------------------+
| service       | nombre d employes |
+---------------+-------------------+
| commercial    |                 6 |
| direction     |                 2 |
| informatique  |                 3 |
| production    |                 2 |
| secretariat   |                 3 |
+---------------+-------------------+

--# ################################################################
--# REQUETE D ENREGISTREMENT -  INSERT INTO

INSERT INTO employes(id_employes, nom, prenom, sexe, service,salaire, date_embauche) VALUES(991, 'Quittard', 'Mathieu', 'm', 'informatique', 2000, '2018-02-14');
--# ATTENTION! si il est possible de ne pas mettre les valeur de tous les champs mais dans ce cas, on doit absolument donner les valeurs du INSERT INTO dans l'ordre de la bdd et on ne pas sauter une valeur.
INSERT INTO employes VALUES (992, 'Mathieu', 'Quittard2', 'm', 'informatique', CURDATE(), 2000);

INSERT INTO employes VALUES (NULL, 'Mathieu', 'Quittard2', 'm', 'informatique', CURDATE(), 2000);

INSERT INTO employes (nom, prenom) VALUES ("test", "test");
--INSERT INTO employes (nom, prenom,sexe,service,salaire,date_embauche) VALUES ("Quittard", "Mathieu",'m','informatique', 2000, '2018-02-14');	CA FONCTIONNE MEME SANS L ID 


--# ################################################################
--# REQUETE DE MODIFICATION -UPDATE
SELECT * FROM employes;
UPDATE employes SET salaire =1395, nom='Cotte' WHERE id_employes=699;

--# ################################################################
--# REQUETE DE SUPPRESSION - DELETE
SELECT * FROM employes;
DELETE FROM employes WHERE nom  LIKE'quittard%';
SELECT * FROM employes;

DELETE FROM employes; --# équivalent à TRUNCATE

--# EXERCICES:
--# 1 - Afficher la profession de l'employé 547
 SELECT id_employes, nom, prenom, service FROM employes WHERE id_employes= 547;
 
--# 2 - Afficher la date d'embauche d'AmANDine
SELECT date_embauche FROM employes WHERE prenom='AmANDine';

--# 3 - Afficher le nom de famille de Guillaume
 SELECT nom FROM employes WHERE prenom="Guillaume";
 
--# 4 - Afficher le nombre de personnes ayant un id commencant par le chiffre 5
SELECT COUNT(*) AS "nombre d employes" FROM employes WHERE id_employes LIKE "5%";

--# 5 - Afficher le nombre de commerciaux
SELECT COUNT(*) AS "nombre de commerciaux" FROM employes WHERE service="commercial";

--# 6 - Afficher le salaire moyen des informaticiens
SELECT AVG(salaire) AS "salaire moyen des informaticiens" FROM employes WHERE service= "informatique";

--# 7 - Afficher les 5 premiers employés après avoir classé leur nom par ordre alphabétique
SELECT * FROM employes ORDER BY nom LIMIT 0,5;

--# 8 - Afficher le coût des commerciaux sur une année
SELECT SUM(salaire*12) AS 'masse salariale commerciale' FROM employes WHERE service="commercial";

--# 9 - Afficher le salaire moyen par service
SELECT service, round(AVG(salaire),2) as salaire_moyen FROM employes GROUP BY service ORDER BY salaire_moyen;

--# 10 - Afficher le nombre de recrutements sur l'année 2010 avec un alias (AS)
SELECT COUNT(*) as 'nombre de recrutes en 2010' FROM employes WHERE date_embauche LIKE "2010%";
--# ou encore:
SELECT COUNT(*) as 'nb de recrutes en 2010' FROM employes WHERE date_embauche BETWEEN "21010-01-01" AND '2010-12-31';
--# ou encore:
SELECT COUNT(*) as 'nb de recrutes en 2010' FROM employes WHERE date_embauche >='2010-01-01' AND date_embauche<='2010-12-31';

--# 11 - Afficher le salaire moyen des employés ayant été recrutés sur la période de 2005 à 2007 inclus
SELECT ROUND(AVG(salaire),2) AS salaire_moyen FROM employes WHERE date_embauche BETWEEN '2005-01-01' AND '2007-12-31';

--# 12 - Afficher le nombre de différents services
SELECT COUNT(DISTINCT service) AS 'nb de différent service' FROM employes;

--# 13 - Afficher tous les employés sauf ceux des services production et secrétariat
SELECT * FROM employes WHERE service NOT IN ("production","secretariat");
--# ou encore:
SELECT * FROM employes WHERE service != "production" AND service != "secretariat";

--# 14 - Afficher conjointement le nombre de femmes et le nombre d'hommes
SELECT sexe, COUNT(sexe) AS 'nombre' FROM employes GROUP BY sexe;

--# 15 - Qui a été embauché en dernier ?
SELECT * FROM employes ORDER BY date_embauche DESC LIMIT 0,1;
--# ou encore:
SELECT * FROM employes WHERE date_embauche=(select MAX(date_embauche) from employes);

--# 16 - Afficher les informations de l'employé du service commercial ayant le salaire le plus élevé
 SELECT * 
 FROM employes 
 WHERE service="commercial" 
 ORDER BY salaire 
 DESC LIMIT 0,1;
 --# ou encore:
SELECT nom, prenom FROM employes WHERE service="commercial" ORDER BY salaire DESC LIMIT 0,1;  /*on est pas obligé d'avoir selectionné le champ dans le select pour faire un ORDER BY dessus*/
 
--# 17 - Afficher le prenom du commercial ayant le salaire le plus élevé
SELECT prenom FROM employes WHERE service="commercial" ORDER BY salaire DESC LIMIT 0,1;

--# 18 - Afficher les commerciaux ayant été recrutés avant 2005 de sexe masculin et gagnant un salaire > à 2500
SELECT * FROM employes WHERE service="commercial" ORDER BY salaire DESC LIMIT 0,1;

--# 19 - Afficher le prénom de l'informaticien ayant été recruté en premier
 SELECT prenom, service 
 FROM employes 
 WHERE service="informatique" 
 ORDER BY date_embauche 
 LIMIT 0,1;
--# ou encore:
SELECT prenom, service FROM employes WHERE date_embauche=(select MIN(date_embauche) from employes WHERE service="informatique"); 
 
--# 20 - Augmenter chaque employé de 100€.
SELECT * FROM employes;
UPDATE employes SET salaire=salaire+100;
SELECT * FROM employes;

/*START TRANSACTION;
DELETE FROM employes;
SELECT * FROM employes;
ROLLBACK;(SINON COMMIT pour valider)	ANNULE TOUTES LES TRANSACTIONS QUI VIENNENT D ETRE EFFECTUES
SELECT * FROM employes;*/



