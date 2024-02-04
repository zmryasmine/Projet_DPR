<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- D�finir le format de sortie nomm� -->
    <xsl:output name="my-output" method="html" indent="yes" encoding="iso-8859-1"/>

    <xsl:include href="template-categorie.xsl"/>
    <xsl:include href="template-auteur.xsl"/>
    <xsl:include href="template-ingredient.xsl"/>
    <xsl:include href="template-produit.xsl"/>
    <xsl:include href="template-recette.xsl"/>

    <xsl:template match="/">
        <!-- Appel aux diff�rents templates pour produire les fichiers de sortie -->
        <xsl:result-document href="index.html" format="my-output">
            <html>
                <body>
                    <h1>Bienvenue sur le site de recettes de cuisine</h1>
                    <xsl:call-template name="menu"/>
                </body>
            </html>
        </xsl:result-document>

        <xsl:result-document href="Recettes.html" format="my-output">
            <html>
                <body>
                    <xsl:call-template name="menu"/>
                    <xsl:call-template name="liste-des-recettes"/>
                    <xsl:call-template name="fiche-des-recettes"/>
                </body>
            </html>
        </xsl:result-document>


        <xsl:result-document href="Ingredients.html" format="my-output">
            <html>
                <body>
                    <xsl:call-template name="menu"/>
                    <xsl:call-template name="liste-des-ingredients"/>
                    <xsl:call-template name="fiche-des-ingredients"/>
                </body>
            </html>
        </xsl:result-document>

        <xsl:result-document href="Auteurs.html" format="my-output">
            <html>
                <body>
                    <xsl:call-template name="menu"/>
                    <xsl:call-template name="liste-des-auteurs"/>
                    <xsl:call-template name="fiche-des-auteurs"/>
                </body>
            </html>
        </xsl:result-document>

        <xsl:result-document href="Produits.html" format="my-output">
            <html>
                <body>
                    <xsl:call-template name="menu"/>
                    <xsl:call-template name="liste-des-produits"/>
                    <xsl:call-template name="fiche-des-produits"/>
                </body>
            </html>
        </xsl:result-document>

        <xsl:result-document href="Categories.html" format="my-output">
            <html>
                <body>
                    <xsl:call-template name="liste-des-categories"/>
                    <xsl:call-template name="fiche-des-categories"/>
                </body>
            </html>
        </xsl:result-document>

    </xsl:template>

    <xsl:template name="menu">
    <nav>
        <ul>
            <li>
            <a href="Recettes.html">
                 Nos Recettes
            </a></li>
      <li>
                            <a href="Ingredients.html">
                                Ingr�dients utilis�s dans nos recettes
                            </a>
                        </li>
                        <li>
                            <a href="Auteurs.html">
                                Nos plus belle plumes
                            </a>
                        </li>
                        <li>
                            <a href="Categories.html">
                                Cat�gories de recettes
                            </a>
                        </li>
                        <li>
                            <a href="Produits.html">
                                Nos Produits
                            </a>
                        </li>
        </ul>
    </nav>
</xsl:template>


</xsl:stylesheet>
