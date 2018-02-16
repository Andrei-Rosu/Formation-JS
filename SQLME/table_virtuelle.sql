


--########################TABLES VIRTUELLES- VUES#####################################--


USE entreprise;
CREATE VIEW vue_homme AS SELECT * FROM employes WHERE sexe = "m";

 SELECT * FROM vue_homme;
+-------------+-------------+---------+------+--------------+---------------+---------+
| id_employes | prenom      | nom     | sexe | service      | date_embauche | salaire |
+-------------+-------------+---------+------+--------------+---------------+---------+
|         350 | Jean-pierre | Laborde | m    | direction    | 1999-12-09    |    5100 |
|         388 | Clement     | Gallet  | m    | commercial   | 2000-01-15    |    2400 |
|         415 | Thomas      | Winter  | m    | commercial   | 2000-05-03    |    3650 |
|         509 | Fabrice     | Grand   | m    | comptabilite | 2003-02-20    |    2000 |
|         627 | Guillaume   | Miller  | m    | commercial   | 2006-07-02    |    2000 |
|         699 | Julien      | Cottet  | m    | secretariat  | 2007-01-18    |    1490 |
|         701 | Mathieu     | Vignal  | m    | informatique | 2008-12-03    |    2100 |
|         739 | Thierry     | Desprez | m    | secretariat  | 2009-11-17    |    1600 |
|         802 | Damien      | Durand  | m    | informatique | 2010-07-05    |    2350 |
|         854 | Daniel      | Chevel  | m    | informatique | 2011-09-28    |    1800 |
|         900 | Benoit      | Lagarde | m    | production   | 2013-01-03    |    2650 |
+-------------+-------------+---------+------+--------------+---------------+---------+
11 rows in set (0.01 sec)

-- Pour supprimer une vue

DROP VIEW vue_homme;





MariaDB [entreprise]> CREATE SCHEMA nom_de_la_bdd;
Query OK, 1 row affected (0.02 sec)

MariaDB [entreprise]> SHOW databases;
+--------------------+
| Database           |
+--------------------+
| bibliotheque       |
| entreprise         |
| information_schema |
| mysql              |
| nom_de_la_bdd      |
| performance_schema |
| phpmyadmin         |
| test               |
| wordpress_front    |
+--------------------+
9 rows in set (0.01 sec)