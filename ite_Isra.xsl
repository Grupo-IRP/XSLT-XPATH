<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title>Instituto Tecnológico Edix</title>
            </head>
            <body>
                
                <h1><xsl:value-of select="ite/@nombre"/></h1>

                <nav>
                    <a href="#Director"> Director </a>
                    <a href="#jefe_estudios"> Jefe de Estudios </a>
                    <a href="#profesores"> Claustro </a>
                    <a href="#ciclos"> Ciclos </a>
                    <a href="#contacto"> Contacto </a>
                </nav>

                <main>
                    <h2 id="Director">Director</h2>
                    <ul>
                        <li>Nombre: <xsl:value-of select="ite/director/nombre"/></li>
                        <li>Despacho: <xsl:value-of select="ite/director/despacho"/></li>
                    </ul>

                    <h2 id="jefe_estudios">Jefe de Estudios</h2>
                    <ul>
                        <li>Nombre: <xsl:value-of select="ite/jefe_estudios/nombre"/></li>
                        <li>Despacho: <xsl:value-of select="ite/jefe_estudios/despacho"/></li>
                    </ul>
                    
                    <h2 id="profesores">Claustro de profesores</h2>
                    <table border="1">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="ite/profesores/profesor">
                                <tr>
                                    <td><xsl:value-of select="id"/></td>
                                    <td><xsl:value-of select="nombre"/></td>       
                                </tr>             
                            </xsl:for-each>
                        </tbody>
                    </table>

                    <h2 id="ciclos">Ciclos que se cursan</h2>
                    <table border="1">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Grado</th>
                                <th>Decreto Título</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="ite/ciclos/ciclo">
                                <tr>
                                    <td><xsl:value-of select="@id"/></td>
                                    <td><xsl:value-of select="nombre"/></td>
                                    <td><xsl:value-of select="grado"/></td>
                                    <td><xsl:value-of select="decretoTitulo/@año"/></td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </main>
                <form id="contacto" action="procesarPeticion.jsp" metod="get">
                    <fieldset>
                        <legend><h3>Contacto</h3></legend>
                            <label for="nombre">Nombre: </label>
                            <input id="nombre" type="text" name="nombre"/>
                            <label for="apellidos">Apellidos: </label>
                            <input id="apellidos" type="text" name="apellidos"/>
                            <label for="dni">DNI: </label>
                            <input id="dni" type="text" name="dni"/>
                            <label for="telf">Telefono: </label>
                            <input id="telf" type="tel" name="telf"/>
                            <label for="mail">E-mail: </label>
                            <input id="mail" type="email" name="mail"/>
                            <label for="ciclo">Ciclo que quieres cursar: </label>
                            <input id="ciclo" type="radio" name="ciclo" value="A"/>ASIR
                            <input id="ciclo" type="radio" name="ciclo" value="W"/>DAW
                            <input id="ciclo" type="radio" name="ciclo" value="M"/>DAM

                            <input type="submit" value="Enviar datos"/>
                            <input type="reset" value="Limpiar formulario"/>    
                    </fieldset>
                </form>
            </body>            
            <footer>
                <p>Empresa: <xsl:value-of select="ite/empresa"/></p>  
                <p>Telefono: <xsl:value-of select="ite/telefono"/></p>  
                <p>Web: <xsl:value-of select="ite/@web"/></p>                
            </footer>

        </html>
    </xsl:template>    
</xsl:stylesheet>