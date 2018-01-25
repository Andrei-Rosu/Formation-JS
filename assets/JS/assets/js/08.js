//--------------------------------LES CONDITIONS--------------------------------------//


/*var majoriteLegaleFR = 18;
if(14>= MajoriteLegaleFR){
    alert('Bienvenue !');
}
else{
    alert('Google');
}*/

//-------------------------------------------------------------//
/* -------------------------------
          EXERCICE 
Créer une fonction permettant de vérifier l'age d'un visiteur (prompt).
S'il a la majorité légale, alors je lui souhaite la bienvenue, 
sinon, je fait une redirection sur Google après lui avoir signalé le soucis.
-------------------------------- */


function checkAge()
{

var min_age = 18;


var year = parseInt(document.forms["age_form"]["year"].value);
var month = parseInt(document.forms["age_form"]["month"].value) - 1;
var day = parseInt(document.forms["age_form"]["day"].value);

var theirDate = new Date((year + min_age), month, day);
var today = new Date;

if ( (today.getTime() - theirDate.getTime()) < 0) {
    window.location.href = 'http://www.google.com/';
return false;
}
else {

return true;
}
}

/* -------------------------------
          EXERCICE 
Créer une fonction permettant de vérifier l'age d'un visiteur (prompt).
S'il a la majorité légale, alors je lui souhaite la bienvenue, 
sinon, je fait une redirection sur Google après lui avoir signalé le soucis.
-------------------------------- */

// -- 1. Déclarer la Majorité Légale
var MajoriteLegaleFR = 18;

// -- 2. Créer une fonction pour demande son age.

function verifierAge(age) {
    if(age >= MajoriteLegaleFR) {
        return true;
    } else {
        return false;
    }
}

// -- 3. Je demande a l'utilisateur son age
var age = parseInt( prompt("Bonjour, Quel age avez-vous ?","<Saisissez votre Age>") );

// -- 4. Vérification de l'age de l'utilisateur...
if(verifierAge(age)) {
    // -- 4a. J'affiche un message de bienvenue
    alert("Bienvenue sur mon site internet réservé pour les majeurs...");
    document.write('0_0 !!!');
}
else {
    // -- 4b. J'effectue une redirectionù
    document.location.href = "http://fr.lmgtfy.com/?q=Majorit%C3%A9+L%C3%A9gale+en+France";
}



// -------------------------------------LES OPERATEURS DE COMPARAISON------------------------------------------- //
/*L'operateur de comparaison"==" signifie -> égal à. il permet de vérifier si 2 variables sont identiques"
  L'operateur de comparaison "===" signifie strictement égal. Il va comparer la valeur et le type.
  L'operateur de comparaison"!=" :différent de
  L'operateur de comparaison "!==" strictement différent de     */
  




