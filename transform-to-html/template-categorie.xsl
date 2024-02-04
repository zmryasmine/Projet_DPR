<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Définir le format de sortie nommé -->
    <xsl:output name="my-output" method="html" indent="yes" encoding="iso-8859-1"/>


    <xsl:template name="liste-des-categories">
        <h1>Liste des categories</h1>
        <ul>
            <xsl:for-each select="//categorie">
                <li>
                    <a href="#{@id}">
                        <xsl:value-of select="nom"/> :
                    </a>
                    
                        
                    <xsl:variable name="id-categorie" select="@id"/>
                        <ul>
                            <xsl:for-each select="ancestor::node()/sous-categories/sous-categorie/ref-categorie[@ref=$id-categorie]">
                                <xsl:variable name="id-sous-categorie" select="parent::node()/@id"/>
                                <li>
                                    <a href="#{$id-sous-categorie}">
                                        <xsl:value-of select="parent::node()/nom/text()"/>
                                    </a>
                                </li>
                            </xsl:for-each>
                        </ul>
                    
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>

    <xsl:template name="fiche-des-categories">
        <h1>Fiche des categories</h1>
        <ul>
            <xsl:for-each select="//categorie">
                <xsl:variable name="id-categorie" select="@id"/>
                <div id="{@id}">
                    <h2 >
                        <xsl:value-of select="nom"/>
                    </h2>
                    <p>
                        <strong>Descriptif :</strong> <xsl:copy-of select="descriptif"/>
                    </p>
                    <p>
                        <strong>Sous-Catégories : </strong>
                        <ul>
                            <xsl:for-each select="ancestor::node()/sous-categories/sous-categorie/ref-categorie[@ref=$id-categorie]">
                                <xsl:variable name="id-sous-categorie" select="parent::node()/@id"/>
                                <li>
                                    <div id="{$id-sous-categorie}">
                                    <h2 >
                                        <xsl:value-of select="parent::node()/nom/text()"/>
                                    </h2>
                                    <p>
                                        <strong>Descriptif</strong> <xsl:copy-of select="parent::node()/descriptif"/>
                                    </p>
                                     <p>
                                        <strong>Les recettes :</strong>
                                        <ul>
                                            <xsl:for-each select="ancestor::node()/recettes/recette/ref-souscategorie[@ref=$id-sous-categorie]">
                                                <xsl:variable name="id_recette" select="parent::node()/@id"/>
                                                <li>
                                                    <a href="Recettes.html#{$id_recette}">
                                                        <xsl:value-of select="parent::node()/nom/text()"/>
                                                    </a>
                                                </li>
                                            </xsl:for-each>
                                        </ul>
                                    </p>
                                    </div>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </p>
                </div>
            </xsl:for-each>
        </ul>
    </xsl:template>


     

</xsl:stylesheet>