



///-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
/**
 * Validate email function with regular expression
 *
 * https://paulund.co.uk/regular-expression-to-validate-email-address
 * If email isn't valid then return false
 *
 * @param email
 * @return Boolean
 */
/*var validateEmail = email => {
    var emailReg = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
    var valid = emailReg.test(email);

    if(!valid) {
        return false;
    } else {
        return true;
    }
}

var validateTel = tel => {
    var telReg = new RegExp("(0|\\+33|0033)[1-9][0-9]{8}");
    var valid = telReg.test(tel);

    if(!valid) {
        return false;
    } else {
        return true;
    }
}

// -- Initialisation de jQuery
$(() => {

    // -- Ecouter a quel moment est soumis notre formulaire
    // En JS : document.getElementById('contact').addEventListener('submit', MaFonctionAExecuter);
    $('#contact').on('submit', e => {

        // -- Neutraliser la redirection HTML5
        e.preventDefault();

        // -- Supprimer les différentes erreurs
        $('#contact .has-error').removeClass('has-error');
        $('#contact .text-danger').remove();

        // -- Déclarer les variables à vérifier
        var nom     = $('#nom');
        var prenom  = $('#prenom');
        var email   = $('#email');
        var tel     = $('#tel');

        // -- Vérification de chaque champ

            // -- 1. Vérification du Nom
            if(nom.val().length === 0) {
                nom.parent().addClass('has-error');
                $('<p class="text-danger">N\'oubliez pas de saisir votre nom</p>').appendTo(nom.parent());
            } else {
                nom.parent().addClass('has-success');
            }

        // -- 2. Vérification du Prénom
        if(prenom.val().length === 0) {
            prenom.parent().addClass('has-error');
            $('<p class="text-danger">N\'oubliez pas de saisir votre prénom</p>').appendTo(prenom.parent());
        } else {
            prenom.parent().addClass('has-success');
        }

        // -- 3. Vérification du Mail
        if(!validateEmail(email.val())) {
            email.parent().addClass('has-error');
            $('<p class="text-danger">Vérifiez votre adresse email</p>')
                .appendTo(email.parent());
        } else {
            email.parent().addClass('has-success');
        }

        // -- 4. Vérification du Numéro de Téléphone
        if(!validateTel(tel.val())) {
            tel.parent().addClass('has-error');
            $('<p class="text-danger">Vérifiez votre numéro de téléphone</p>')
                .appendTo(tel.parent());
        } else {
            tel.parent().addClass('has-success');
        }
        
        // -- Dans le cas d'une boucle de vérification
        // let ChampsAVerifier = $('#contact input:not([type=submit])');
        // console.log(ChampsAVerifier);

        // for(let i = 0 ; i < ChampsAVerifier.length ; i++) {
        //     if( $(ChampsAVerifier).eq(i).val().length === 0 ) {
        //         ...
        //     }
        // }

        // -- Je vérifie si mon formulaire comporte des erreurs.
        if($('#contact').find('.has-error').length === 0) {

            $('#contact').replaceWith(`
                <div class="alert alert-success">
                    Votre demande a bien été envoyée !
                    Nous vous répondrons dans les meilleurs délais.
                </div>
            `);
            let Contact = {
                nom     : nom.val()
                prenom  : prenom.val(),
                email   : email.val(),
                tel     : tel.val()
            };


        } else {

            $('#contact').prepend(`
                <div class="alert alert-danger">
                    Nous n'avons pas été en mesure de valider votre
                    demande. Vérifiez vos informations.
                </div>
            `);

        }

    })})

  /*  var listeDePrenoms = [prenom.value];
    var listeDesEmails = [email.value]
    var listeDeNoms    = [nom.value];
    var listeDesTels   = [tel.value];

var listeDesContacts = [listeDePrenoms,listeDeNoms,listeDesEmails,listeDesTels];
console.log(listeDesContacts);


inscriptionForm.addEventListener('submit',function(event){
    event.preventDefault();
    var newEntry = {
        pseudo : pseudo.value,
        age    : age.value,
        email  : email.value,
        mdp    : mdp.value 
    };
membres.push(newEntry);
var list = membres.pseudo.value;
    for(let k = 0 ; k < membres.length ; k++){
    document.write(membres[k].pseudo);
}
})*/

//------------------------------------------------------------------//

