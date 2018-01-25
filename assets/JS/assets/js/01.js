//alert('WoW');
//alert('Well done');
//deux slash pour faire un comentaire uniligne
/*Ici, je peux faire un comentaire sur
plusieurs lignes


RACCOURCI:CTRL + /
       ou:CTRL + SHIFT + /


*/

//--1: Déclarer une variable en JS
var Prenom;
//--2 Affecter une valeur
Prenom="Hugo";
//--3 Aficher la valeur de ma variable dans la console.
console.log(Prenom);

//Les types de variables

//-- Ici, typeof me permet de commaitre le type de ma variable
console.log(typeof Prenom);

//-- Déclaration d'un Nombre
var Age = 40;

//--Afficher dans la console
console.log(Age);

//--Connaitre son type
console.log(typeof Age);

              //------------------LA PORTEE DES VARIABLES-------------------------//


/*------------------------------------------------------------------------------------------------
| Les variables déclarées directement à la racine du fichier JS sont appelées                      |
| variantes globales.                                                                              |
| Elles sont disponibles dans l'ensemble de votre document y compris dans les fonctions            |
| #####                                                                                            |
| Les variables déclarées à l'interieur d'une fonction sont appelés variables locales              |
| #####                                                                                            |
| Depuis ECMA 6 vous puvez déclarer une variable avec le mot-clé->"let".                           |
| Votre variable sera alors accesible dans le bloc dans lequel elle est contenu. Cad, déclaré.     |
| Si elle est déclarée dans une condition,                                                         |
| elle sera disponible uniquement dans le bloc de la condition                                     |
------------------------------------------------------------------------------------------------ */


//--Les variables FLOAT
var uneDecimale = -2.984;
console.log(uneDecimale);
console.log(typeof uneDecimale);

//--Les Booléens (VRAI/FAUX)
var unBooleen = false;//TRUE
console.log(unBooleen);
console.log(typeof unBooleen);

//--Les Constantes
/**
 * La déclaration CONST permet de créer une constante accessible uniquement en lecture. 
 * Sa valeur ne pourra pas être modifiée par des réaffectations ultérieures.
 * une constante ne peut pas être déclarée à nouveau...
 * Généralement, par convention, les constantes seront en majuscules. 
 */

 const HOST = "localhost";
 const USER = "root";
 const PASSWORD = "mysql";
 //Je ne peux pas faire cela
 //USER="Hugo"
 //01.js:74 Uncaught TypeError: Assignment to constant variable.

                                     


                        //------------------LA MINUTE INFO-------------------------//


/*Au fur et à mesure que l'on affecte ou ré-affecte des valeurs à une variable , 
celle-ci prend la nouvelle valeur et le nouveau type.

En JavaScript, les variables sont auto-typées.

Pour convertir une variable de type NUMBER en STRING 
et de STRING en NUMBER je peux utiliser les fonctions natives de JS*/

var unNombre = "24";
console.log(unNombre);
console.log(typeof unNombre);
// La fonction parseInt() pour returner un Entier a partir
// de ma chaine de caractére
unNombre = parseInt(unNombre);
console.log(unNombre);
console.log(typeof unNombre);

//Je ré-affecte une valeur à ma variable
unNombre = parseFloat(unNombre);
console.log(unNombre);
console.log(typeof unNombre);
//Conversion d'un Nombre en String avec toString
unNombre = 10;
var maChaineDeCaractere = unNombre.toString();
console.log(unNombre);
console.log(typeof maChaineDeCaractere);

