--  ------------------------------  Transactions -------------------------------------------------------------

C -- Demarre la zone de mise en tampon
SELECT * FROM employes;
UPDATE employes SET prenom = 'test';
SELECT *FROM employes;
MariaDB [entreprise]> START TRANSACTION ;
Query OK, 0 rows affected (0.00 sec)

MariaDB [entreprise]> UPDATE employes SET prenom = 'test';
Query OK, 20 rows affected (0.01 sec)
Rows matched: 20  Changed: 20  Warnings: 0

MariaDB [entreprise]> SELECT *FROM employes;
+-------------+--------+----------+------+---------------+---------------+---------+
| id_employes | prenom | nom      | sexe | service       | date_embauche | salaire |
+-------------+--------+----------+------+---------------+---------------+---------+
|         350 | test   | Laborde  | m    | direction     | 1999-12-09    |    5100 |
|         388 | test   | Gallet   | m    | commercial    | 2000-01-15    |    2400 |
|         415 | test   | Winter   | m    | commercial    | 2000-05-03    |    3650 |
|         417 | test   | Dubar    | f    | production    | 2001-09-05    |    2000 |
|         491 | test   | Fellier  | f    | secretariat   | 2002-02-22    |    1700 |
|         509 | test   | Grand    | m    | comptabilite  | 2003-02-20    |    2000 |
|         547 | test   | Collier  | f    | commercial    | 2004-09-08    |    3200 |
|         592 | test   | Blanchet | f    | direction     | 2005-06-09    |    4600 |
|         627 | test   | Miller   | m    | commercial    | 2006-07-02    |    2000 |
|         655 | test   | Perrin   | f    | commercial    | 2006-09-10    |    2800 |
|         699 | test   | Cottet   | m    | secretariat   | 2007-01-18    |    1490 |
|         701 | test   | Vignal   | m    | informatique  | 2008-12-03    |    2100 |
|         739 | test   | Desprez  | m    | secretariat   | 2009-11-17    |    1600 |
|         780 | test   | Thoyer   | f    | communication | 2010-01-23    |    1600 |
|         802 | test   | Durand   | m    | informatique  | 2010-07-05    |    2350 |
|         854 | test   | Chevel   | m    | informatique  | 2011-09-28    |    1800 |
|         876 | test   | Martin   | f    | juridique     | 2012-01-12    |    3300 |
|         900 | test   | Lagarde  | m    | production    | 2013-01-03    |    2650 |
|         933 | test   | Sennard  | f    | commercial    | 2014-09-11    |    1900 |
|         990 | test   | Lafaye   | f    | assistant     | 2015-06-02    |    1875 |
+-------------+--------+----------+------+---------------+---------------+---------+
20 rows in set (0.00 sec)





ROLLBACK;-- Pour annuler toutes les opérations depuis le debut de la transaction
SELECT * FROM employes;

Query OK, 0 rows affected (0.00 sec)

 SELECT * FROM employes;
+-------------+-------------+----------+------+---------------+---------------+---------+
| id_employes | prenom      | nom      | sexe | service       | date_embauche | salaire |
+-------------+-------------+----------+------+---------------+---------------+---------+
|         350 | Jean-pierre | Laborde  | m    | direction     | 1999-12-09    |    5100 |
|         388 | Clement     | Gallet   | m    | commercial    | 2000-01-15    |    2400 |
|         415 | Thomas      | Winter   | m    | commercial    | 2000-05-03    |    3650 |
|         417 | Chloe       | Dubar    | f    | production    | 2001-09-05    |    2000 |
|         491 | Elodie      | Fellier  | f    | secretariat   | 2002-02-22    |    1700 |
|         509 | Fabrice     | Grand    | m    | comptabilite  | 2003-02-20    |    2000 |
|         547 | Melanie     | Collier  | f    | commercial    | 2004-09-08    |    3200 |
|         592 | Laura       | Blanchet | f    | direction     | 2005-06-09    |    4600 |
|         627 | Guillaume   | Miller   | m    | commercial    | 2006-07-02    |    2000 |
|         655 | Celine      | Perrin   | f    | commercial    | 2006-09-10    |    2800 |
|         699 | Julien      | Cottet   | m    | secretariat   | 2007-01-18    |    1490 |
|         701 | Mathieu     | Vignal   | m    | informatique  | 2008-12-03    |    2100 |
|         739 | Thierry     | Desprez  | m    | secretariat   | 2009-11-17    |    1600 |
|         780 | Amandine    | Thoyer   | f    | communication | 2010-01-23    |    1600 |
|         802 | Damien      | Durand   | m    | informatique  | 2010-07-05    |    2350 |
|         854 | Daniel      | Chevel   | m    | informatique  | 2011-09-28    |    1800 |
|         876 | Nathalie    | Martin   | f    | juridique     | 2012-01-12    |    3300 |
|         900 | Benoit      | Lagarde  | m    | production    | 2013-01-03    |    2650 |
|         933 | Emilie      | Sennard  | f    | commercial    | 2014-09-11    |    1900 |
|         990 | Stephanie   | Lafaye   | f    | assistant     | 2015-06-02    |    1875 |
+-------------+-------------+----------+------+---------------+---------------+---------+
20 rows in set (0.00 sec)



