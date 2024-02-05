xquery version "3.1";

declare namespace html = "http://www.w3.org/1999/xhtml";
(: Rédiger une requête XQuery permettant de produire une page XHTML qui liste les auteurs  avec :
   pour chacun, les recettes qu’il a proposées et les sous-catégories dans lesquelles les recettes apparaissent.
   Prenez soin de trier tous les résultats.
 :)
let $data := doc("donnees_recettes_transform.xml")


return
<html>
  <head>
    <title>Liste des auteurs</title>
  </head>
  <body>
    <h1>Liste des auteurs</h1>
    {
      for $auteur in distinct-values($data//auteur)
      order by $auteur
      return
      <div>
        <h2>{$auteur}</h2>
        <h3>Recettes proposées :</h3>
        <ul>
          {
            for $recette in $data//recette[ref-auteur = $auteur]
            order by $recette/nom
            return
            <li>
              {$recette/nom}
              <h4>Sous-catégories :</h4>
              <ul>
                {
                  for $souscategorie in $recette/ref-souscategorie
                  order by $souscategorie
                  return
                  <li>{$data//sous-categories/sous-categorie[@id = $souscategorie]/nom}</li>
                }
              </ul>
            </li>
          }
        </ul>
      </div>
    }
  </body>
</html>
