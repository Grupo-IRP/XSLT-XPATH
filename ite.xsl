<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>            
            <head>
                <title>Instituto Tecnológico Edix</title>
                <link rel="stylesheet" href="css/ite.css"></link>
            </head>
            <header>
                <h1><xsl:value-of select="ite/@nombre"/></h1>
            </header>
            <nav>
                <a class="nav" href="#Director"> Director </a>
                <a class="nav" href="#jefe_estudios"> Jefe de Estudios </a>
                <a class="nav" href="#profesores"> Claustro </a>
                <a class="nav" href="#ciclos"> Ciclos </a>
                <a class="nav" href="#contacto"> Contacto </a>
            </nav>

            <body>                        

               <main>
                   <div class="lista">
                        <h2>Director</h2>
                        <ul>
                            <li>Nombre: <xsl:value-of select="ite/director/nombre"/></li>
                            <li>Despacho: <xsl:value-of select="ite/director/despacho"/></li>
                        </ul>
                    </div>
                    <div class="lista">
                        <h2>Jefe de Estudios</h2>
                        <ul>
                            <li>Nombre: <xsl:value-of select="ite/jefe_estudios/nombre"/></li>
                            <li>Despacho: <xsl:value-of select="ite/jefe_estudios/despacho"/></li>
                        </ul>
                    </div>
                    <div class="tabla">
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
                                        <td class="textoTabla"><xsl:value-of select="nombre"/></td>       
                                    </tr>             
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </div>
                    <div class="tabla">
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
                                        <td class="textoTabla"><xsl:value-of select="decretoTitulo/@año"/></td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </div>
                </main>
                <form id="contacto" action="procesarPeticion.jsp" metod="get">
                    <fieldset>
                        <legend><h3>Contacto</h3></legend>
                            <label for="nombre">Nombre: </label>
                            <input id="nombre" type="text" name="nombre"/>
                            <br/>
                            <br/>
                            <label for="apellidos">Apellidos: </label>
                            <input id="apellidos" type="text" name="apellidos"/>
                            <br/>
                            <br/>
                            <label for="dni">DNI: </label>
                            <input id="dni" type="text" name="dni"/>
                            <br/>
                            <br/>                            
                            <label for="telf">Telefono: </label>
                            <input id="telf" type="tel" name="telf"/>
                            <br/>
                            <br/>
                            <label for="mail">E-mail: </label>
                            <input id="mail" type="email" name="mail"/>
                            <br/>
                            <br/>
                            <label for="ciclo">Ciclo que quieres cursar: </label>
                            <input id="ciclo" type="radio" name="ciclo" value="A"/><xsl:value-of select="ite/ciclos/ciclo[1]/@id"/>
                            <input id="ciclo" type="radio" name="ciclo" value="W"/><xsl:value-of select="ite/ciclos/ciclo[2]/@id"/>
                            <input id="ciclo" type="radio" name="ciclo" value="M"/><xsl:value-of select="ite/ciclos/ciclo[3]/@id"/>                            
                            <br/>
                            <br/>
                            <input type="submit" value="Enviar datos"/>
                            <input type="reset" value="Limpiar formulario"/>    
                    </fieldset>
                </form>
            </body>            
            <footer>
                <p>Empresa: <a href="https://www.grupoproeduca.com/" target="blank"><xsl:value-of select="ite/empresa"/></a></p>  
                <p>Telefono: <xsl:value-of select="ite/telefono"/></p>  
                <p>Web Edix: <a href="https://institutotecnologico.edix.com" target="blank"><xsl:value-of select="ite/@web"/></a></p>         
            </footer>

        </html>
    </xsl:template>    
</xsl:stylesheet>