<%-- 
    Document   : notascreadas
    Created on : Oct 14, 2021, 12:38:10 PM
    Author     : marie
--%>

<%@page import="java.util.List"%>
<%@page import="misc.Notas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <link rel="stylesheet" href="estilo/principal.css"/>
        <link rel="shortcut icon" href="estilo/nota.png"> 
        <script src="https://kit.fontawesome.com/89f32dc1fd.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Libre+Franklin:wght@300&family=Prata&display=swap" rel="stylesheet">
        <script src="jquery-3.6.0.min.js"></script>
        <script src="validaciones.js"></script>
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
                <div class="textCentro">
                    <!-- <h1 class="titulos">Notas de: ${sessionScope["usuario"].getNombre_Usuario()}</h1> -->
                    <h1 class="titulos">Dashboard</h1>
                </div>
                <div>
                    <div>
                        <hr>
                        <%  List<Notas> notas = (List<Notas>) request.getAttribute("notas");
                            for (Notas misnotas : notas) { %> 
                        <div class="lineaElegante">
                            <div>
                                <%
                                    out.print(misnotas.getId());
                                %>
                            </div>
                            <div style="margin-left: 10px">
                                <%
                                    out.print(misnotas.getTexto());
                                %>
                            </div>
                            <div style="margin-left: 15px; margin-right: 15px;">
                                <form action="/etiquetas">
                                    <input type="number" value="${sessionScope["usuario"].getId()}" hidden name="idUser">
                                    <input type="text" name="etiqueta" value="<% out.print(misnotas.getEtiqueta());  %>" hidden>
                                    #<input type="submit" value="<% out.print(misnotas.getEtiqueta());  %>" class="etiquetilla letras">
                                </form>
                            </div>
                            <form action="/verNota" method="POST">
                                <input type="number" name="idUser" class="letras" value="<% out.print(misnotas.getId()); %>" hidden>
                                <button type="submit" class="btnEditar">
                                    <span title="Editar nota">
                                        <i class="fas fa-pencil-alt iconpencil"></i>  
                                    </span>  
                                </button>
                            </form>                        
                        </div>
                        <% }%>
                        <br>
                        <div class="centadisimo">
                            <form action="/cargarnotas">
                                <input type="number" name="idUser" readonly class="letras textUser" value="${sessionScope["usuario"].getId()}" hidden>
                                <input type="number" name="pagina" value="0" class="letras textUser" hidden>
                                <button type="submit" class="RL">
                                    <i class="fas fa-arrow-alt-circle-left"></i>
                                </button>
                            </form>
                            <div style="width: 10px;">
                                <input type="number" hidden value="0" id="pagAct">
                            </div>
                            <form action="/cargarnotas">
                                <input type="number" name="idUser" readonly class="letras textUser" value="${sessionScope["usuario"].getId()}" hidden>
                                <input type="number" name="pagina" value="1" class="letras textUser" hidden>
                                <button type="submit" class="RL">
                                    <i class="fas fa-arrow-alt-circle-right"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                    <hr>
                    <form action="/eliminarNota" method="post" onsubmit="return validaBorrarNota()">
                        <h3 class="titulos">Borrar nota</h3>
                        <input type="number" name="idnota" id="notaABorrar">
                        <input type="submit" class="btn letras" value="Borrar">
                    </form>
                </div>
            </div>
            <footer>
                <div class="pie letras">2021 | Notitas uwu | A Carlele Company.</div>
            </footer>
        </div>
    </body>
</html>
