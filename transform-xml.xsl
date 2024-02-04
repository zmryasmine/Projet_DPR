<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> <xsl:output method="xml" indent="yes" />


    <xsl:template match="/">
        <site xmlns:xsi=
                       "http://www.w3.org/2001/XMLSchema-instance"
               xsi:noNamespaceSchemaLocation="donnees_recettes_transform.xsd">
            <xsl:call-template name="liste-recettes"/>
            <xsl:call-template name="liste-ingredients"/>
            <xsl:call-template name="liste-auteurs"/>
            <xsl:call-template name="liste-categories"/>
            <xsl:call-template name="liste-sous-categories"/>
            <xsl:call-template name="liste-produits"/>
        </site>
    </xsl:template>

    <xsl:template name="liste-recettes">
        <recettes>
            <xsl:for-each select="//objet[@type = 'recette']">
                <recette>
                    <xsl:attribute name="id">
                        <xsl:value-of select="@id"/>
                    </xsl:attribute>
                    <nom>
                        <xsl:value-of select="info[@nom='nom']/@value"/>
                    </nom>
                    <resume>
                        <xsl:value-of select="info[@nom='résumé']/*"/>
                    </resume>
                    <xsl:for-each select="info[@nom='ingrédient']">
                        <ref-ingredient>
                            <xsl:attribute name="ref">
                                <xsl:value-of select="@value"/>
                            </xsl:attribute>
                            <xsl:attribute name="quantite">
                                <xsl:value-of select="@quantite"/>
                            </xsl:attribute>
                        </ref-ingredient>
                    </xsl:for-each>
                    <ref-souscategorie>
                        <xsl:attribute name="ref">
                            <xsl:value-of select="info[@nom='sous-catégorie']/@value"/>
                        </xsl:attribute>
                    </ref-souscategorie>
                    <ref-auteur>
                        <xsl:attribute name="ref">
                            <xsl:value-of select="info[@nom='auteur']/@value"/>
                        </xsl:attribute>
                    </ref-auteur>
                    <photo>
                        <xsl:value-of select="info[@nom='photo']/@value"/>
                    </photo>
                    <date_publication>
                        <xsl:value-of select="info[@nom='date_publication']/@value"/>
                    </date_publication>
                    <difficulté>
                        <xsl:value-of select="info[@nom='difficulté']/@value"/>
                    </difficulté>
                    <nbre_personnes>
                        <xsl:value-of select="info[@nom='nbre_personnes']/@value"/>
                    </nbre_personnes>
                    <temps_prep>
                        <xsl:value-of select="info[@nom='Préparation']/@value"/>
                    </temps_prep>
                    <temps_cuisson>
                        <xsl:value-of select="info[@nom='Cuisson']/@value"/>
                    </temps_cuisson>
                    <temps_repos>
                        <xsl:value-of select="info[@nom='Repos']/@value"/>
                    </temps_repos>
                    <preparation>
                        <xsl:copy-of select="info[@nom='Préparation']/*"/>
                    </preparation>
                    <note>
                        <xsl:value-of select="info[@nom='note']/@value"/>
                    </note>
                </recette>
            </xsl:for-each>
        </recettes>
    </xsl:template>
    <xsl:template name="liste-ingredients">
        <listes_ingredients>
            <xsl:for-each select="//objet[@type = 'ingrédient']">
                <ingredient>
                    <xsl:attribute name="id">
                        <xsl:value-of select="@id"/>
                    </xsl:attribute>
                    <nom>
                        <xsl:value-of select="info[@nom='nom']/@value"/>
                    </nom>
                    <apport_energetique>
                        <xsl:value-of select="info[@nom='Apport énergétique']/@value"/>
                    </apport_energetique>
                    <apport_nutritif>
                        <xsl:value-of select="info[@nom='Apport nutritif']/@value"/>
                    </apport_nutritif>
                    <saison>
                        <xsl:value-of select="info[@nom='saison']/@value"/>
                    </saison>
                    <descriptif>
                        <xsl:copy-of select="info[@nom='descriptif']/*"/>
                    </descriptif>
                    <xsl:for-each select="info[@nom='recette']">
                        <ref-recette>
                            <xsl:attribute name="ref">
                                <xsl:value-of select="@value"/>
                            </xsl:attribute>
                        </ref-recette>
                    </xsl:for-each>
                </ingredient>
            </xsl:for-each>
        </listes_ingredients>
    </xsl:template>
    <xsl:template name="liste-auteurs">
        <auteurs>
            <xsl:for-each select="//objet[@type = 'auteur']">
                <auteur>
                    <xsl:attribute name="id">
                        <xsl:value-of select="@id"/>
                        <!--<xsl:value-of select="info[@nom='id']/@value"/>-->
                    </xsl:attribute>

                    <nom>
                        <xsl:value-of select="info[@nom='nom']/@value"/>
                    </nom>
                    <prenom>
                        <xsl:value-of select="info[@nom='prenom']/@value"/>
                    </prenom>
                    <age>
                        <xsl:value-of select="info[@nom='age']/@value"/>
                    </age>
                    <pays>
                        <xsl:value-of select="info[@nom='pays']/@value"/>
                    </pays>
                    <genre>
                        <xsl:value-of select="info[@nom='sexe']/@value"/>
                    </genre>
                    <bio>
                        <xsl:value-of select="info[@nom='biographie']/*"/>
                    </bio>
                    <xsl:for-each select="info[@nom='recette']">
                        <ref-recette>
                            <xsl:attribute name="ref">
                                <xsl:value-of select="@value"/>
                            </xsl:attribute>
                        </ref-recette>
                    </xsl:for-each>
                </auteur>
            </xsl:for-each>
        </auteurs>
    </xsl:template>
    <xsl:template name="liste-categories">
        <categories>
            <xsl:for-each select="//objet[@type = 'catégorie']">
                <categorie>
                    <xsl:attribute name="id">
                        <xsl:value-of select="@id"/>
                    </xsl:attribute>
                    <nom>
                        <xsl:value-of select="info[@nom='nom']/@value"/>
                    </nom>
                    <descriptif>
                        <xsl:value-of select="info[@nom='descriptif']/*"/>
                    </descriptif>
                </categorie>
            </xsl:for-each>
        </categories>
    </xsl:template>
    <xsl:template name="liste-sous-categories">
        <sous-categories>
            <xsl:for-each select="//objet[@type = 'sous-catégorie']">
                <sous-categorie>
                    <xsl:attribute name="id">
                        <xsl:value-of select="@id"/>
                    </xsl:attribute>
                    <nom>
                        <xsl:value-of select="info[@nom='nom']/@value"/>
                    </nom>
                    <descriptif>
                        <xsl:value-of select="info[@nom='descriptif']/*"/>
                    </descriptif>
                    <ref-categorie>
                        <xsl:attribute name="ref">
                            <xsl:value-of select="info[@nom='catégorie']/@value"/>
                        </xsl:attribute>
                    </ref-categorie>
                </sous-categorie>
            </xsl:for-each>
        </sous-categories>
    </xsl:template>
    <xsl:template name="liste-produits">
        <produits>
            <xsl:for-each select="//objet[@type = 'produit']">
                <produit>
                    <xsl:attribute name="id">
                        <xsl:value-of select="@id"/>
                    </xsl:attribute>
                    <nom>
                        <xsl:value-of select="info[@nom='nom']/@value"/>
                    </nom>
                    <xsl:for-each select="info[@nom='ingrédient']">
                        <ref-ingredient>
                            <xsl:attribute name="ref">
                                <xsl:value-of select="@value"/>
                            </xsl:attribute>
                        </ref-ingredient>
                    </xsl:for-each>
                </produit>
            </xsl:for-each>
        </produits>
    </xsl:template>

</xsl:stylesheet>