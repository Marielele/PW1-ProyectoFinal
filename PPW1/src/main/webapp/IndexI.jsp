<%-- 
    Document   : IndexI
    Created on : Oct 13, 2021, 2:59:49 PM
    Author     : marie
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
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
                                    <input type="number" name="idUser" class="letras textUser" readonly value="${sessionScope["usuario"].getId()}" hidden>
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
                <h1 id="titulos">Crea una nota</h1>
                <div>
                    <form action="/crearNota" method="post" onsubmit="return validarNuevaNota()">
                        <input type="number" name="idUser" readonly size="1" class="letras textUser" value="${sessionScope["usuario"].getId()}" hidden>
                        <h3> Autor: <input type="text" name="usuario" readonly size="8"class="letras textUser" value="${sessionScope["usuario"].getNombre_Usuario()}">  </h3>
                        <div class="textCentro">
                            <textarea name="textarea" rows="15" cols="140" class="letras" id="areatexto"></textarea> <br />
                        </div>
                        <div class="textCentro" style="margin-top: 1em">
                            <input type="text" size="50" name="etiqueta" class="letras" placeholder="Etiqueta">
                        </div>
                        <div class="botonEspacio">
                            <input type="submit" class="btn letras" value="Crear nota">
                        </div>
                    </form>
                    <form action="/cargarnotas">
                        <input type="number" name="idUser" readonly class="letras textUser" value="${sessionScope["usuario"].getId()}" hidden>
                        <input type="number" name="pagina" value="0" class="letras textUser" hidden>
                        <input type="submit" class="btn letras" value="Cargar notas">
                    </form>
                </div>
            </div>
            <footer>
                <div class="pie letras">
                    2021 | Notitas uwu | A Carlele Company.
                </div>
            </footer>
        </div>
    </body>
</html>
