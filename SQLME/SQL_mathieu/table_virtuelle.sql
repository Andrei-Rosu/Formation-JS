--# TABLES VIRTUELLES - VUES
USE entreprise;
CREATE VIEW vue_homme AS SELECT * FROM employes WHERE sexe = "m";

SHOW TABLES;

--# Pour supprimer une vue
DROP VIEW vue_homme;

--# Pour voir les vues
USE information_schema;
SELECT * FROM views;

--# 
--# Dans une table virtuelle (vue) nous sauvegardons la requete permettant d'arriver à ce résultat.
--# Pratique pour isoler des informations issu d'une requete compliquée pour ensuite faire d'autres requetes sur ce resultat.
--# ATTENTION: les données de la table virtuelle sont les mêmes que celles d'origine, si je modifie une donnée sur la table virtuelle, cette donnée sera aussi modifiée sur la table d'origine et l'inverse également.
















