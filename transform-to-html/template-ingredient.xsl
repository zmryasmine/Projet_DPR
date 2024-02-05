<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="liste-des-ingredients">
        <div class="sidebar">
            <h1>Nos ingrédients</h1>
            <ul>
                <xsl:for-each select="//ingredient">
                    <li>
                        <!-- Lien vers la fiche de l'ingrédient -->
                        <a href="#{@id}"> <xsl:value-of select="nom"/> </a>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>

    <xsl:template name="fiche-des-ingredients">
        <div class="recipe-container">
            <h1>Fiche de nos ingrédients</h1>
            <ul>
                <xsl:for-each select="//ingredient">
                    <div id="{@id}">
                        <h2 >
                            <xsl:value-of select="nom"/>
                        </h2>
                        <p>
                            <strong>Apport Nutritif :</strong> <xsl:value-of select="apport_nutritif"/>
                        </p>
                        <p>
                            <strong>Apport Energetique :</strong> <xsl:value-of select="apport_energetique"/>
                        </p>
                        <p>
                            <strong>Saison :</strong> <xsl:value-of select="saison"/>
                        </p>
                        <p>
                            <strong>Descriptif :</strong> <xsl:copy-of select="descriptif/*"/>
                        </p>
                        <strong> Recettes : </strong>
                        <ul>
                            <!-- Liste des recettes où figure l'ingrédient -->
                            <xsl:for-each-group select="ref-recette" group-by="@ref">
                                <xsl:variable name="id_recette" select="@ref"/>
                                <li>
                                    <!-- Ajout d'un lien vers la fiche de la recette -->
                                    <a href="Recettes.html#{@ref}"> <xsl:value-of select="ancestor::node()/recettes/recette[@id=$id_recette]/nom/text()"/> </a>
                                </li>
                            </xsl:for-each-group>
                        </ul>
                    </div>
                </xsl:for-each>
            </ul>
        </div>


    </xsl:template>

</xsl:stylesheet>