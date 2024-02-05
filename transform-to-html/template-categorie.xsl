<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="liste-des-categories">
        <div class="sidebar">
            <h1>Nos catégories</h1>
            <ul>
                <xsl:for-each select="//categorie">
                    <li>
                        <!-- Ajout d'un lien vers la fiche de la catégorie -->
                        <a href="#{@id}"> <xsl:value-of select="nom"/> : </a>
                        <!-- Lister les sous-catégories de la catégorie -->
                        <xsl:variable name="id-categorie" select="@id"/>
                        <ul>
                            <xsl:for-each select="ancestor::node()/sous-categories/sous-categorie/ref-categorie[@ref=$id-categorie]">
                                <xsl:variable name="id-sous-categorie" select="parent::node()/@id"/>
                                <li>
                                    <!-- Ajout d'un lien vers la fiche de la sous-catégorie -->
                                    <a href="#{$id-sous-categorie}"> <xsl:value-of select="parent::node()/nom/text()"/> </a>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>

    <!-- Fiche des catégories avec la fiche de chacune de leurs sous-catégories intégrée-->
    <xsl:template name="fiche-des-categories">
        <div class="categorie-container">
            <h1>Fiche de nos catégories</h1>
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
                            <!-- Liste de ses sous-catégories -->
                            <strong>Sous-Catégories : </strong>
                            <ul>
                                <xsl:for-each select="ancestor::node()/sous-categories/sous-categorie/ref-categorie[@ref=$id-categorie]">
                                    <xsl:variable name="id-sous-categorie" select="parent::node()/@id"/>
                                    <li>
                                        <!-- Fiche de la sous-catégorie -->
                                        <div id="{$id-sous-categorie}">
                                            <h2 >
                                                <xsl:value-of select="parent::node()/nom/text()"/>
                                            </h2>
                                            <p>
                                                <strong>Descriptif</strong> <xsl:copy-of select="parent::node()/descriptif"/>
                                            </p>
                                            <p>
                                                <!-- Liste des recettes de la sous-catégories -->
                                                <strong>Les recettes :</strong>
                                                <ul>
                                                    <!-- Pour chaque recette où ref-souscatégorie = id de la sous-catégorie actuelle-->
                                                    <xsl:for-each select="ancestor::node()/recettes/recette/ref-souscategorie[@ref=$id-sous-categorie]">
                                                        <xsl:variable name="id_recette" select="parent::node()/@id"/>
                                                        <li>
                                                            <!-- Ajout d'un lien vers la fiche de la recette-->
                                                            <a href="Recettes.html#{$id_recette}"> <xsl:value-of select="parent::node()/nom/text()"/> </a>
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
        </div>

    </xsl:template>

</xsl:stylesheet>