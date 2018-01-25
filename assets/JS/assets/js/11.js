/* -------------------- LES BOUCLES --------------------------- */




//      -------      La Boucle FOR

for(let i=0; i<=10; i++){
    document.write('<p>Instruction executée :<strong>' + i +'</strong></p>')
}
document.write('<hr>');


//     -----     La Boucle WHILE

var j = 1;
while(j <= 10){
    document.write('<p>Instruction executée : <strong>' + j + '</strong></p>')
//N'OUBLIER L'INCREMENTATION
    j++;
}

var Prenoms = ['Jean', 'Marc', 'Matthieu', 'Luc', 'Pierre', 'Paul', 'Jacques', 'Hugo'];
for(let i = 0; i<Prenoms.length ; i++){
    document.write('<p>Liste des Prenoms: ' + Prenoms[i] +'</p>');
}
var j = 0;
while (j<Prenoms.length){
    console.log(Prenoms[j]);
    j++;
}