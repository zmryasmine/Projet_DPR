<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



    <xsl:template name="liste-des-produits">
        <h1>Liste des Produits</h1>
        <ul>
            <xsl:for-each select="//produit">
                <li>
                    <a href="#{@id}">
                        <xsl:value-of select="nom"/>
                    </a>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>




    <xsl:template name="fiche-des-produits">
        <h1>Fiche des produits</h1>
        <ul>
            <xsl:for-each select="//produit">
                <div id="{@id}">
                    <h2 >
                        <xsl:value-of select="nom"/>

                    </h2>
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
                </div>
            </xsl:for-each>
        </ul>
    </xsl:template>



</xsl:stylesheet>