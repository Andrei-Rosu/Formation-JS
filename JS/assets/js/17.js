var membres = [
    {'pseudo':'Hugo','age':26,'email':'wf3@hl-media.fr','mdp':'wf3'},
    {'pseudo':'Rodrigue','age':56,'email':'rodrigue@hl-media.fr','mdp':'roro'},
    {'pseudo':'James','age':78,'email':'james@hl-media.fr','mdp':'james8862'},
    {'pseudo':'Emilio','age':18,'email':'milio@hl-media.fr','mdp':'milioDu62'}
  ]; 

  var ispseudoInArray = false; 
  var pseudo = document.getElementById("pseudo");
  var h3 = document.getElementById("Bienvenue");
  h3.textContent="pseudo";
 /* function voirLaSaisieDeMonInput() {
    console.log(pseudo.value);
    getElementById(pseudo.value).innerHTML=pseudo.value;
}

pseudo.addEventListener('change', voirLaSaisieDeMonInput);*/

  for(let i = 0 ; i < membres.length ; i++) {
  
      if(pseudo === membres[i].pseudo) {
  
          // -- J'ai trouvé une correspondance dans ma BDD
          ispseudoInArray = true;
          document.write('Bonjour ' + pseudo[i].prenom + ' !');
  
          // -- Je stop la boucle for, j'ai trouvé ce que je cherche...
          break;
  
      }
  
  }
  
  if(ispseudoInArray) {
      
  }

  function voirLaSaisieDeMonInput() {
    console.log(input.value);
    (input.value);
}

//input.addEventListener('change', voirLaSaisieDeMonInput);