COMMIT ; -- Pour valider toutes les operations depuis le debut de la transaction

Query OK, 0 rows affected (0.00 sec)

-- Après un ROLLBACK ou un COMMIT, la trensaction est finie




-- --------------------TRANSACTION AVANCEE  & SAVEPOINT------------------------------



START TRANSACTION ;
SELECT *
FROM employes;
+-------------+-------------+----------+------+---------------+---------------+---------+
| id_employes | prenom      | nom      | sexe | service       | date_embauche | salaire |
+-------------+-------------+----------+------+---------------+---------------+---------+
|         350 | Jean-pierre | Laborde  | m    | direction     | 1999-12-09    |    5100 |
|         388 | Clement     | Gallet   | m    | commercial    | 2000-01-15    |    2400 |
|         415 | Thomas      | Winter   | m    | commercial    | 2000-05-03    |    3650 |
|         417 | Chloe       | Dubar    | f    | production    | 2001-09-05    |    2000 |
|         491 | Elodie      | Fellier  | f    | secretariat   | 2002-02-22    |    1700 |
|         509 | Fabrice     | Grand    | m    | comptabilite  | 2003-02-20    |    2000 |
|         547 | Melanie     | Collier  | f    | commercial    | 2004-09-08    |    3200 |
|         592 | Laura       | Blanchet | f    | direction     | 2005-06-09    |    4600 |
|         627 | Guillaume   | Miller   | m    | commercial    | 2006-07-02    |    2000 |
|         655 | Celine      | Perrin   | f    | commercial    | 2006-09-10    |    2800 |
|         699 | Julien      | Cottet   | m    | secretariat   | 2007-01-18    |    1490 |
|         701 | Mathieu     | Vignal   | m    | informatique  | 2008-12-03    |    2100 |
|         739 | Thierry     | Desprez  | m    | secretariat   | 2009-11-17    |    1600 |
|         780 | Amandine    | Thoyer   | f    | communication | 2010-01-23    |    1600 |
|         802 | Damien      | Durand   | m    | informatique  | 2010-07-05    |    2350 |
|         854 | Daniel      | Chevel   | m    | informatique  | 2011-09-28    |    1800 |
|         876 | Nathalie    | Martin   | f    | juridique     | 2012-01-12    |    3300 |
|         900 | Benoit      | Lagarde  | m    | production    | 2013-01-03    |    2650 |
|         933 | Emilie      | Sennard  | f    | commercial    | 2014-09-11    |    1900 |
|         990 | Stephanie   | Lafaye   | f    | assistant     | 2015-06-02    |    1875 |
+-------------+-------------+----------+------+---------------+---------------+---------+
20 rows in set (0.00 sec)
SAVEPOINT point1; -- Point de sauvegarde
UPDATE employes SET salaire = 1000;

MariaDB [entreprise]> SAVEPOINT point1;
Query OK, 0 rows affected (0.00 sec)

MariaDB [entreprise]> UPDATE employes SET salaire = 1000;
Query OK, 20 rows affected (0.01 sec)
Rows matched: 20  Changed: 20  Warnings: 0

