<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Définition du format de sortie : page HTML-->
    <xsl:output name="my-output" method="html" indent="yes" encoding="iso-8859-1"/>

    <!-- Inclure les différentes feuilles XSLX qui continnent les templates propres à chacuns-->
    <xsl:include href="template-categorie.xsl"/>
    <xsl:include href="template-auteur.xsl"/>
    <xsl:include href="template-ingredient.xsl"/>
    <xsl:include href="template-produit.xsl"/>
    <xsl:include href="template-recette.xsl"/>

    <xsl:template match="/">
        <!-- Appel aux différents templates pour produire les fichiers de sortie -->
        <xsl:result-document href="pages_HTML/index.html" format="my-output">
            <html>
                <body>
                    <h1>Bienvenue sur le site de recettes de cuisine :</h1>
                    <xsl:call-template name="menu"/>
                    <h2>Réalisé par GOUMAIDI Kawthar et ZEMMOURI Yasmine</h2>
                </body>
            </html>
        </xsl:result-document>

        <xsl:result-document href="pages_HTML/Recettes.html" format="my-output">
            <html>
                <body>
                    <xsl:call-template name="menu"/>
                    <xsl:call-template name="liste-des-recettes"/>
                    <xsl:call-template name="fiche-des-recettes"/>
                </body>
            </html>
        </xsl:result-document>

        <xsl:result-document href="pages_HTML/Ingredients.html" format="my-output">
            <html>
                <body>
                    <xsl:call-template name="menu"/>
                    <xsl:call-template name="liste-des-ingredients"/>
                    <xsl:call-template name="fiche-des-ingredients"/>
                </body>
            </html>
        </xsl:result-document>

        <xsl:result-document href="pages_HTML/Auteurs.html" format="my-output">
            <html>
                <body>
                    <xsl:call-template name="menu"/>
                    <xsl:call-template name="liste-des-auteurs"/>
                    <xsl:call-template name="fiche-des-auteurs"/>
                </body>
            </html>
        </xsl:result-document>

        <xsl:result-document href="pages_HTML/Produits.html" format="my-output">
            <html>
                <body>
                    <xsl:call-template name="menu"/>
                    <xsl:call-template name="liste-des-produits"/>
                    <xsl:call-template name="fiche-des-produits"/>
                </body>
            </html>
        </xsl:result-document>

        <xsl:result-document href="pages_HTML/Categories.html" format="my-output">
            <html>
                <body>
                    <xsl:call-template name="menu"/>
                    <xsl:call-template name="liste-des-categories"/>
                    <xsl:call-template name="fiche-des-categories"/>
                </body>
            </html>
        </xsl:result-document>

    </xsl:template>

    <!-- Template du menu statique, présent à chaque page -->
    <xsl:template name="menu">
    <nav>
        <ul>
            <li>
                <a href="Recettes.html"> Nos Recettes</a>
            </li>
            <li>
                <a href="Ingredients.html"> Ingrédients utilisés dans nos recettes </a>
            </li>
            <li>
                <a href="Auteurs.html"> Nos plus belles plumes </a>
            </li>
            <li>
                <a href="Categories.html"> Catégories de recettes </a>
            </li>
            <li>
                <a href="Produits.html"> Nos Produits </a>
            </li>
        </ul>
    </nav>
</xsl:template>

</xsl:stylesheet>
