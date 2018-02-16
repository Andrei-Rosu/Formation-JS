--# LES TRANSACTIONS
USE entreprise;
START TRANSACTION; -- demarre la zone de la mise en tampon
SELECT*FROM employes;
UPDATE employes SET prenom = 'test';
SELECT*FROM employes;

-- pour annuler toutes les operations ( requetes) depuis le debut de la transaction:
ROLLBACK;
SELECT*FROM employes;

-- pour valider toutes les operations depuis le debut de la transaction
COMMIT;

-- apres un ROLLBACK ou un COMMIT, la transaction est finie

--# TRA?SACTION AVANCEE & SAVEPOINT
START TRANSACTION;
SELECT*FROM employes;

SAVEPOINT point1; -- point de sauvegarde
UPDATE employes SET salaire = 1000;
SELECT*FROM employes;

SAVEPOINT point2; 
UPDATE employes SET salaire = 5000;
SELECT*FROM employes;

SAVEPOINT point3; 
DELETE FROM employes;
SELECT*FROM employes;

ROLLBACK TO point2; -- on annule les operations executees apres le point 2
SELECT*FROM employes;

ROLLBACK TO point3; -- n'existe plus car ça a ete annulé precedemment

ROLLBACK TO point1;
SELECT*FROM employes;

COMMIT; -- pour valider les operations
ROLLBACK; -- annule tout depuis le start transaction