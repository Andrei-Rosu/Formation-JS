-- # mysql.exe -u root

--Creation de la BDD
 CREATE DATABASE bibliotheque;
-- On se positionne sur la BDD;
USE bibliotheque;
-- Faire un copier-collere du contenu du fichier bibliotheque.sql


SHOW TABLES;
SELECT * FROM abonne;
SELECT * FROM emprunt;
SELECT * FROM livre;

-- La valeur NULL se teste avec IS/IS NOT
-- Afficher les livres qui n'ont pas été rendus
SELECT id_livre FROM emprunt WHERE date_rendu IS NULL;
--
SELECT titre FROM livre WHERE id_livre IN
    (SELECT id_livre FROM emprunt WHERE date_rendu IS NULL)
--










--Affichage des id_livres que Chloe à emprunté

SELECT id_livre FROM emprunt WHERE id_abonne IN(SELECT id_abonne FROM abonne WHERE prenom="Chloe");
MariaDB [bibliotheque]> SELECT id_livre FROM emprunt WHERE id_abonne IN(SELECT id_abonne FROM abonne WHERE prenom="Chloe");
+----------+
| id_livre |
+----------+
|      100 |
|      105 |
+----------+
2 rows in set (0.00 sec)




-- Affichage des prénoms des abonnés ayant emprunté un livre le 19/12/2014
SELECT prenom FROM abonne WHERE id_abonne IN
    (SELECT id_abonne FROM emprunt WHERE date_sortie="2014-12-19");
MariaDB [bibliotheque]> select prenom from abonne where id_abonne IN(select id_abonne FROM emprunt where date_sortie="2014-12-19");
+-----------+
| prenom    |
+-----------+
| Guillaume |
| Chloe     |
| Laura     |
+-----------+
3 rows in set (0.01 sec)

-- Affichage du nombre de livre que Guilaume à déja emprunté à la bibliotheque

SELECT COUNT(id_livre) FROM livre WHERE id_livre IN
(SELECT id_livre FROM emprunt WHERE id_abonne="1");
MariaDB [bibliotheque]> SELECT COUNT(id_livre) FROM livre WHERE id_livre IN(SELECT id_livre FROM emprunt WHERE id_abonne="1");
+-----------------+
| COUNT(id_livre) |
+-----------------+
|               2 |
+-----------------+
1 row in set (0.01 sec)

-- Affichage des prénoms des abonnés ayant déjà empunté un livre de Alphonse Daudet

SELECT prenom FROM abonne WHERE id_abonne IN
    (SELECT id_abonne FROM emprunt WHERE id_livre IN
        (SELECT id_livre FROM livre WHERE auteur = "ALPHONSE DAUDET"));
MariaDB [bibliotheque]> SELECT prenom FROM abonne WHERE id_abonne IN
    (SELECT id_abonne FROM emprunt WHERE id_livre IN
            (SELECT id_livre FROM livre WHERE auteur = "ALPHONSE DAUDET"));
+--------+
| prenom |
+--------+
| Laura  |
+--------+
1 row in set (0.00 sec)


SELECT titre FROM livre WHERE id_livre IN
    (SELECT id_livre FROM emprunt WHERE id_abonne IN
        (SELECT id_abonne FROM abonne WHERE prenom ="Chloe"));
        MariaDB [bibliotheque]> SELECT titre FROM livre WHERE id_livre IN
    -> (SELECT id_livre FROM emprunt WHERE id_abonne IN
    -> (SELECT id_abonne FROM abonne WHERE prenom = "Chloe"));
+-------------------------+
| titre                   |
+-------------------------+
| Une vie                 |
| Les Trois Mousquetaires |
+-------------------------+
2 rows in set (0.00 sec)



SELECT titre FROM livre WHERE id_livre NOT IN
    (SELECT id_livre FROM emprunt WHERE id_abonne IN
        (SELECT id_abonne FROM abonne WHERE prenom ="Chloe"));

-- Nous aimerions maintenant connaître les titre des livre

SELECT titre FROM livre WHERE id_livre IN
    (SELECT id_livre FROM emprunt WHERE date_rendu IS NULL AND id_abonne IN
        (SELECT id_abonne FROM abonne WHERE prenom ="Chloe"));



SELECT prenom FROM abonne WHERE id_abonne =
(SELECT id_abonne  FROM emprunt  WHERE id_livre in
(Select id_livre,COUNT(*) FROM emprunt ORDER BY COUNT(*) DESC));



--# Qui a emprunté le plus de livre à la bibliotheque order et group by count et limit ?
SELECT prenom FROM abonne WHERE id_abonne IN
	(SELECT id_abonne FROM emprunt WHERE COUNT(id_livre) ORDER BY id_abonne DESC);

	SELECT id_livre,COUNT(*)FROM emprunt GROUP BY id_livre WHERE id_livre IN
	(SELECT id_livre FROM emprunt ORDER BY id_livre,COUNT(*) DESC);












	SELECT date_sortie,date_rendu FROM emprunt WHERE id_livre in
	 (SELECT id_livre FROM livre WHERE auteur="ALPHONSE DAUDET");
	 SELECT date_sortie,date_rendu FROM emprunt WHERE id_livre in
    ->  (SELECT id_livre FROM livre WHERE auteur="ALPHONSE DAUDET");
+-------------+------------+
| date_sortie | date_rendu |
+-------------+------------+
| 2014-12-19  | 2014-12-22 |
+-------------+------------+
1 row in set (0.00 sec)

SELECT emprunt.date_rendu, emprunt.date_sortie, livre.auteur
FROM emprunt, livre
WHERE auteur = "alphonse daudet"
AND emprunt.id_livre = livre.id_livre;

SELECT livre.titre, abonne.prenom, id_livre, id_abonne
FROM livre,abonne,emprunt
WHERE titre="une vie"
AND date_sortie LIKE "%2014%"
 AND livre.id_livre=emprunt.id_livre
  AND emprunt.id_abonne=abonne.id_abonne;








SELECT abonne.prenom,COUNT(emprunt.id_livre) AS "nombre de livre"
FROM abonne, emprunt
WHERE abonne.id_abonne=emprunt.id_abonne
GROUP BY abonne.prenom

LIMIT 0,1;

SELECT abonne.prenom, COUNT(emprunt.id_livre)
FROM abonne,emprunt
WHERE abonne.id_abonne=emprunt.id_abonne
AND emprunt.date_rendu=NULL
GROUP BY abonne.prenom;



SELECT abonne.prenom,emprunt.date_sortie, livre.titre
FROM abonne,emprunt,livre
WHERE abonne.id_abonne=emprunt.id_abonne
AND livre.id_livre=emprunt.id_livre;


INSERT INTO abonne(prenom) VALUES ('ANDREI');




SELECT abonne.prenom, emprunt.id_livre
     FROM abonne, emprunt
     WHERE abonne.id_abonne = emprunt.id_abonne;



     -------JOINTURES EXTERNES-------------






     SELECT abonne.prenom, emprunt.id_livre
     FROM abonne
     LEFT JOIN emprunt on emprunt.id_abonne = abonne.id_abonne;






