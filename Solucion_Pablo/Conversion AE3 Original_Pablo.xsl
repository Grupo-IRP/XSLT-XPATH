<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">

        <html>
            <head>
                <title>Instituto tecnologico Edix</title>
            </head>
            <body>
                <header>
                    <h1>
                        <xsl:value-of select="ite/empresa"/>
                    </h1>
                </header>
                <nav>
                        <a href="https://www.linkedin.com/in/felix-de-pablo-lobo/"><xsl:value-of select="ite/profesores/profesor/nombre"/></a>
                    <br/>
                    <br/>
                        <a href="https://www.grupoproeduca.com/"><xsl:value-of select="ite/empresa"/></a>
                    
                </nav>

                <table border="1">

                    <caption>
                        <h3>Profesorado</h3>
                    </caption>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="ite/profesores/profesor">

                            <tr>
                                <td>
                                    <xsl:value-of select="id"/>
                                </td>
                                <td>
                                    <xsl:value-of select="nombre"/>
                                </td>
                            </tr>


                        </xsl:for-each>

                    </tbody>
                </table>
                <table border="1">

                    <caption style="text-align:left;">
                        <h3>Grados y asignaturas</h3>
                    </caption>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Grado</th>
                            <th>Decreto-Titulo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="ite/ciclos/ciclo">
                            <tr>

                                <td>
                                    <xsl:value-of select="@id"/>
                                </td>
                                <td>
                                    <xsl:value-of select="nombre"/>
                                </td>
                                <td>
                                    <xsl:value-of select="grado"/>
                                </td>
                                <td>
                                    <xsl:value-of select="decretoTitulo/@año"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>

                <h4>Director</h4>
                <ul>
                    <xsl:for-each select="ite/director">
                        <li>Ubicación del despacho: <xsl:value-of select="despacho"/>
                        </li>
                        <li>Nombre: <xsl:value-of select="nombre"/>
                        </li>


                    </xsl:for-each>
                </ul>


                <h4>Jefe de estudios</h4>
                <ol>
                    <xsl:for-each select="ite/jefe_estudios">
                        <li>Ubicación del despacho: <xsl:value-of select="despacho"/>
                        </li>
                        <li>Nombre: <xsl:value-of select="nombre"/>
                        </li>


                    </xsl:for-each>
                </ol>

                <form action="procesarPeticion.jsp" method="post"></form>
                <fieldset>
                    <legend>Formulario de contacto:</legend>


                    <label for="nombre">Nombre:</label>
                    <input id="nombre" type="text" name="nombre"></input>
                    <br/>
                    <br/>

                    <label for="apellidos">Apellidos:</label>
                    <input id="apellidos" type="text" name="apellidos"></input>
                    <br/>
                    <br/>

                    <label for="email">Dirección de Email:</label>
                    <input id="email" type="email" name="email" placeholder="Escriba su e-mail"/>
                    <br/>
                    <br/>

                    <label for="edad">Edad:</label>
                    <input type="number" min="18" max="110" step="1" name="edad"/>
                    <br/>
                    <br/>

                    <label for="telefono">Nº de contacto:</label>
                    <input type="tel" name="telefono" placeholder="Escribe su número de telefono"/>
                    <br/>
                    <br/>


                    <label for="grados">Seleccione el ciclo/s sobre los que desea información: </label>
                    <xsl:for-each select="ite/ciclos/ciclo">
                        <input type="checkbox" name="grados" value=""></input>
                        <xsl:value-of select="@id"/>
                    </xsl:for-each>
                    <br/>
                    <br/>

                    <label for="comentarios">Observaciones: </label>
                    <br/>

                    <textarea style="resize: none;" rows="4" cols="60" name="comentarios" placeholder="Dejanos en comentarios todas tus dudas acerca de los grados."></textarea>
                    <br/>
                    <br/>

                    <input type="submit" value="Enviar"/>
                    <input type="reset" value="Limpiar datos"/>
                    <br/>
                    <br/>

                </fieldset>

                <footer>
                    <div>
                        <p>Web: <xsl:value-of select="ite/@web"/>
                        </p>
                        <p>Llamanos al: <xsl:value-of select="ite/telefono"/>
                        </p>
                        <p>Empresa: <xsl:value-of select="ite/empresa"/>
                        </p>

                    </div>
                </footer>




            </body>

        </html>


    </xsl:template>
</xsl:stylesheet>