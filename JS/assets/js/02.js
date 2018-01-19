// -- Déclarer un Tableau Indexé
var monTableau = [];
var myArray = new Array;

monTableau[0]="Adeline";
monTableau[1]="Hugo";
monTableau[2]="Arnaud";

console.log(monTableau);// -- Affiche toutes les données
console.log(monTableau[0]);// -- Adeline
console.log(monTableau[2]);// -- Arnaud

var nosPrenoms = ["Hana","John","Maxime","Adnane","Andrei"];
console.log(nosPrenoms);

// -- Déclarer et Affecter des Valeurs à un objet.
// -- ⛔️PAS DE TABLEAU ASSOCIATIF EN JAVASCRIPT!!!!!!!⛔️
var coordonnee = {
    prenom : "Andrei",
    nom    : "Rosu",
    age    : 38
};
console.clear();
console.log(coordonnee);
console.log(coordonnee['prenom']);
console.log(coordonnee.nom);


// -- Je vais créer 2 tableaux numeriques
var listeDePrenoms = ["Hugo","Rodrigue","Kristie"];
var listeDeNoms    = ["Liegeard","Nouel","Soukai"];

// -- Je vais créer un tableau à 2 dimensions à partir de mes 2 tableaux
var annuaire = [listeDePrenoms, listeDeNoms];

// -- Afficher un Nom et un Pfrenom sur ma page HTML
document.write( annuaire[0][1]);
document.write(' ');
document.write(annuaire[1][1]);
console.clear();

/* Créez un tableau a 2 dimensions appelé "annuaireDesStagiaires" qui
contiendra les coordonnées pour chaque stagiaire :Nom,Prenom,Tel */


var listeDePrenoms = ["Andrei","Jonathan","Hana","Vincent"];
var listeDeNoms    = ["Rosu","Chemla","Mattei","Nierat"];
var listeDesTels   = ["068520564","063258933","078953624","0688765225"];

var annuaireDesStagiaires = [listeDePrenoms,listeDeNoms,listeDesTels];
console.log(annuaireDesStagiaires);

// -- Ajouter un élément

var coleurs = ['rouge','vert','jaune'];
// -- Si je souhaite ajouter un élémengt dans mon tableau
// -- Je fais appel à la fonction push() qui me renvoi le nb d'éléments
console.log(coleurs);
var nombreElementsDeMonTableau = coleurs.push('orange');
console.log(coleurs);
console.log(nombreElementsDeMonTableau);
/* -- NB : La fonction unshift() permet d'ajouter un ou plusieurs éléments 
en début de tableau.*/

// RECUPERER ET SORTIR LE DERNIER ELEMENT
/* La fonction pop() me permet de suprimer un ou plusieurs éléments de mon tableau et d'en recuperer la valeur.
Je peux accessoirement récuperer cette valeur dans une variable.*/
var monDernierElement = coleurs.pop();
console.log(coleurs);
console.log(monDernierElement);
// -- La même chose est possible avec le premier élément


