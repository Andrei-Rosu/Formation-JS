// -----------------LES FONCTIONS-----------------------//

// -- Déclarer une fonction

//NB -> Cette fonction ne prends pas des paramètres
// et ne retourne aucune valeur

function bonjour(){
    // C'est SELEMENT lors de l'appel de la fonction qu'elle va s'executer
    alert('Bonjour');

    //Je vais appeler la fonction et la déclencher
}
//bonjour();//J'appelle la fonction



// -----------------Appeler et utiliser une fonction
function ditBonjour(prenom, nom){
    document.write("<p>Bonjour <strong>" + prenom + " " + nom +"</strong></p>")
}
ditBonjour("Andrei", "Rosu");

function addition(n1, n2){
   return nb1 + nb2;
}

document.write("<p>" + addition(10,5))