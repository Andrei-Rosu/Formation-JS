/*-----------------------Les EVENEMENTS--------------------------------------*/


/* Les évènements vont me permetre se déclencher une fonction, c'est à dire une série d'instructions;
suite à une action de mon utilisateur...

Objectif:
 Etre en mesure de capturer ces évènements afin d'executer une fonction



 ----------------Les évènements: MOUSE-----------------------------------------

 click     : au click sur un élément
 mouseenter: la souris passe au dessus de la zone d'un élément
 mouseleave: la souris sors de cette zone



  ----------------Les évènements: KEYBOARD---------------------------------------
keydown    : une touche du clavier est enfoncée
keyup      : une touche du clavier à été relachée



----------------Les évènements: WINDOW-------------------------------------------
scroll     : défilement de la fenêtre
resize     : redimentionnement de la fenêtre



----------------Les évènements: FORM-------------------------------------------
change     : pour les éléments <input>, <select> et <textarea> ;
submit     : à l'envoi(soumission) du formulaire
input      : pour capter la saisie d'un utilisateur su un champ <input>





##################################LES ECOUTEURS###################################

Pour attacher un évènement à un élément, ou autrement dit, 
pour déclarer un écouteur d'évènement qui se chargera de déclencher
 une fonction, je vais utiliser la syntaxe suivante:

------------------------------------------------------------------------------*/


/*<input type="text" id="myInput" oninput="myFunction()">

<p id="demo"></p>*/

var input = document.createElement('input');
input.setAttribute('type','text')
input.setAttribute('placeholder','Input your text')
input.id = "myInput";
document.body.appendChild(input);



function voirLaSaisie() {
    alert(input.value);
}
input.addEventListener('change', voirLaSaisie );



/*----------------------------------------------------------------------------*/

// -- Création du champ input
var input = document.createElement('input');
document.body.appendChild(p);

// -- Attribution d'un Attribut
input.setAttribute('type', 'text');
input.setAttribute('placeholder', 'Saisissez un Contenu...');

//-- Attribution d'un ID
input.id = "MonID";

// -- Ajout dans la page
document.body.appendChild(input);

function voirLaSaisieDeMonInput() {
    console.log(input.value);
    alert(input.value);
}

input.addEventListener('change', voirLaSaisieDeMonInput);


/*---------------------------------------------------------------------------*/






