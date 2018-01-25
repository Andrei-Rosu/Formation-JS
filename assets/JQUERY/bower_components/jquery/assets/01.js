/** LA DISPONIBILITE DU DOM
 * 
 * A partir du moment ou mon DOM, cad l'ardorescence de ma page HTML est complètement chargée, je peux commencer à utiliser JQuery.
 * 
 * Je vais mettre l'ensemble de mon code de mon code dans un foonction cette fonction sera appelée AUTOMATIQUEMENT !!! par jQuery lorsque le DOM sera entièrement défini.
 * 
 * 3 façons de faire : 
 */


 // -- 1ère possibilité:
jQuery(document).ready(function() {
    //-- Ici, le DOM est entièrement chargé, je peux procéder à mon code JS...
});


// -- 2ème possibilité:
$(document).ready(function() {
    //-- Ici, le DOM est entièrement chargé, je peux procéder à mon code JS...
});


// --3ème possibilité:
$(function() {
    //-- Ici, le DOM est entièrement chargé, je peux procéder à mon code JS...
});

// --3ème possibilité:
$(()=> {
    alert('Bienvenu')  //-- Ici, le DOM est entièrement chargé, je peux procéder à mon code JS...
});



