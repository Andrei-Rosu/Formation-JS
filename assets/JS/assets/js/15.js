
/*---------------------La manipulation des contenus-----------------------------*/
function l(e){
    console.log(e);
}

function w(j){
    document.write(j);
}

/* On peut écrire la fonction ECMA6


l = e => console.log(e);

*/

// Je sohaite récupérer mon lien Google

var google = document.getElementById('google');
l(google);

// Maintenant, je souhaite acceder aux informations de ce lien...

// -- A : Le lien vers lequel pointe la balise
l(google.href);

// -- B : L'id de la balise
l(google.id);

// -- C : La classe de la balise
l(google.className);

// -- D : Le text de la balise
l(google.textContent)


/*   Maintenant, je souhaite modifier le contenu de mon lien

Comme une variable clasique,
 je vais simplement venir affecter une nouvelle valeur  à mon 'textContent'

*/

//google.textContent = "Mon Lien Vers Le Lavage du Cerveau";

/*------------------------------Ajouter un élement----------------------------*/

/*-----------Nous allons utiliser 2 methodes:

1. La fonction document.createElement() va permattre de générer un nouvel élément dans le DOM.
Je pourrai par suite modifier avec les méthodes que nous venons de voir...
PS : Ce nouvel élément est placé dans la memoire ----------------------------*/

// -- Définition de l'élément
//var span = document.createElement('span');

// -- Si je souhaite lui donner un ID
//span.id = "MonSpan";

// -- Si je souhaite lui attribuer du contenu
//span.textContent = " Mon beau Texte en JS";

// -- Comment ajouter un élément dans la page
//google.appendChild(span);



/*

var text = document.createElement("h1");

var node = document.createElement("a")
HTMLHeadingElement.id = h;
var g = document.getElementById('h');

g.href = ("https://www.zalmo.eu");
var href = document.createElement('href');
h.appendChild(href);//



/* -------------------------------
            EXERCICE
En partant du travail déjà réalisé sur la page.
Créez directement dans la page une balise <h1></h1> ayant comme contenu : 
"Titre de mon Article".

Dans cette balise, vous créerez un lien vers une url de votre choix.
BONUS : Ce lien sera de couleur Rouge et non souligné.
-------------------------------- */

// -- Création de la balise h1
var h1 = document.createElement('h1');

// -- Création de la balise a
var a = document.createElement('a');

// -- Titre de mon Article
a.textContent = "Titre de mon Article";

// -- Je donne un lien à mon lien
a.href="#";

// -- Je met mon lien a, dans mon h1
h1.appendChild(a);

// -- Je met mon h1 dans la page
document.body.appendChild(h1);

//  -- Je veux que mon lien soit de couleur rouge
a.style.color = "red";

 // -- Je veux que mon lien ne soit pas souligné
 a.style.textDecoration = "none";


