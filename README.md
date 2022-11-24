# Règles de codage et de documentation en programmation

## Table des matieres
>1. [Règles de codage](#1)
>    1. [Règles générales](#2)
>    2. [Règles spécifiques au langage PHP](#3)
>    3. [Règles spécifiques au langage JavaScript](#4)
>    4. [Règles spécifiques au langage UnityScript](#5)
>2. [Convention de documentation du code](#6)
>    1. [Documentation du code JavaScript, UnityScript, et PHP](#7)
> 3. [Références](#8)
>    1. [Livres](#9)
>    2. [Sites Web](#10)

## <a name="1"></a>Règles de codage

Les règles qui suivent s’appliquent à tous les langages de programmation.

Des exemples de code source illustrant la majorité des règles de codage énoncées dans ce
document sont disponibles sur GitHub à l’adresse suivante : https://github.com/cmaisonneuve-tim/regles-codage-documentation

### <a name="2"></a>Règles générales
#### **Noms des fichiers**
- Pour vos travaux au Collège, nommez tous vos fichiers en français dans la mesure du possible (c’est à dire à moins d’une exception imposée par l’environnement de programmation utilisé) ;
- Choisissez des noms de fichiers significatifs ;
- Utilisez uniquement les caractères alphanumériques sans accents ni ligatures ; à part ce compromis, le nom d’un fichier doit être en français correct ;
- Au besoin, utilisez le tiret (ou le trait de soulignement) pour séparer les mots ; n’utilisez jamais de caractères d’espacement !
- Pour les noms des fichiers destinés à être utilisés dans des requêtes HTTP, utilisez une seule casse de caractères (minuscule de préférence) : cette uniformité permet d’éviter des erreurs sur les systèmes d’exploitation sensible à la casse (Linux/Unix/Mac OS) ;
- Pour les autres types de fichiers de code, suivez les recommandations spécifiques à l’environnement de programmation données en classe.
>     gerer-utilisateur.xhr.php (PHP - requis par HTTP) ;
>     UtilisateurModele.class.php (PHP) ;
>     panier-donnees.json (JSON) ;
>     jeu-initialisation.js (JavaScript - requis par HTTP) ;
>     ChatMechant.js (UnityScript) ;
#### **Indentation, espacement, longueur de ligne**
- Insérez des indentations dans le code source de façon uniforme ;
- Tout bloc de code doit donner lieu à un niveau d’indentation dans le code source ;
- Pour ce faire, utilisez, selon votre préférence, un certain nombre fixe d’espaces ou des marques de tabulations (mais ne mélangez jamais les deux !) ;
- Soyez uniforme, corrigez au besoin l’indentation avant de remettre un travail ;
- Ne laissez pas de lignes vides inutiles dans votre code source ;
- En général, laissez un espace vide de chaque côté d’un opérateur binaire (mais ne laissez aucun espace dans le cas des opérateurs unaires et ternaires) ;
- Pour aider à la lisibilité du code, essayez dans la mesure du possible de garder vos lignes de code courtes : 80 caractères est un bon repère, mais il n’y a pas lieu d’imposer une règle stricte à cet effet ; pensez à la personne qui va lire votre code ;
- Certains éditeurs de code, comme Sublime Text, peuvent afficher des lignes verticales placées aux colonnes que vous configurez pour vous permettre d’optimiser la longueur de vos lignes de code.
>Voici un fragment de code JavaScript illustrant indentation, espacement et lignes vides.
>
>     let nbTachesCompletees = 0,
>        table = this,
>        lignes = table.querySelectorAll(“tr”),
>        max = lignes.length;
>
>     for(let i = 0; i < max; i++) {
>        if(lignes[i].dataset.etat === “complet”) {
>                table.removeChild(lignes[i]);
>                nbTachesCompletees++;
>        }
>        return nbTachesCompletees;
>     }
#### **Accolades**
- Utilisez toujours les accolades pour délimiter les blocs de code : fonctions et structures de contrôle ; même dans le cas d’une structure de contrôle qui contiendrait une seule instruction ;
- L’accolade ouvrante peut être placée sur la même ligne que l’expression ou l’instruction désignée ou sur la ligne suivante : mais soyez uniforme une fois ce choix établi ; ne mélangez pas les deux styles ;
- Faites attention à l’exception notée plus loin dans la section JavaScript pour ce qui a trait à l’instruction return et l’usage (spécial à JavaScript) de l’accolade pour la création d’objets littéraux.
>Voici une illustration des deux styles de placement d’accolades :
>
>     function ouvrirCompte(nom, courriel, mdp) {
>        for(let i = 0; i < 10; i++) {
>                // ...
>        }
>     }
>
>
>     // Style alternatif de placement de l’accolade ouvrante
>
>     function ouvrirCompte(nom, courriel, mdp)
>     {
>        for(let i = 0; i < 10; i++)
>        {
>                // ...
>        }
>     }

#### **Conventions de nommage**
- Pour vos travaux au Collège, nommez tous vos “éléments” de code en français  (variables et fonctions principalement, mais aussi classes, interfaces, espaces de noms, modules) ;
- Cette règle est à respecter dans la mesure du possible (c’est à dire uniformément à moins d’une nomenclature imposée par l’environnement de programmation utilisé) ;
- En particulier, et de façon exceptionnelle, il est préférable d’utiliser les mots anglais “get” et “set” comme préfixes lorsque vous nommez les méthodes d’accès aux propriétés d’une classe (voir exemples) ;
- Préférez toujours la clarté et la lisibilité à la concision : mieux vaut un nom un peu trop long qu’un nom trop court qui ne signifie rien dans le contexte du code ;
- Utilisez uniquement les caractères alphanumériques sans accents ni ligatures et le trait de soulignement au besoin ; à part ce compromis, le nom doit être en français correct ;
- Un nom ne peut dans aucun cas commencer par un chiffre ;
- Utilisez la notation “casse de chameau” (“CamelCase” en anglais) pour séparer les mots d’un nom ; mise à part le premier mot du nom (traité ci-dessous), tous les mots qui suivent débutent par une lettre majuscule ;
- En général, pour les variables et fonctions (propriétés et méthodes), utilisez la convention “lowerCamelCase” dans laquelle le premier mot débute par une lettre minuscule ; c’est le cas en JavaScript et en PHP ; voir plus loin dans la section UnityScript l’exception s’appliquant à ce langage ;
- Pour les classes et les interfaces, utilisez la convention “UpperCamelCase” dans laquelle le premier mot est aussi écrit avec une première lettre majuscule ; c’est aussi la convention à utiliser pour les fonctions “constructeur” en JavaScript ;
- Nommez les constantes avec toutes les lettres en majuscules : utilisez alors le trait de soulignement pour séparer les mots et aider à la lisibilité ;
- Utilisez un verbe dans le premier mot du nom d’une fonction (ou méthode) pour indiquer l’action sous-jacente

>Quelques bons exemples
>
>     noteFinaleEtudiant (variable ou propriété) ;
>     _formulaireEvaluation (variable ou propriété) ;
>     optionsChoisies (variable ou propriété) ;
>     lireProduits() (fonction ou méthode) ;
>     getCodePostal() (méthode d’accès à la propriété codePostal) ;
>     supprimerProduit(idProduit) (fonction ou méthode) ;
>     CompteEpargne (classe ou interface) ;
>     PENALITE_RETARD_PAR_JOUR (constante).
>
>Quelques mauvais exemples 
>
>     nfEtd (variable) : le nom n’est pas significatif ;
>     CouleurChaise (variable) :  le nom d’une variable doit commencer par une minuscule ;
>     optionsChoisi (variable) : le nom ne respecte pas la grammaire du français ;
>     lireISBN() (fonction) : une abréviation doit être considérée comme un mot ;
>     produitSupprime(idProduit) (fonction) : doit commencer par un verbe ;
>     logout() (fonction) : le nom n’est pas en français ;
>     PENALITERETARDPARJOUR (constante) : nom illisible ;
>     582listeCours (variable) : erreur de syntaxe - le nom commence par un chiffre ;
>     joueurSpecial (classe) : nom de classe - doit toujours commencer par une majuscule.

#### **Commentaires**
- Les commentaires des unités de code (fonctions ou méthodes) et des classes servent de documentation à votre programme et sont traités dans une section séparée, plus loin dans ce document ;
- Dans la présente section, les règles s’appliquent aux commentaires ajoutés pour expliquer une instruction ou un ensemble d’instructions dans le code ;
- Ajoutez des commentaires utiles dans votre code au moment de sa production ;
- Écrivez des commentaires concis et clairs, en français correct (prenez l’habitude de corriger la syntaxe et la grammaire de vos commentaires) ;
- Lorsque vous modifiez le code, n’oubliez pas de mettre à jour les commentaires ;
- Ne commentez pas inutilement : les sections de code aux effets évidents, répétitives, triviales n’ont pas besoin d’être commentées ; les commentaires sont destinés à être lus par des programmeurs comme vous ;
- Utilisez de préférence le mode de commentaire à “une ligne” (et non pas “en bloc”) ; réservez les commentaires “en bloc” pour la documentation (voir section séparée plus loin) et la mise en suspension de code (lorsqu’on doit commenter du code pour prévenir son exécution).
>Remarquez bien dans le fragment JavaScript suivant : seulement les deux premières lignes, contenant du code possiblement non usuel, sont commentées. Le reste est évident.
>      function ajouterTache(evt) {
>
>        let $this = $(this);
>
>        // La touche “RETURN” correspond au code 13 retourné
>
>        // par la propriété “which” de l’événement clavier.
>
>        if(evt.which === 13 && $.trim($this.val()) !== "") {
>
>                $.ajax({
>                        url: "pilote.php?route=tache/ajouter",
>                        method: "POST",
>                        data: $this.closest("form").serialize(),
>                        success: function(reponse) {
>                                if(reponse) {
>                                        listeTaches();
>                                        $this.val("");
>                                }
>                                else {
>                                        console.log("Erreur ...");
>                                }
>                        }
>                });
>        }
>      }

### <a name="3"></a>Règles spécifiques au langage PHP
Des exemples de code source illustrant la majorité des règles de codage s’appliquant à PHP sont disponibles sur GitHub :  https://github.com/cmaisonneuve-tim/regles-codage-documentation/blob/master/PHP/.
Les règles de codage générales énoncées plus haut dans le document sont complétées par les règles spécifiques au langage PHP énoncées ci-dessous.
#### **Préfixez les noms des propriétés/variables pour indiquer leur visibilité/type**
- Nommez les membres privés d’une classe (propriétés et méthodes) en les préfixant d’un trait de soulignement ;
- Nommez toutes les variables et propriétés en les préfixant d’un caractère ou d’un mot indiquant le type de valeur associé :
  - s pour les chaînes de caractères
  - n pour les nombres (entiers ou décimaux)
  - b pour les valeurs booléennes
  - date pour les dates
  - a pour les tableaux
  - o pour les objets de tout type
-  Au besoin d’autres préfixes pourront être introduits en classe.
>nQteArticle (variable contenant une valeur de type numérique - int/float) ;
>_oDocXml (propriété privée d’une classe référant à un objet de type DomDocument) ;

### <a name="4"></a>Règles spécifiques au langage JavaScript
Des exemples de code source illustrant la majorité des règles de codage s’appliquant à JavaScript sont disponibles sur GitHub :   https://github.com/cmaisonneuve-tim/regles-codage-documentation/blob/master/JavaScript/.
Les règles de codage générales énoncées plus haut dans le document sont complétées par les règles spécifiques au langage JavaScript énoncées ci-dessous.
#### **Évitez les déclarations globales**
- Dans la mesure du possible, éviter de déclarer des variables et des fonctions globales ;
- Pour ce faire, plusieurs patrons de conception ont été développés en JavaScript, mais sont hors de portée de ce document de base (espaces de noms, modules, etc.) ; on s’en tiendra ici à la méthode la plus simple (mais la moins flexible aussi) : regroupez tout le code JavaScript dans une fonction anonyme “auto-exécutante” (ou “fonction immédiate”)
>Dans l’exemple qui suit, tout le code JavaScript est regroupé dans le bloc d’une fonction qui est appelée immédiatement (dans la même instruction qui déclare la fonction).
>
>     (function() {
>             let modeleCodePostalCanadien = /^[a-z]\d[a-z] *\d[a-z]\d$/i;
>             function validerCodePostalCanadien(cp) {
>                     let positionCP = cp.search(modeleCodePostalCanadien);
>                     return positionCP !== -1 ? true : “Non valide”;
>             }
>             // Reste du code lorsque le DOM est prêt …
>             document.addEventListener("DOMContentLoaded", function(e) {
>                                                             // [...]
>             });
>     })();

#### **Évitez la conversion de types implicite**
- JavaScript fait de la conversion de type automatique lorsque vous comparez des variables avec les opérateurs d’égalité (==) ou de non-égalité (!=) ; pour éviter toute confusion et des erreurs de programmation qui peuvent en résulter, utilisez plutôt les opérateurs d’identité (===) et de non-identité (!==)  qui vérifient à la fois les valeurs et les types des expressions à comparer.
>     let zero = 0;
>     
>     // Bon
>     if(zero === false) {
>             // Le code compris ici ne sera pas exécuté puisque
>             // zero est 0, et non pas false
>     }
>     
>     // Mauvais
>     if(zero == false) {
>             // Le code sera exécuté puisque 0 est converti implicitement
>             // à false dans le contexte de la comparaison
>     }

#### **Utilisez le mode “strict”**
- Le mode strict de JavaScript permet d’imposer à l’interpréteur une version plus restrictive (et plus sécuritaire) du langage ; Vous devez utiliser le mode strict dans tous nouveaux programmes que vous produisez ;
- Le mode strict peut être invoqué à deux niveaux : pour un script entier, ou pour une fonction individuelle ; de préférence, et dans la mesure du possible, utilisez le mode strict pour le script entier, ou encore en utilisant la méthode expliquée ci-dessus de la fonction immédiate, pour la fonction immédiate qui contient tout votre code ;
- Utilisez les références en fin de document pour en savoir plus, et surtout pour comprendre ce qui change en mode strict.
Pour invoquer le mode strict, ajouter l’expression “use strict”; avant toute autre instruction de votre script (le mode s’applique alors à tout le code contenu dans votre script) ou d’une fonction (le mode s’applique alors au code compris dans la fonction uniquement) :


>Dans ce premier exemple, on définit le mode strict pour tout le script : remarquez que cette expression vient avant toute instruction, mais pas nécessairement avant les commentaires.
>
>     // Librairie jeu Scrabble.
>     
>     ‘use strict’;
>     
>     let tours = 1;
>     
>     function initialiser() {
>             // [...]
>     }
>     
>     function demarrer() {
>             // [...]
>     }
>     
>     
>     Dans ce deuxième exemple, on définit le mode strict pour la fonction initialiser() uniquement
>     
>     let tours = 1;
>     
>     function initialiser() {
>             // Commentaire avant mode strict permis.
>             ‘use strict’;
>             // [...]
>     }
>     
>     function demarrer() {
>             // [...]
>     }
#### **Placement de l’accolade ouvrante d’un objet littéral suivant l’instruction return**
- Placez l’accolade ouvrante sur la même ligne que l’instruction return si votre instruction retourne un objet littéral JavaScript (voir une courte explication dans le commentaire de l’exemple ci-dessous).
>Bon exemple
>     
>     function ouvrirConnexion(pseudo, mdp) {
>     
>             // [...]
>             // Placez l’accolade sur la même ligne que le mot “return”
>     
>             return {
>                     “noDossier”: “e9988776”,
>                     “nom”: “Laplace”,
>                     “prenom”: “Pierre-Simon”
>             };
>     }
>     
>     
>Mauvais exemple
>     
>     function ouvrirConnexion(pseudo, mdp) {
>             // [...]
>             // Si vous ne placez pas l’accolade sur la même ligne
>             // que le mot “return”, un point virgule est implicitement
>             // ajouté sur cette ligne par le “parseur” et la fonction
>             // retournera alors la valeur “undefined” sans que le reste         // du code ne soit interprété.
> 
>             return
>             {
>                     “noDossier”: “e9988776”,
>                     “nom”: “Laplace”,
>                     “prenom”: “Pierre-Simon”
>             };
>     }
### <a name="5"></a>Règles spécifiques au langage UnityScript
Des exemples de code source illustrant la majorité des règles de codage s’appliquant à UnityScript sont disponibles sur GitHub :  https://github.com/cmaisonneuve-tim/regles-codage-documentation/blob/master/UnityScript/.
Les règles de codage générales énoncées plus haut dans le document sont complétées par les règles spécifiques au langage UnityScript énoncées ci-dessous.
#### **Utilisez la casse de chameau majuscule pour les noms des fonctions méthodes**
- Contrairement à la règle donnée plus haut pour les autres langages de programmation, en UnityScript écrivez les noms de vos fonctions et méthodes utilisant la convention dite “UpperCamelCase” dans laquelle chaque mot du nom doit avoir une première lettre en majuscule, incluant le premier mot (cette convention du langage UnityScript est hérité de l’environnement .Net de Microsoft) ;
>     DetruireArme() (méthode)
#### **Utilisez la casse de chameau majuscule pour les noms des fichiers et des répertoires**
- Nommez tous les fichiers et répertoires de scripts UnityScript en utilisant la convention “UpperCamelCase”, dans laquelle chaque mot du nom doit avoir une première lettre en majuscule, incluant le premier mot.
>     GestionnaireSon (répertoire de scripts UnityScript)
>     SonVolume.js (fichiers de script UnityScript)
## <a name="6"></a>Convention de documentation du code
Ne pas confondre “documentation” et “commentaires” : l’ajout de commentaires dans le code est une pratique importante et encouragée (décrite dans les règles de codage ci-dessus), mais dont l’usage ne doit pas être abusé (rien de pire que des commentaires triviaux ou encore plus “passés date” ;-)

La documentation du code (classes, méthodes, fonctions) doit être considérée OBLIGATOIRE. La documentation doit être standardisée et utiliser le format d’un des outils suivants (format communément appelé “Javadoc”) : JSDoc ou PHPDoc (références en fin de document).

Ce format utilise un bloc commentaire spécial qui est appelé “commentaire de documentation”, commençant par la marque /** (deux astérisques !) et se terminant par la marque */.
### <a name="7"></a>Documentation du code JavaScript, UnityScript, et PHP
#### **Documentation d’une unité de code (fonction ou méthode)**
- Utilisez un bloc de commentaire de documentation et les marques suivantes pour documenter les paramètres, la valeur de retour, et les références de toute fonction ou méthode que vous définissez dans votre code : @param, @return, @see
- Au début du bloc, insérez une phrase simple décrivant l’action de la fonction ou méthode ;
- Écrivez votre documentation en français correct sans fautes de syntaxe ou de grammaire ;
- Soyez uniforme : utilisez toujours le même nombre d’espaces et le même alignement pour les astérisques (tel que suggéré dans l’exemple ci-dessous) ;
- Dans le cas d’une fonction “constructeur” JavaScript, ajoutez la marque @constructor ;
- Bien d’autres marques sont disponibles, et peuvent être utilisées au besoin.
>     /**
>       * Supprime un contact de la liste des contacts d’un utilisateur.
>       *
>       * @param {number} idContact L'identifiant du contact à supprimer.
>       * @param {number} idUtilisateur L'identifiant de l'utilisateur.
>       * @return {Element} L'élément correspondant au contact supprimé.
>       * @see http://2016.makemepulse.com/ Référence utilisée.
>       */
>     
>     function supprimerContact(idContact, idUtilisateur) {
>             // [...]
>     }
#### **Documentation d’une classe**
- Utilisez exactement le même format que pour les fonctions, mais sans les marques spéciales @param et @return (ou autres) qui ne sont pas adéquates dans le contexte d’une classe ;
- Décrivez votre classe le plus complètement possible ;
>     <?php
>     
>     /**
>       * Classe servant de couche d'abstraction d'une connexion
>       * MySQL obtenue en utilisant la librairie MySQLi et le
>       * pilote logiciel mysqlnd.
>       *
>       * @see http://php.net/manual/en/book.mysqlnd.php
>       *
>       */
>     
>     class Modele {
>             private $_hote = "";
>             private $_util = "";
>             private $_mdp = "";
>             private $_bd = "";
> 
>             private $_connexion;
>             private $_resultat;
>         
>             // [...]
>   
>     }
## <a name="8"></a>Références
### <a name="9"></a>Livres
Les livres suivants vont au delà des règles de codage, et contiennent beaucoup d’information sur les meilleures pratiques et les patrons de conception dans la programmation (surtout JavaScript).
- Nicholas C. Zakas, Maintainable JavaScript, O’Reilly, 2012
- Stoyan Stefanov, JavaScript Patterns, O’Reilly, 2011
- Joost Visser, Building Maintainable Software, O’Reilly, 2015
### <a name="10"></a>Sites Web
1. Règles de codage - programmation
1. Général : https://en.wikibooks.org/wiki/Computer_Programming/Coding_Style
1. Général : https://en.wikipedia.org/wiki/Coding_conventions
1. Commentaires de code : https://en.wikipedia.org/wiki/Comment_(computer_programming)
1. Nommage : https://en.wikipedia.org/wiki/Naming_convention_(programming)
1. Général : https://en.wikipedia.org/wiki/Programming_style
1. Général (français) : https://fr.wikipedia.org/wiki/R%C3%A8gles_de_codage 
1. Nommage (français) : https://fr.wikipedia.org/wiki/Convention_de_nommage 
1. Général : https://github.com/fifengine/fifengine/wiki/coding-standards
1. JavaScript http://javascript.crockford.com/code.html
1. Java (Androïd) : https://source.android.com/source/code-style.html
1. Général (Mozilla) : https://developer.mozilla.org/en-US/docs/Mozilla/Developer_guide/Coding_Style
1. JavaScript (jQuery) :https://contribute.jquery.org/style-guide/js/
1. JavaScript (Google) :http://google.github.io/styleguide/javascriptguide.xml
1. Général (Mono) :http://www.mono-project.com/community/contributing/coding-guidelines/
1. PHP (Pear) : http://pear.php.net/manual/en/standards.php 
1. Mode strict JavaScript : https://developer.mozilla.org/fr/docs/Web/JavaScript/Reference/Strict_mode 
Documentation du code
1. JSDoc (officiel) : http://usejsdoc.org/
1. JSDoc (Wikipedia) : https://en.wikipedia.org/wiki/JSDoc 
1. PHPDoc (PHPDocumentor) : http://www.phpdoc.org/docs/latest/index.html
1. PHPDoc (Wikipedia) : https://en.wikipedia.org/wiki/PHPDoc 