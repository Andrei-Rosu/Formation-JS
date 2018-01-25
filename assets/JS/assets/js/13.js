var BaseDeDonnees = [
    {'prenom':'Hugo',
    'nom':'LIEGEARD',
    'email':'wf3@hl-media.fr',
    'mdp':'wf3'},
    {'prenom':'Rodrigue',
    'nom':'NOUEL',
    'email':'rodrigue@hl-media.fr',
    'mdp':'wf3'},
    {'prenom':'Nathanael','nom':'DORDONNE','email':'nathanael.d@hl-media.fr','mdp':'wf3'}
];


/*var mdp="wf3";

var eMail=prompt("Saisir son couriel")
if (eMail||BaseDeDonnees.email){
var Mdp=prompt("Mot de Passe")}
else {
    
    alert(" OFF!!!");
}
if (Mdp===mdp){
    document.write("Welcome")}
    else {
        alert("Fuck OFF!!!")
    }*/

    var BaseDeDonnees = [
        {'prenom':'Hugo','nom':'LIEGEARD','email':'wf3@hl-media.fr','mdp':'wf3'},
        {'prenom':'Rodrigue','nom':'NOUEL','email':'rodrigue@hl-media.fr','mdp':'wf3'},
        {'prenom':'Nathanael','nom':'DORDONNE','email':'nathanael.d@hl-media.fr','mdp':'wf3'}
    ];
            
    // -- LesFlemards.js
    function l(e) {
        console.log(e);
    }
    
    function w(f) {
        document.write(f);
    }
    
    // -- Déclaration de Variable
    // -- EstCeQueLeMailEstDansLeTableau = faux;
    var isEmailInArray = false;
    
    // -- 1. Demander à l'utilisateur son email
    var email   = prompt('Bonjour, Quel est votre email ?','<Saisissez votre email>');
    var mdp     = prompt('votre mot de passe ?','<Saisissez votre mot de passe>');
    
    // -- 2. Parcourir l'ensemble des données de mon tableau
    for(let i = 0 ; i < BaseDeDonnees.length ; i++) {
    
        if(email === BaseDeDonnees[i].email && mdp === BaseDeDonnees[i].mdp ) {
    
            // -- J'ai trouvé une correspondance dans ma BDD
            isEmailInArray = true;
            w('Bonjour ' + BaseDeDonnees[i].prenom + ' !');
    
            // -- Je stop la boucle for, j'ai trouvé ce que je cherche...
            break;
    
        }
    
    }
    
    if(!isEmailInArray) {
        alert('ATTENTION, Email / Mot de Passe incorrect !');
    }