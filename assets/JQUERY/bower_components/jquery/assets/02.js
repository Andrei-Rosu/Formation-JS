/**LES SELECTEURS EN JQUERY */

//-- Format : $('selecteur');
//-- En jQuery, tous les sélécteurs CSS sont disponibles...

$(function() {
    //-- DOM READY 
    l = e => console.log(e);

    //-- Selectionner toutes les balises span
l(document.getElementsByTagName('span'));
l($('span'));

//-- Je veux séléctionner mon Menu grâce à son ID
l(document.getElementById('menu'));
l($('#menu'));

//-- Sélectionner une classe 
l(document.getElementsByClassName('MaClasse'));
l($('MaClasse'));



// -- Sélecttionner un attribut

l($(['href="htpps://www.google.fr']));









});