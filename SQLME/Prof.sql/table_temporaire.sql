--# TABLES TEMPORAIRES : données nonpartagees, dure de vie d'une console, si on la ferme et reouvre ça n'existe plus
USE bibliotheque;
CREATE TEMPORARY TABLE emprunt2014 AS SELECT*FROM emprunt WHERE date_sortie LIKE "2014%";

SHOW TABLES;
SELECT*FROM emprunt2014;

--# une table temporaire est construite à partir d'une requete et de colonnes de tables existantes.
--# pratique pour isoler des resultats et les manipuler, faire des tests dessus sans impacter les données d'origine
--# les données d'une table temporaire ne sont pas liées aux données d'origine : si je modif une donnée sur la table temporaire, cela n'impactera pas les données sur la table d'origine.

--# duree de vie tres courte, si je ferme la console ( session) la table est supprimée automatiquement.
