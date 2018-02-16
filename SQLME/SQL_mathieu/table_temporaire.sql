--# TABLES TEMPORAIRES
USE bibliotheque;
CREATE TEMPORARY TABLE emprunt2014 AS SELECT * FROM emprunt WHERE date_sortie LIKE '2014%';

SHOW TABLES;
SELECT * FROM emprunt2014;

--# Une table temporaire est construite à partir d'une requete et de colonnes de tables existantes.
--# pratique pour isoler des résultats afin de faire des tests dessus sans impacter les données d'origine.
--# ATTENTION: les données d'un table temporaire ne sont pas liées aux données d'origine. Si je modifie une donnée sur la table temporaire, cela n'impactera pas les données sur la table d'origine.

--# Durée de vie très courte. Si le ferme la console (session) la table est supprimée automatiquement.
