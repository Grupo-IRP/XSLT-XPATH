<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <instituto>
            <nombre><xsl:value-of select="ite/@nombre"/></nombre>
            <web><xsl:value-of select="ite/@web"/></web>
            <grupo><xsl:value-of select="ite/empresa"/></grupo>
            <tlf><xsl:value-of select="ite/telefono"/></tlf>
            <claustro>
                <xsl:for-each select="ite/profesores/profesor">
                    <profesor>                    
                        <xsl:attribute name="id">
                            <xsl:value-of select="id"/>
                         </xsl:attribute>                 
                        <nombre><xsl:value-of select="nombre"/></nombre>
                    </profesor>
                </xsl:for-each>
            </claustro>
            <rector>
                <xsl:attribute name="nombre">
                    <xsl:value-of select="ite/director/nombre"/>
                </xsl:attribute>
                <localizacion><xsl:value-of select="ite/director/despacho"/></localizacion>
            </rector>
            <j_estudios>
                <xsl:attribute name="nombre">
                    <xsl:value-of select="ite/jefe_estudios/nombre"/>
                </xsl:attribute>
                <localizacion><xsl:value-of select="ite/jefe_estudios/despacho"/></localizacion>
            </j_estudios>
            <cursos>
                <xsl:for-each select="ite/ciclos/ciclo">
                    <curso>                    
                        <xsl:attribute name="nombre">
                            <xsl:value-of select="nombre"/>
                        </xsl:attribute>
                        <ID><xsl:value-of select="@id"/></ID>
                        <tipoGrado><xsl:value-of select="grado"/></tipoGrado>
                        <decreto><xsl:value-of select="decretoTitulo/@año"/></decreto>                        
                    </curso>
                </xsl:for-each>
            </cursos>
        </instituto>
    </xsl:template>
</xsl:stylesheet>