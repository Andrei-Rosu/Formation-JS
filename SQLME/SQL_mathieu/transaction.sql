--# TRANSACTION
USE entreprise;
START TRANSACTION; --# Demarre la zone de la mise en tampon.
SELECT * FROM employes;
UPDATE employes SET prenom = "test";
SELECT * FROM employes;

--# Pour annuler toutes les opérations depuis le début de la transaction:
ROLLBACK;
SELECT * FROM employes;

--# Pour valider toutes les opérations depuis le début de la transaction:
COMMIT;

--# Après un ROLLBACK ou un COMMIT, la Transaction est finie.

--# TRANSACTION AVANCEE & SAVEPOINT
START TRANSACTION;
SELECT * FROM employes;

SAVEPOINT point1; --# point de sauvegarde
UPDATE employes SET salaire = 1000;
SELECT * FROM employes;

SAVEPOINT point2;
UPDATE employes SET salaire = 5000;
SELECT * FROM employes;

SAVEPOINT point3;
DELETE FROM employes;
SELECT * FROM employes;

ROLLBACK TO point2; --# on annule les opérations exécutées après le point2
SELECT * FROM employes;

ROLLBACK TO point3; --# ERROR 1305 (42000): SAVEPOINT point3 does not exist
ROLLBACK TO point1; --# ok car précédant au point2

COMMIT; --# pour valider les opérations
ROLLBACK; --# Annule tout depuis le start transaction.