MariaDB [entreprise]> SELECT * FROM employes;
+-------------+-------------+----------+------+---------------+---------------+---------+
| id_employes | prenom      | nom      | sexe | service       | date_embauche | salaire |
+-------------+-------------+----------+------+---------------+---------------+---------+
|         350 | Jean-pierre | Laborde  | m    | direction     | 1999-12-09    |    1000 |
|         388 | Clement     | Gallet   | m    | commercial    | 2000-01-15    |    1000 |
|         415 | Thomas      | Winter   | m    | commercial    | 2000-05-03    |    1000 |
|         417 | Chloe       | Dubar    | f    | production    | 2001-09-05    |    1000 |
|         491 | Elodie      | Fellier  | f    | secretariat   | 2002-02-22    |    1000 |
|         509 | Fabrice     | Grand    | m    | comptabilite  | 2003-02-20    |    1000 |
|         547 | Melanie     | Collier  | f    | commercial    | 2004-09-08    |    1000 |
|         592 | Laura       | Blanchet | f    | direction     | 2005-06-09    |    1000 |
|         627 | Guillaume   | Miller   | m    | commercial    | 2006-07-02    |    1000 |
|         655 | Celine      | Perrin   | f    | commercial    | 2006-09-10    |    1000 |
|         699 | Julien      | Cottet   | m    | secretariat   | 2007-01-18    |    1000 |
|         701 | Mathieu     | Vignal   | m    | informatique  | 2008-12-03    |    1000 |
|         739 | Thierry     | Desprez  | m    | secretariat   | 2009-11-17    |    1000 |
|         780 | Amandine    | Thoyer   | f    | communication | 2010-01-23    |    1000 |
|         802 | Damien      | Durand   | m    | informatique  | 2010-07-05    |    1000 |
|         854 | Daniel      | Chevel   | m    | informatique  | 2011-09-28    |    1000 |
|         876 | Nathalie    | Martin   | f    | juridique     | 2012-01-12    |    1000 |
|         900 | Benoit      | Lagarde  | m    | production    | 2013-01-03    |    1000 |
|         933 | Emilie      | Sennard  | f    | commercial    | 2014-09-11    |    1000 |
|         990 | Stephanie   | Lafaye   | f    | assistant     | 2015-06-02    |    1000 |
+-------------+-------------+----------+------+---------------+---------------+---------+
20 rows in set (0.00 sec)

SAVEPOINT point2;
UPDATE employes SET salaire = 5000;
ROLLBACK TO point2;
MariaDB [entreprise]> SAVEPOINT point2;
Query OK, 0 rows affected (0.00 sec)

MariaDB [entreprise]> UPDATE employes SET salaire = 5000;
Query OK, 20 rows affected (0.00 sec)
Rows matched: 20  Changed: 20  Warnings: 0

MariaDB [entreprise]> SELECT * FROM employes;
+-------------+-------------+----------+------+---------------+---------------+---------+
| id_employes | prenom      | nom      | sexe | service       | date_embauche | salaire |
+-------------+-------------+----------+------+---------------+---------------+---------+
|         350 | Jean-pierre | Laborde  | m    | direction     | 1999-12-09    |    5000 |
|         388 | Clement     | Gallet   | m    | commercial    | 2000-01-15    |    5000 |
|         415 | Thomas      | Winter   | m    | commercial    | 2000-05-03    |    5000 |
|         417 | Chloe       | Dubar    | f    | production    | 2001-09-05    |    5000 |
|         491 | Elodie      | Fellier  | f    | secretariat   | 2002-02-22    |    5000 |
|         509 | Fabrice     | Grand    | m    | comptabilite  | 2003-02-20    |    5000 |
|         547 | Melanie     | Collier  | f    | commercial    | 2004-09-08    |    5000 |
|         592 | Laura       | Blanchet | f    | direction     | 2005-06-09    |    5000 |
|         627 | Guillaume   | Miller   | m    | commercial    | 2006-07-02    |    5000 |
|         655 | Celine      | Perrin   | f    | commercial    | 2006-09-10    |    5000 |
|         699 | Julien      | Cottet   | m    | secretariat   | 2007-01-18    |    5000 |
|         701 | Mathieu     | Vignal   | m    | informatique  | 2008-12-03    |    5000 |
|         739 | Thierry     | Desprez  | m    | secretariat   | 2009-11-17    |    5000 |
|         780 | Amandine    | Thoyer   | f    | communication | 2010-01-23    |    5000 |
|         802 | Damien      | Durand   | m    | informatique  | 2010-07-05    |    5000 |
|         854 | Daniel      | Chevel   | m    | informatique  | 2011-09-28    |    5000 |
|         876 | Nathalie    | Martin   | f    | juridique     | 2012-01-12    |    5000 |
|         900 | Benoit      | Lagarde  | m    | production    | 2013-01-03    |    5000 |
|         933 | Emilie      | Sennard  | f    | commercial    | 2014-09-11    |    5000 |
|         990 | Stephanie   | Lafaye   | f    | assistant     | 2015-06-02    |    5000 |
+-------------+-------------+----------+------+---------------+---------------+---------+
20 rows in set (0.00 sec)

