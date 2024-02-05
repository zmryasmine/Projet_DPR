<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="liste-des-auteurs">
        <div class="sidebar">
            <h1>Nos auteurs</h1>
            <ul>
                <xsl:for-each select="//auteur">
                    <!-- Liste par ordre alpahbétique de leur prénoms -->
                    <xsl:sort select="prenom" order="ascending"/>
                    <li>
                        <!-- Lien vers la fiche de l'auteur -->
                        <a href="#{@id}"> <xsl:value-of select="concat(prenom, ' ', nom)"/> </a>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>

    <xsl:template name="fiche-des-auteurs">
        <div class="auteur-container">
            <h1>Fiches de nos auteurs</h1>
            <ul>
                <xsl:for-each select="//auteur">
                    <!-- Ordre alpahbétique de leurs prénoms -->
                    <xsl:sort select="prenom" order="ascending"/>
                    <div id="{@id}">
                        <h2 >
                            <xsl:value-of select="concat(prenom, ' ', nom)"/>
                        </h2>
                        <p>
                            <strong>Age:</strong> <xsl:value-of select="age"/>
                        </p>
                        <p>
                            <strong>Pays:</strong> <xsl:value-of select="pays"/>
                        </p>
                        <p>
                            <strong>Sexe:</strong> <xsl:value-of select="genre"/>
                        </p>
                        <p>
                            <strong>Descriptif:</strong> <xsl:value-of select="bio"/>
                        </p>
                        <strong> Recettes : </strong>
                        <ul>
                            <!-- Lister les recettes de l'auteur -->
                            <xsl:for-each-group select="ref-recette" group-by="@ref">
                                <xsl:variable name="id_recette" select="@ref"/>
                                <!-- Ajout d'un lien vers la fiche de la recette -->
                                <li>
                                    <a href="Recettes.html#{@ref}">
                                        <xsl:value-of select="ancestor::node()/recettes/recette[@id=$id_recette]/nom/text()"/>
                                    </a>
                                </li>
                            </xsl:for-each-group>
                        </ul>
                    </div>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>

</xsl:stylesheet>