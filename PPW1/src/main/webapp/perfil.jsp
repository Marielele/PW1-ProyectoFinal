<%-- 
    Document   : perfil
    Created on : Nov 11, 2021, 6:08:14 AM
    Author     : marie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil</title>
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
                <form action="/editarUsuario" method="post" onsubmit="return validaEditarUsuario()">
                    <div class="adentro">
                        <div style="height: 12em; width: 12em;" class="borde">
                            <img class="imgPrev" src="${sessionScope["usuario"].getImagen()}">
                        </div>
                        <div style="height: 12em; width: 80%; margin-left: 10px" class="borde">
                            <h1 class="h0"> 
                                ${sessionScope["usuario"].getNombre_Usuario()}
                            </h1>
                            <input type="text" name="nombreuser" class="textUser letras" value="${sessionScope["usuario"].getNombre_Usuario()}">
                        </div>
                    </div>
                    <div style="height: 2em; width: 12em; margin-left: 2em">
                        <div class="file-select letras" id="src-file1" >
                            <input type="file" id="avatar" name="avatar" accept=".png, .jpg, .jpeg" required>
                        </div>
                    </div>
                    <hr>
                    <div class="adentroSegus">
                        <div style="height: 15em; width: 82%;" class="borde DisplayFlex">
                            <div class="DisplayF">
                                <label for="nombre">Nombre(s)</label>
                                <input type="text" class="inptmini letras" name="nombre" id="name" value="${sessionScope["usuario"].getNombre()}" required>
                                <label for="apellido">Apellidos</label>
                                <input type="text" class="inptmini letras" name="apellido" id="apellidos" value="${sessionScope["usuario"].getApellido()}" required>
                                <label for="email">Email</label>
                                <input type="text" class="inptmini letras" name="email" id="email" value="${sessionScope["usuario"].getCorreo()}" required>
                                <label for="contra">Contraseña</label>
                                <input type="text" class="inptmini letras" name="contra" id="pass" value="${sessionScope["usuario"].getContrasena()}" required>
                            </div>
                            <div class="DisplayF">
                                <label for="dia">Dia</label>
                                <input type="text" class="inptmini letras" name="dia" id="dia" value="${sessionScope["usuario"].getDia()}" required>
                                <label for="mes">Mes</label>
                                <input type="text" class="inptmini letras" name="mes" id="mes" value="${sessionScope["usuario"].getMes()}" required>
                                <label for="anio">Año</label>
                                <input type="text" class="inptmini letras" name="anio" id="anio" value="${sessionScope["usuario"].getAnio()}" required>
                            </div>
                        </div>
                    </div>
                    <div class="aLaDer">
                        <input type="submit" value="Editar datos" class="btn">
                    </div>
                </form>
            </div>
            <footer>
                <div class="pie letras">2021 | Notitas uwu | A Carlele Company.</div>
            </footer>
        </div>
    </body>
</html>
