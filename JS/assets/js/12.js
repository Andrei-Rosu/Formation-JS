/*
 I. Créer un Tableau 3D "PremierTrimestre" contenant la moyenne d'un étudiant pour plusieurs matières.

    Nous auront donc pour un étudiant, sa moyenne à plusieurs matières.
    
    Par exemple : Hugo LIEGEARD : [ Francais : 12, Math : 19, Physique 4], ... etc
    
    **** Vous allez créez au minimum 5 étudiants ****

II. Afficher sur la page (à l'aide de document.write) pour chaque étudiant, la liste (ul et li) de sa moyenne à chaque matière, puis sa moyenne générale. 
*/
var PremierTrimestre = [

    {
        prenom  : "Hugo",
        nom     : "LIEGEARD",
        moyenne : {
            francais : 4,
            math     : 6,
            physique : 18
        }
    },
    {
        prenom  : "Maxime",
        nom     : "JOYES",
        moyenne : {
            francais : 4,
            math     : 5,
            physique : 12,
            svt      : 15
        }
    },
    {
        prenom  : "John",
        nom     : "GARCIA",
        moyenne : {
            francais : 4,
            math     : 13,
            physique : 12,
            espagnol : 19
        }
    },
    {
        prenom  : "Hana",
        nom     : "MATTEI",
        moyenne : {
            francais : 14,
            math     : 13,
            physique : 13,
            anglais  : 16
        }
    }

];
function l(e) {
    console.log(e);
}
function w(e) {
    document.write(e);
}

// Je souhaite afficher la liste des etudiants

w('<ol>');
for(let i =0 ;i < PremierTrimestre.length ; i++){
    // -- On recupere l'objet Etudiant de l'iteration
    let Etudiant = PremierTrimestre[i];
    l(Etudiant)

    var NombreDeMatiere = 0, SommeDesNotes = 0;
       w('<li>');
           w(Etudiant.prenom + ' '+ Etudiant.nom);
           w('<ul>');
           for(let matiere in Etudiant.moyenne){
               //(matiere);
               
               NombreDeMatiere++;
               SommeDesNotes+= Etudiant.moyenne[matiere];
               w('<li>');
                w(matiere +':' + Etudiant.moyenne[matiere]);
               w('</li>');
           }// Fin de la boucle matiere

           w('<li>');
           w('<strong>Moyene Génerale : </strong>' + (SommeDesNotes / NombreDeMatiere ).toFixed(2));
           w('</li>');

           w('</ul>');
           w('</li>');
}
w('</ol');



