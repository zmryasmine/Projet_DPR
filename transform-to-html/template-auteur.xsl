<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="liste-des-auteurs">
        <h1>Liste des auteurs</h1>
        <ul>
            <xsl:for-each select="//auteur">
                <xsl:sort select="prenom" order="ascending"/>
                <li>
                    <a href="#{@id}">
                        <xsl:value-of select="concat(prenom, ' ', nom)"/>
                    </a>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>


    <xsl:template name="fiche-des-auteurs">
        <h1>Fiche des auteurs</h1>
        <ul>
            <xsl:for-each select="//auteur">
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

                        <xsl:for-each-group select="ref-recette" group-by="@ref">
                            <xsl:variable name="id_recette" select="@ref"/>

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
    </xsl:template>



</xsl:stylesheet>