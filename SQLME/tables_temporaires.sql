CREATE TEMPORARY TABLE emprunt_2014 AS SELECT * FROM emprunt WHERE date_sortie like '2014%';


Query OK, 5 rows affected (0.04 sec)
Records: 5  Duplicates: 0  Warnings: 0


SHOW TABLES ;


+------------------------+
| Tables_in_bibliotheque |
+------------------------+
| abonne                 |
| emprunt                |
| livre                  |
+------------------------+
3 rows in set (0.00 sec)


SELECT * FROM emprunt_2014;

+------------+----------+-----------+-------------+------------+
| id_emprunt | id_livre | id_abonne | date_sortie | date_rendu |
+------------+----------+-----------+-------------+------------+
|          1 |      100 |         1 | 2014-12-17  | 2014-12-18 |
|          2 |      101 |         2 | 2014-12-18  | 2014-12-20 |
|          3 |      100 |         3 | 2014-12-19  | 2014-12-22 |
|          4 |      103 |         4 | 2014-12-19  | 2014-12-22 |
|          5 |      104 |         1 | 2014-12-19  | 2014-12-28 |
+------------+----------+-----------+-------------+------------+
5 rows in set (0.00 sec)

-- Une table otemporaire est construite à ppartir d'unerequete et des colonnes de tables existantes
-- Elle est pratique pour isoler des resultats afin de faire des tests dessus sans impacter les donnéés d'origine
-- ATTENTION!!!: Les données d'une table temporaire ne son pas liées aux données d'origine.
-- Si je modifie les données dans la table temporaire, cela n'impactera pas les données sur la table d'origine.
-- Durée de vie très courte . Si je ferme la console(session) la table temporaire est supprimée.
-- Les tables temporaires ne sont affiches dans la liste des tables
-- Les tables temporaires existent seulement autant que la sesssion en cours
-- Les trables temporaires ne partagent pas information

