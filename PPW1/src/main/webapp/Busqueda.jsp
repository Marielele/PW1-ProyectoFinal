<%-- 
    Document   : Busqueda
    Created on : Nov 15, 2021, 8:03:52 PM
    Author     : marie
--%>

<%@page import="java.util.List"%>
<%@page import="misc.Notas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar</title>
        <link rel="stylesheet" href="estilo/principal.css"/>
        <link rel="shortcut icon" href="estilo/nota.png"> 
        <script src="https://kit.fontawesome.com/89f32dc1fd.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Libre+Franklin:wght@300&family=Prata&display=swap" rel="stylesheet">
    </head>
    <body>
        <div class="pagina">
            <header>
                <div class="sticki">
                    <div class="cabezera">  
                        <a href="IndexI.jsp" class="letras blanco"> 
                            <b>Notitas uwu</b>
                        </a>
                        <div class="aLaDer">
                            <div>
                                <form action="/buscarNota">
                                    <span title="Busqueda avanzada">
                                        <a href="#" id="buscaricon">
                                            <i class="fas fa-search-plus"></i>
                                        </a>
                                    </span>
                                    <input type="number" name="idUser" id="idUser" class="letras textUser" readonly value="${sessionScope["usuario"].getId()}" hidden>
                                    <input type="text" name="buscar" class="inpt letras" placeholder="Buscar nota">
                                    <input type="submit" id="buton" class="letras" value="Buscar">
                                </form>
                            </div>
                            <div class="letras" id="nombreUser">
                                <img src="${sessionScope["usuario"].getImagen()}" class="imgUser">
                                <a href="/perfil.jsp" class="asimple">
                                    ${sessionScope["usuario"].getNombre_Usuario()}
                                </a>
                            </div> 
                            <span title="Cerrar sesión">
                                <form action="/cerrarSesion" method="POST">
                                    <button type="submit" class="btnCerrar">
                                        <i class="fas fa-power-off"></i>
                                    </button>
                                </form>
                            </span>
                        </div>
                    </div>
                </div>
            </header>
            <div class="contenedor letras">
                <div>
                    <h1 class="titulos">Coincidencias con: ${param.buscar}</h1>
                </div>
                <div>
                    <hr>
                    <%
                        List<Notas> Busqueda = (List<Notas>) request.getAttribute("bNotas");
                        for (Notas lasnotas : Busqueda) { %>
                    <div class="marconotas">
                        <div>
                            <%
                                out.print(lasnotas.getId());
                            %>
                        </div>
                        <div style="margin-left:10px;">
                            <%
                                out.print(lasnotas.getTexto());
                            %>
                        </div>
                        <div style="margin-left: 15px; margin-right: 15px;">
                            <form action="/etiquetas">
                                <input type="number" value="${sessionScope["usuario"].getId()}" hidden name="idUser">
                                <input type="text" name="etiqueta" value="<% out.print(lasnotas.getEtiqueta());  %>" hidden>
                                #<input type="submit" value="<% out.print(lasnotas.getEtiqueta());  %>" class="etiquetilla letras">
                            </form>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
            <footer>
                <div class="pie letras">2021 | Notitas uwu | A Carlele Company.</div>
            </footer>
        </div>
    </body>
</html>
