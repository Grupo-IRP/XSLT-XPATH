<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">


<delegacion>
    <nombre><xsl:value-of select="ite/@nombre"/></nombre>
    <web><xsl:value-of select="ite/@web"/></web>
    <tribu><xsl:value-of select="ite/@empresa"/></tribu>
    <contacto><xsl:value-of select="ite/@telefono"/></contacto>
    <profesorado>
        <xsl:for-each select="ite/profesores/profesor">
        <docente>
            <xsl:attribute name="identificacion">
                <xsl:value-of select="id"/>
            </xsl:attribute>  
            <renombre><xsl:value-of select="nombre"/></renombre>          
        </docente>
    </xsl:for-each>   
    </profesorado>
    <dirigente>
        <xsl:attribute name="nombre">
            <xsl:value-of select="ite/director/nombre"/>
        </xsl:attribute>
        <Ubicacion><xsl:value-of select="ite/director/despacho"/></Ubicacion>
    </dirigente>
    <jefe_maestro>
        <xsl:attribute name="mote">
            <xsl:value-of select="ite/jefe_estudios/nombre"/>
        </xsl:attribute>
        <xsl:attribute name="ubicacion">
            <xsl:value-of select="ite/jefe_estudios/despacho"/>
        </xsl:attribute>
    </jefe_maestro>
    <grados>
        <xsl:for-each select="ite/ciclos/ciclo">
            <grado>                    
                <xsl:attribute name="designacion">
                    <xsl:value-of select="nombre"/>
                </xsl:attribute>
                <ID><xsl:value-of select="@id"/></ID>
                <tipo_grado><xsl:value-of select="grado"/></tipo_grado>
                <decreto><xsl:value-of select="decretoTitulo/@año"/></decreto>                        
    </grado>
        </xsl:for-each>
    </grados>
</delegacion>

</xsl:template>
</xsl:stylesheet>
