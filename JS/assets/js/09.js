/* -------------------------------
            EXERCICE :
J'arrive sur un Espace Sécurisé au moyen 
d'un email et d'un mot de passe.

Je doit saisir mon email et mon mot de passe afin d'être authentifié sur le site.

En cas d'échec une alert m'informe du problème.
Si tous se passe bien, un message de bienvenue m'accueil.
-------------------------------- */

// -- BASE DE DONNEES
/*var email, mdp;

email = "wf3@hl-media.fr";
mdp = "wf3";*/

var email="wf3@hl-media.fr";
var mdp="wf3";
var eMail=prompt("Saisir son couriel")
if (eMail===email){
var Mdp=prompt("Mot de Passe")}
else {
    
    document.location.href = "http://lmgtfy.com/?q=comment+hacker+un+compte";
}
if (Mdp===mdp){
    document.write("Welcome")}
    else {
        alert("Fuck OFF!!!")
    }


    // -- BASE DE DONNEES
var email, mdp;

email = "wf3@hl-media.fr";
mdp = "wf3";

// -- 1. Demander à l'utilisateur son adresse email
var emailUser = prompt("Bonjour, Quel est votre email ?","<Saisissez votre email>");

// -- 2. Je vérifie si l'email saisie (emailUser) correspond avec la BDD (email)
if(emailUser === email) {
    // -- 2a. Tous est ok, je continue la vérification avec le mot de passe...

    // -- 2a1. On demande a l'utilisateur son mot de passe
    var mdpUser = prompt("votre mot de passe ?","<Saisissez votre mot de passe>");

    // -- 2a2. Vérification du mot de passe
    if(mdpUser === mdp) {
        alert('Bienvenue !');
    } else {
        alert("ATTENTION, nous n'avons pas reconnu votre mot de passe.");
    }

} else {
    // -- 2b. Les emails ne correspondent pas...
    alert("ATTENTION, nous n'avons pas reconnu votre adresse email.");
}






// -- Exemple avec les Fonctions

function monUtilisateurEstCorrect(emailUser, mdpUser) {
    if(emailUser === email && mdpUser === mdp) {
        return true;
    } else {
        return false;
    }
}

var emailUser = prompt("Bonjour, Quel est votre email ?","<Saisissez votre email>");
var mdpUser = prompt("votre mot de passe ?","<Saisissez votre mot de passe>");

if(monUtilisateurEstCorrect(emailUser,mdpUser)) {
    alert('Bienvenue ' + emailUser);
} else {
   alert('ATTENTION, email/mot de passe incorrect.');
}