SAVEPOINT point3;
DELETE FROM employes;

MariaDB [entreprise]> SAVEPOINT point3;
Query OK, 0 rows affected (0.00 sec)

MariaDB [entreprise]> DELETE FROM employes;
Query OK, 20 rows affected (0.01 sec)

MariaDB [entreprise]> SELECT * FROM employes;
Empty set (0.00 sec)

ROLLBACK TO point2; -- On annule les opérations éxécutées après le point2
SELECT * FROM employes;
+-------------+-------------+----------+------+---------------+---------------+---------+
| id_employes | prenom      | nom      | sexe | service       | date_embauche | salaire |
+-------------+-------------+----------+------+---------------+---------------+---------+
|         350 | Jean-pierre | Laborde  | m    | direction     | 1999-12-09    |    1000 |
|         388 | Clement     | Gallet   | m    | commercial    | 2000-01-15    |    1000 |
|         415 | Thomas      | Winter   | m    | commercial    | 2000-05-03    |    1000 |
|         417 | Chloe       | Dubar    | f    | production    | 2001-09-05    |    1000 |
|         491 | Elodie      | Fellier  | f    | secretariat   | 2002-02-22    |    1000 |
|         509 | Fabrice     | Grand    | m    | comptabilite  | 2003-02-20    |    1000 |
|         547 | Melanie     | Collier  | f    | commercial    | 2004-09-08    |    1000 |
|         592 | Laura       | Blanchet | f    | direction     | 2005-06-09    |    1000 |
|         627 | Guillaume   | Miller   | m    | commercial    | 2006-07-02    |    1000 |
|         655 | Celine      | Perrin   | f    | commercial    | 2006-09-10    |    1000 |
|         699 | Julien      | Cottet   | m    | secretariat   | 2007-01-18    |    1000 |
|         701 | Mathieu     | Vignal   | m    | informatique  | 2008-12-03    |    1000 |
|         739 | Thierry     | Desprez  | m    | secretariat   | 2009-11-17    |    1000 |
|         780 | Amandine    | Thoyer   | f    | communication | 2010-01-23    |    1000 |
|         802 | Damien      | Durand   | m    | informatique  | 2010-07-05    |    1000 |
|         854 | Daniel      | Chevel   | m    | informatique  | 2011-09-28    |    1000 |
|         876 | Nathalie    | Martin   | f    | juridique     | 2012-01-12    |    1000 |
|         900 | Benoit      | Lagarde  | m    | production    | 2013-01-03    |    1000 |
|         933 | Emilie      | Sennard  | f    | commercial    | 2014-09-11    |    1000 |
|         990 | Stephanie   | Lafaye   | f    | assistant     | 2015-06-02    |    1000 |
+-------------+-------------+----------+------+---------------+---------------+---------+
20 rows in set (0.00 sec)



ROLLBACK TO point3; --  SAVEPOINT point3 does not exist;
MariaDB [entreprise]> ROLLBACK TO point3;
ERROR 1305 (42000): SAVEPOINT point3 does not exist;

ROLLBACK TO point1;
Query OK, 0 rows affected (0.00 sec)




