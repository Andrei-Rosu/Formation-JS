var debutDePhrase = "Aujourd'hui ";
var dateDuJour = new Date();
var suiteDePhrase = ", sont présents : ";
var nombreDeStagiaire = 12 ;
var finDePhrase = " stagiaires.<br>";

// Nous souhaitons  afficher tout dans un seul morceau
document.write(debutDePhrase + dateDuJour.getDate() +"/" + (dateDuJour.getMonth() + 1) + "/" + dateDuJour.getFullYear() + suiteDePhrase + nombreDeStagiaire + finDePhrase);


//Exercise



var phrase1 = "Je m'appelle ";
var phrase2 = "Andrei et j'ai ";
var age     = 38;
var phrase3 = " ans !";

document.write(phrase1 + phrase2 + age + phrase3);





