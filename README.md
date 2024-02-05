# <span style="color: #086F61"> Projet Données Post Relationnelle : Site de Recettes de Cuisine </span>

**<span style="color: #85BDB5"> Membres du Projet :**
- _ZEMMOURI Yasmine_
- _GOUMAIDI Kawthar_

### <span style="color: #85BDB5"> Introduction

Ce projet combine l'utilisation de transformations XSLT 2.0 et XQuery pour créer un site web statique de recettes de 
cuisine. Les pages HTML sont générées à partir des données XML, avec des fonctionnalités telles que la liste des recettes,
des ingrédients, des auteurs, etc. Le schéma XML assure la conformité des données. En outre, une requête XQuery produit 
une page XHTML listant les auteurs avec leurs recettes et les sous-catégories associées.
### <span style="color: #85BDB5"> Organisation des Fichiers

- **Données XML :** Les données XML initiales sont stockées dans le fichier `donnees-recettes.xml`. La structure de ces 
données est conforme au schéma défini dans le fichier `donnees-recettes.dtd`.
- **Schéma XML :** Le schéma XML est défini dans le fichier `schema_recettes.xsd`.
- **Feuilles de Style XSLT :** Les transformations XSLT sont réalisées à l'aide de plusieurs feuilles de style, chacune dédiée à une entité spécifique.
  + `transform-xml.xsl`: Transforme les données XML en une structure XML plus organisée, conforme à un schéma défini dans donnees_recettes_transform.xsd.
  + `transform-html.xsl`: Génère différentes pages HTML à partir du document XML transformé.
- **Feuilles de Style Incluses :**
  + `template-categorie.xsl`, `template-auteur.xsl`, `template-ingredient.xsl`, `template-produit.xsl`, `template-recette.xsl` : 
Ces feuilles définissent les templates spécifiques pour chaque entité (catégorie, auteur, ingrédient, produit, recette).
- **Feuilles de Style CSS :** Les fichiers CSS pour le style des pages HTML sont regroupés dans le dossier `feuilles_css`.
- **Fichiers de Sortie HTML :** Les pages HTML générées sont enregistrées dans le dossier `pages_HTML`.
- **Fichiers de Sortie XQuery :** Le résultat de la requête XQuery est dans `result-Xquery.html`.

### <span style="color: #85BDB5"> Instructions pour l'Exécution

1. **Transformation XML vers XML :**
- Utilisez le fichier `donnees-recettes.xml` avec la feuille de style `transform-xml.xsl` pour générer un document XML transformé. Vous pouvez utiliser un outil tel que Saxon ou un navigateur web qui prend en charge XSLT.
2. **Transformation XML vers HTML :**
- Utilisez le fichier XML transformé avec la feuille de style `transform-html.xsl` pour générer les pages HTML.
- Les pages HTML seront enregistrées dans le dossier `pages_HTML`.
**<span style="color: #85BDB5"> _Remarque : _** Nous avons le processeur XSLT Saxon pour exécuter la transformation par la commande suivante dans le terminal :
```java
java -jar saxon9he.jar -xsl:transform_html.xsl -s:donnees_recettes_transform.xml -o:output_directory/
```
3. **Validation avec Schéma XML :**
- Utilisez le schéma XML `schema_recettes.xsd` pour valider le document XML transformé.
4. Exécution de la Requête XQuery:
- Utilisez la commande suivante pour exécuter la requête XQuery :
```bash
java -cp saxon9he.jar net.sf.saxon.Query -q:requete-XQuery.xq -s:donnees_recettes_transform.xml -o:result-Xquery.html
```
5. **Visualisation des Pages HTML et XQuery :**
- Ouvrez les fichiers HTML générés dans un navigateur web.
- Consultez le résultat de la requête XQuery dans result-Xquery.html.

### <span style="color: #85BDB5"> Étapes Spécifiques de Transformation XQuery

La requête XQuery génère une page XHTML listant les auteurs avec leurs recettes et les sous-catégories associées. 
Les résultats sont triés. La requête utilise explicitement les fonctionnalités offertes par XPath 2.0.

### <span style="color: #85BDB5"> Arborescence des Pages HTML

Le fichier XSL génère plusieurs pages HTML organisées comme suit :

- `index.html`: Page d'accueil du site.
- `Recettes.html`: Liste des recettes avec des fiches détaillées.
- `Ingredients.html`: Liste des ingrédients avec des fiches détaillées.
- `Auteurs.html`: Liste des auteurs avec des fiches détaillées.
- `Produits.html`: Liste des produits avec des fiches détaillées.
- `Categories.html`: Liste des catégories avec des fiches détaillées.
- `Feuilles de Style CSS

### <span style="color: #85BDB5"> Étapes Spécifiques de Transformation

1. **Affichage des Données :**
- Affichage des recettes triées par date de publication décroissante.
- Affichage des auteurs triés par ordre alphabétique du prénom.
2. **Lier les Données :**
- Ajout de liens depuis chaque recette vers la fiche descriptive de ses auteurs.
- Ajout de liens depuis la description de chaque recette vers les descriptions des ingrédients qu'elle utilise.
3. **Traitement des Catégories, Sous-catégories et Produits d'Ingrédients :**
- Production d'une page HTML pour les catégories avec des liens entre les sous-catégories et les recettes.
- Production d'une page HTML listant les produits d'ingrédients avec des liens vers les descriptions des ingrédients.
4. **Liaisons Inverses :**
- Affichage des recettes pour chaque auteur avec des liens vers les descriptions des recettes.
- Ajout à la description de chaque recette la liste des sous-catégories avec des liens vers les descriptions de ces sous-catégories.
- Ajout à la description de chaque ingrédient la liste des recettes où il est utilisé avec des liens vers les descriptions des recettes.
5. **Améliorations des Pages:**
- Ajout d'un menu statique dans chaque page permettant de naviguer facilement.
- Utilisation de xsl:key pour améliorer l'efficacité des transformations. Liste des auteurs ayant publié des recettes très faciles.

### <span style="color: #85BDB5"> Schéma XML

Le schéma XML (`schema_recettes.xsd`) définit les contraintes et les structures pour les données du site des recettes. 
Il prend en compte les règles suivantes :

- Une recette peut avoir de 1 à 20 ingrédients.
- La note attribuée à une recette est considérée comme optionnelle.
- Chaque titre de recette doit contenir au minimum 2 caractères et au maximum 70 caractères.

