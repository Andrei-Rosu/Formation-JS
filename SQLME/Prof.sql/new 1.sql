-- qui conduit la voiture 503 imbriq et jointure
SELECT prenom
FROM conducteur 
WHERE id_conducteur IN (SELECT id_conducteur FROM association_vehicule_conducteur WHERE id_vehicule = '503'); -- pas obligé les guillements

SELECT nom, prenom
FROM conducteur c, association_vehicule_conducteur avc
WHERE avc.id_vehicule = 503
AND c.id_conducteur = avc.id_conducteur;

-- qui conduit quoi
-- ajoutez vous dans la table conducteur
	-- afficher tous les conducteurs (sans exception) pour ensuite rajouter les vehicules conduit si c'est le cas

-- ajoutez un nouveau vehicule
	-- afficher tous les vehicules (sans exception) pour ensuite rajouter les conducteurs si c'est le cas

-- afficher tous les conducteurs ainsi que tous les vehicules  (sans exception) peu importe les correspondances

-- qui conduit la voiture 503



-- SELECT id_livre FROM emprunt WHERE id_abonne IN 
	-- (SELECT id_abonne FROM abonne WHERE prenom = 'chloe');


-- qui conduit quoi
SELECT prenom, marque
FROM conducteur, vehicule
WHERE conducteur.id_conducteur = vehicule.id_conducteur
AND vehicule.id_vehicule = association_vehicule_conducteur.id_vehicule;


SELECT prenom, nom, marque, modele
FROM conducteur, vehicule
WHERE conducteur.id_conducteur = vehicule.id_vehicule
AND 



	SELECT prenom, titre, date_sortie
FROM abonne, livre, emprunt
WHERE abonne.id_abonne = emprunt.id_abonne
AND emprunt.id_livre = livre.id_livre; 