/*var list = [membre];
 // -- Créer un Objet membre à ajouter au tableau

list.push(membre);
    console.log(membre);
for(let k = 0 ; k < membre.length ; k++){
    document.getElementById('LesContacts');



   
    
    

    /*var p = document.createElement('p');
    p.innerHTML =
    document.body.appendChild(p);

    // -- Générer la liste des membres
    var ul = document.createElement('ul');
    for(let i = 0 ; i < list.length ; i++) {
        
        let li = document.createElement('li');
        let liste = list[i].nom + " : " + list[i].age + " ans";
        li.textContent = liste;
        ul.appendChild(li);
    }
    
    // -- Affichage dans la page.
    document.body.appendChild(ul);*/




                                                                           
                                          //---------------------SOLUTION------------------------------------//                                                                           



// -- Initialisation de jQuery (DOM READY)
$(function() {

    // -- Tableau indexé d'objet Contact
    var CollectionDeContacts = [];

    /* --------------------------------------------------------------
                        DECLARATION DES FONCTIONS
    -------------------------------------------------------------- */

    function ajouterContact(Contact) {

        // -- Ajouter "Contact" dans "CollectionDeContacts"
        CollectionDeContacts.push(Contact);
        console.log(CollectionDeContacts);
        
        // -- On cache la phrase : Aucun Contact.
        $('.aucuncontact').hide();

        // -- Mise à jour du HTML
        $(`
            <tr>
                <td>` + Contact.nom + `</td>
                <td>${Contact.prenom}</td>
                <td>${Contact.email}</td>
                <td>${Contact.tel}</td>
            </tr>
        `).appendTo($('#LesContacts > tbody'));

        // -- Réinitialisation du Formulaire
        reinitialisationDuFormulaire();

        // -- Affiche une Notification
        $('.alert-contact').fadeIn().delay(4000).fadeOut();

    }

    function reinitialisationDuFormulaire() {
        //  -- En jQuery 
        $('#contact').trigger('reset');
        $('#contact').get(0).reset();
        $('#contact .form-control').val('');
        
        // -- En Javascript :
        document.getElementById('contact').reset();
    }

    function validateEmail(email){
        var emailReg = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
        var valid = emailReg.test(email);
    
        if(!valid) {
            return false;
        } else {
            return true;
        }
    }
    
    var validateTel = tel => {
        var telReg = new RegExp("(0|\\+33|0033)[1-9][0-9]{8}");
        var valid = telReg.test(tel);
    
        if(!valid) {
            return false;
        } else {
            return true;
        }
    }

    function unContactEstPresent(Contact) {

        // -- Booleen qui indique la présence d'un contact dans ma collection
        let estPresent = false;

        // -- On parcourt le tableau à la recherche d'une correspondance
        for(let i = 0 ; i < CollectionDeContacts.length ; i++) {

            if(Contact.email === CollectionDeContacts[i].email) {
                // -- Si une correspondance est trouvé "estPresent" passe à VRAI (true)
                estPresent = true;
                // -- On arrête la boucle, plus besoin de poursuivre.
                break;
            }

        }

        // -- On retourne le booleen
        return estPresent;

    }











                                                 













    /* --------------------------------------------------------------
                    TRAITEMENT DE MON FORMULAIRE
    -------------------------------------------------------------- */

    // -- Détection de la soumission de mon formulaire
    $('#contact').on('submit', function(e) {

        // -- Stopper la redirection de la page
        e.preventDefault();

        // -- Récupération des champs à vérifier
        var prenom, nom, email, tel;
        nom     = $('#nom');
        prenom  = $('#prenom');
        email   = $('#email');
        tel     = $('#tel');

        // -- Vérification des informations
        let mesInformationsSontValides = true;

        // -- Vérification du Prénom
        if(prenom.val().length === 0) {
            // -- Le champ est incorrect, car il n'a pas été rempli...
            mesInformationsSontValides = false;
        }

        // -- Vérification du Nom
        if(nom.val().length === 0) {
            // -- Le champ est incorrect, car il n'a pas été rempli...
            mesInformationsSontValides = false;
        }

        // -- Vérification du Mail
        if(!validateEmail(email.val())) {
            mesInformationsSontValides = false;
        }

        // -- Vérification du Tel
        if(!validateTel(tel.val())) {
            mesInformationsSontValides = false;
        }

        if(mesInformationsSontValides) {

            // -- Tout est correct
            let Contact = {
                //cle       //valeur
                nom         : nom.val(),
                prenom      : prenom.val(),
                email       : email.val(),
                tel         : tel.val()
            };

            /**
             * Si le contact est présent dans la collection, on informe l'utilisateur
             * Sinon, on peut procéder à la suite du traitement.
             */
            if(unContactEstPresent(Contact)) {
                reinitialisationDuFormulaire();
                alert('ATTENTION\nCe contact est déjà présent !');
            } else {
                ajouterContact(Contact);
            }

        } else {

            // -- Tous les champs n'ont pas été remplis.
            alert('ATTENTION\nVeuillez bien remplir tous les champs.');

        }

    })

})
