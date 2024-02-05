xquery version "1.0" encoding "utf-8";
declare namespace html = "http://www.w3.org/1999/xhtml";

(: Rédiger une requête XQuery permettant de produire une page XHTML qui liste les auteurs
   avec :
   pour chacun, les recettes qu’il a proposées et les sous-catégories dans lesquelles les recettes apparaissent.
   Prenez soin de trier tous les résultats.
 :)
<html>
    <head>
        <link rel="stylesheet" href="transform-to-html/feuilles_css/xquery.css"/>
    </head>
    <body>
        <nav>
                 <ul>
                    <li><a href="transform-to-html/pages_HTML/index.html"> Acceuil</a></li>
                    <li><a href="transform-to-html/pages_HTML/Recettes.html"> Nos Recettes</a></li>
                    <li><a href="transform-to-html/pages_HTML/Ingredients.html"> Ingrédients utilisés dans nos recettes </a></li>
                    <li><a href="transform-to-html/pages_HTML/Auteurs.html"> Nos plus belles plumes </a></li>
                    <li><a href="transform-to-html/pages_HTML/Categories.html"> Catégories de recettes </a></li>
                    <li><a href="transform-to-html/pages_HTML/Produits.html"> Nos Produits </a></li>
                    <li><a href="result-XQuery.html"> XQuery </a></li>
                 </ul>
              </nav>
         <h1> Nos Auteurs : </h1>
        <ul>
        {
        for $auteur in doc("donnees_recettes_transform.xml")//auteur
        order by $auteur
        return

            <div id="{$auteur/@id}">
                <li>
                <a href="Auteurs.html{$auteur/@id}">{$auteur/concat(prenom/text(), ' ', nom/text())}</a>
                <p>Ses Recettes :
                <ul>
                {
                    for $idr in $auteur/ref-recette/@ref
                    return
                        for $recette in doc("donnees_recettes_transform.xml")//recette
                        where $recette/@id = $idr
                        return

                            <li>
                            <a href="Recettes.html#{$idr}">{$recette/nom/text()}</a>
                            <ul>
                                <li>
                                {
                                   for $cate in distinct-values($recette[@id=$idr]/ref-souscategorie/@ref)
                                   return
                                  <p> Sous-catégorie : <a href="Categories.html#{$cate}">{//sous-categorie[@id=$cate]/nom/text()}</a>
                                   </p>
                                }
                                </li>

                            </ul>

                            </li>


                }
                </ul>
                </p>
            </li>
            </div>

            }
        </ul>
    </body>
</html>