<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


    <xsl:template name="liste-des-recettes">
        <h1>Liste des recettes</h1>
        <ul>
            <xsl:for-each select="//recette">
                <xsl:sort select="date_publication" order="descending"/>
                <li>
                    <a href="#{@id}">
                        <xsl:value-of select="nom"/>
                    </a>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>

    <xsl:template name="fiche-des-recettes">
        <h1>Fiche des recettes</h1>
        <ul>
            <xsl:for-each select="//recette">
                <xsl:sort select="date_publication" order="descending"/>
                <div id="{@id}">
                    <h2 >
                        <xsl:value-of select="nom"/>
                    </h2>
                    <p>
                        <strong>Date de Publication : </strong> <xsl:value-of select="date_publication"/>
                    </p>
                    <p>
                        <strong>Auteur</strong>
                        <ul>
                            <xsl:for-each select="auteurs">
                                <xsl:variable name="id_auteur" select="@ref"/>
                                <li>
                                    <a href="Auteurs.html#{$id_auteur}">
                                        <xsl:value-of select="ancestor::node()/auteurs/auteur[@id=$id_auteur]/prenom/text()"/>
                                    </a>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </p>
                    <p>
                        <strong>Résumé :</strong> <xsl:value-of select="resume"/>
                    </p>
                    <p>
                        <img>
                            <xsl:attribute name="src">
                                <xsl:value-of select="photo"/>
                            </xsl:attribute>
                        </img>
                        <!-- <img src="{photo}" alt="Image de la recette"/>-->
                    </p>
                    <p>
                        <strong>Temps de préparation : </strong> <xsl:value-of select="temps_prep"/>
                    </p>
                    <p>
                        <strong>Temps de cuisson :</strong> <xsl:value-of select="temps_cuisson"/>
                    </p>
                    <p>
                        <strong>Nomre de personnes :</strong> <xsl:value-of select="nbre_personne"/>
                    </p>

                    <p>
                        <strong>Temps de repos :</strong> <xsl:value-of select="temps_repos"/>
                    </p>
                    <p>
                        <strong>Difficulté : :</strong> <xsl:value-of select="difficulté"/>
                    </p>
                    <p>
                        <strong>Sous-Catégorie</strong> <xsl:value-of select="ref-souscategorie"/>
                    </p>
                    <p>
                        <strong>Les ingrédients :</strong>
                        <ul>
                            <xsl:for-each select="ingredients/ref-ingredient">
                                <xsl:variable name="id_ingredient" select="@ref"/>
                                <li>
                                    <xsl:value-of select="@quantite"/>
                                    <a href="Ingredients.html#{$id_ingredient}">
                                        <xsl:value-of select="ancestor::node()/listes_ingredients/ingredient[@id=$id_ingredient]/nom/text()"/>
                                    </a>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </p>
                    <p>
                        <strong>Préparation : </strong> <xsl:copy-of select="preparation"/>
                    </p>
                    <strong> Sous-categories : </strong>
                    <xsl:for-each-group select="ref-souscategorie" group-by="@ref">
                        <xsl:variable name="id-sous-categorie" select="@ref"/>

                        <li>
                            <a href="Categories.html#{@ref}">
                                <xsl:value-of select="ancestor::node()/sous-categories/sous-categorie[@id=$id-sous-categorie]/nom/text()"/>
                            </a>

                        </li>
                    </xsl:for-each-group>
                </div>
            </xsl:for-each>
        </ul>
    </xsl:template>



</xsl:stylesheet>