//-----------------------------------------LE CHAINAGE DE METHODE-------------------------------------------------//



$(function() {

    console.log($('div'));

    // -- Je souhaite cacher toutes les div de ma page HTML
    $('div').hide('slow', function() {
        /**
         * Une fois que la méthode hide() est terminé, mon alerte peut
         * s'executer !
         * NOTA BENE : La fonction s'executera pour l'ensemble
         * des éléments du sélecteur.
         */
        // alert('Fin du Hide');

        $('div').css('background','yellow');
        $('div').css('color','red');
        $('div').show('slow');

        $('p').hide(1000).css('color','blue').css('font-size','20px').delay(2000).show(500);
        $('p').hide(1000).css({'color':'green','font-size':'20px'}).delay(2000).show(500);

    });

});




//-----------------------------EXERCISE JQUERY-------------------------------------------------------------------------//


<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Exercice 1 en jQuery !</title>
</head>
<body>
    <form action="traitement.php" id="MonFormulaire">
        <input type="text" required placeholder="Nom et Prénom" id="nomcomplet">
        <input type="submit" value="Je Valide">
    </form>
     <!-- CONSIGNE : Avec l'aide de jQuery, vous devrez :
    
        1. A la soumission du formulaire, cacher le formulaire puis :
        2. Créer un élément <p>
        3. Dans cet élément, afficher : Bonjour <nomcomplet> correspondant 
           au nom saisie dans le formulaire.

    Intégration de la librairie jQuery -->
    <script
    src="https://code.jquery.com/jquery-3.2.1.min.js"
    integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
    crossorigin="anonymous"></script>

</body>
</html>