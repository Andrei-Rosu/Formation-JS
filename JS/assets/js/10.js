//-------------------------LES OPERATEURS LOGIQUES---------------------------------------------------//

// -- L'operateur ET:&& ou AND -- //
/* Si la combinaison email user et email correspond ET la combinaison mdpuser et mdp correspond.

--> Dans cette condition, les 2 doivent OBLIGATOIREMENT correspondre pour etre validée.
ex. if(emailUser == email && mdpUser ==mdp) {...}

######### L'operateur ou || ou or  ################# 
 Si la combinaison email user et email correspond ET/OU  la combinaison mdpuser et mdp correspond.
 --> Dans cette condition, ou moins l'une des deux doit correspondre pour etre validéé
 ex. if(emailUser == email || mdpUser ==mdp) {...}

 #######L'operateur " ! " ou encore NOT############

 var monUtilisateurEstApprouve = true;
 if(!monUtilisateurEstApprouve) {...}
 Mon Utilisateur n'est pas approuvé.
 Reviens à écrire /
 if(monUtilisateurEstApprouvé == false) {...}