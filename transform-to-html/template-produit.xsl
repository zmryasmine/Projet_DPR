<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="liste-des-produits">
        <div class="sidebar">
            <h1>Nos Produits</h1>
            <ul>
                <xsl:for-each select="//produit">
                    <li>
                        <!-- Lien vers la fiche de chaque produit -->
                        <a href="#{@id}"> <xsl:value-of select="nom"/> </a>
                    </li>
                </xsl:for-each>
            </ul>
        </div>

    </xsl:template>

    <xsl:template name="fiche-des-produits">
        <div class="produit-container">
            <h1>Fiche de nos produits</h1>
            <ul>
                <xsl:for-each select="//produit">
                    <div id="{@id}">
                        <h2 >
                            <xsl:value-of select="nom"/>
                        </h2>
                        <strong>Les ingrédients :</strong>
                        <ul>
                            <!-- Liste des ingrédients de ce produit -->
                            <xsl:for-each select="ref-ingredient">
                                <xsl:variable name="id_ingredient" select="@ref"/>
                                <li>
                                    <!-- Ajout d'un lien vers la fiche de l'ingrédient -->
                                    <a href="Ingredients.html#{$id_ingredient}">
                                        <xsl:value-of select="ancestor::node()/listes_ingredients/ingredient[@id=$id_ingredient]/nom/text()"/> </a>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>

</xsl:stylesheet>