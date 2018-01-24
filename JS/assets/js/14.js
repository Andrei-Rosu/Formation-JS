



/*-----------------------------LE DOM---------------------------------*/





/* Le DOM est une interface de developpement en JS pour HTML.Grâce au DOM,
je vais être en mesure d'acceder/modifier mon HTML.
L'objet "document": c'est le point d'entrée vers mon contenu HTML.
Chaque page chargée dans mon navigateur à un objet "document".



---------------------------------------------------------------------------


Comment puis-je faire
 pour récupérer les differentes informations de ma page HTML?

---------------------document.getElementById--------------------------------

document.getElementById() est une fonction qui va permetre
 de récupérer un élément HTML à partir de son identifiant unique:ID

--------------------------------------------------------------------------------

*/

var bonjour = document.getElementById('bonjour');
console.log(bonjour);

/*---------------------document.getElementsByClassName--------------------------------

document.getElementById() est une fonction qui va permetre
 de récupérer un ou plusieurs éléments HTML à partir de son classe

--------------------------------------------------------------------------------*/

var contenu = document.getElementsByClassName('contenu');
console.log(contenu);


/* ---- Cette fonction me renvoie 
un tableau JS avec mes éléments HTML(collection HTML)*/





/*-----------------------------document.getElementsByTagName-----------------
document.getElementsByTagName()est une fonction qui va permetre
 de récupérer un ou plusieurs éléments HTML à partir de leur *nom de balise*
                                         

--------------------------------------------------------------------------------*/

var span = document.getElementsByTagName('span');
console.log(span);









