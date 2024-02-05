<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="liste-des-recettes">
        <div class="sidebar">
            <h1>Nos Recettes :</h1>
            <ul>
                <xsl:for-each select="//recette">
                    <!-- Ordre d�croissant de leur dates de publication -->
                    <xsl:sort select="date_publication" order="descending"/>
                    <li>
                        <!-- Lien vers la fiche de la recette -->
                        <a href="#{@id}"> <xsl:value-of select="nom"/> </a>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>

    <xsl:template name="fiche-des-recettes">
        <div class="recipe-container">

            <h1>Fiche des recettes</h1>
            <ul>
                <xsl:for-each select="//recette">
                    <!-- Ordre d�croissant de leur dates de publication -->
                    <xsl:sort select="date_publication" order="descending"/>
                    <div id="{@id}" class="recipe-section">
                        <h2 >
                            <xsl:value-of select="nom"/>
                        </h2>
                        <img>
                            <xsl:attribute name="src">
                                <xsl:value-of select="photo"/>
                            </xsl:attribute>
                        </img>
                        <div class="fiche">
                            <p>
                                <strong>Date de Publication : </strong> <xsl:value-of select="date_publication"/>
                            </p>
                            <p>
                                <strong>Auteur</strong>
                                <ul>
                                    <!-- Liste des auteurs de cette recette -->
                                    <xsl:for-each select="ref-auteur">
                                        <xsl:variable name="id_auteur" select="@ref"/>
                                        <li>
                                            <!-- Lien vers la fiche de l'auteur -->
                                            <a href="Auteurs.html#{$id_auteur}"> <xsl:value-of select="ancestor::node()/auteurs/auteur[@id=$id_auteur]/prenom/text()"/> </a>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </p>
                            <p>
                                <strong>R�sum� :</strong> <xsl:value-of select="resume"/>
                            </p>
                            <p>
                                <strong>Temps de pr�paration : </strong> <xsl:value-of select="temps_prep"/>
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
                                <strong>Difficult� : </strong> <xsl:value-of select="difficult�"/>
                            </p>
                            <p>
                                <!-- Liste des ingr�dients de cette recette-->
                                <strong>Les ingr�dients :</strong>
                                <ul>
                                    <xsl:for-each select="ref-ingredient">
                                        <xsl:variable name="id_ingredient" select="@ref"/>
                                        <li>
                                            <xsl:if test="@quantite != ''">
                                                <xsl:value-of select="@quantite"/>
                                                <xsl:text> : </xsl:text>
                                            </xsl:if>
                                            <!-- Ajout d'un lien vers la fiche de cet ingr�dient -->
                                            <a href="Ingredients.html#{$id_ingredient}"> <xsl:value-of select="ancestor::node()/listes_ingredients/ingredient[@id=$id_ingredient]/nom/text()"/> </a>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </p>
                            <p>
                                <strong>Pr�paration : </strong> <xsl:copy-of select="preparation"/>
                            </p>
                            <!-- Liste des sous-cat�gories de cette recette -->
                            <strong> Sous-categories : </strong>
                            <xsl:for-each-group select="ref-souscategorie" group-by="@ref">
                                <xsl:variable name="id-sous-categorie" select="@ref"/>
                                <li>
                                    <!-- Ajout d'un lien vers la fiche de la sous-cat�gorie-->
                                    <a href="Categories.html#{@ref}"> <xsl:value-of select="ancestor::node()/sous-categories/sous-categorie[@id=$id-sous-categorie]/nom/text()"/> </a>
                                </li>
                            </xsl:for-each-group>
                        </div>

                    </div>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>

</xsl:stylesheet>