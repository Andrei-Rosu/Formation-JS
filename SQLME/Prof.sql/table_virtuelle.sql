-- une table virtuelle est ce qu'on appelle une vue

--# TABLES VIRTUELLES - VUES

USE entreprise;
CREATE VIEW vue_homme AS SELECT*FROM employes WHERE sexe = 'm';

SHOW TABLES;

SELECT*FROM vue_homme;

--# pour supprimer une vue 
DROP VIEW vue_homme;

-- CREATE DATABASE = CREATE SCHEMA 

--# pour voir les vue
USE information_schema;
SELECT*FROM views;

--# dans une table virtuelle ( vue ) nous sauvegardons la requete permettant d'arriver à ce resultat
--# pratique pour isoler des infos issues d'une requete compliquée pour ensuite faire d'autres requetes sur ce resultat.
--# ATTENTION : les données de la table virtuelle sont les mêmes que celles d'origine, si je modif une donnée sur la table virtuelle, cette donnee sera aussi modifiee sur la table d'origine et l'inverse egalement.
