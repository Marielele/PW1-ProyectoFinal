<%-- 
    Document   : EditarNota
    Created on : Nov 10, 2021, 9:00:52 PM
    Author     : marie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina de edición</title>
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
                    <h1 class="titulos">Editar nota</h1>
                </div>
                <form action="/actualizarNota" method="post" onsubmit=" return validarNuevaNota()">
                    <div class="DisplayFlex">
                        <div>
                            <input name="idnota" type="number" size="1" class="letras" value="${requestScope["nota"].getId()}" hidden>
                        </div>
                        <div>
                            <textarea name="textarea" id="areatexto" cols="140" rows="10" class="letras">${requestScope["nota"].getTexto()}</textarea>
                        </div>
                    </div>
                    <div class="centrito">
                        <input type="text" size="30" name="etiquetas" placeholder="Etiqueta" class="letras" value="${requestScope["nota"].getEtiqueta()}">
                    </div>
                    <div class="btnENotas">
                        <input type="submit" class="btn letras" value="Editar">
                    </div>
                </form>
            </div>
            <footer>
                <div class="pie letras">2021 | Notitas uwu | A Carlele Company.</div>
            </footer>
        </div>
    </body>
</html>
