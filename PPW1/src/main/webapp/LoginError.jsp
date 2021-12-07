<%-- 
    Document   : LoginError
    Created on : Nov 5, 2021, 12:38:10 PM
    Author     : marie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="estilo/css.css"/>
        <link rel="shortcut icon" href="estilo/nota.png"> 
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Libre+Franklin:wght@300&family=Prata&display=swap" rel="stylesheet">
        <script src="jquery-3.6.0.min.js"></script>
        <script src="script.js"></script>
    </head>
    <body id="loginregister">
        <div>
            <header id="IniyRegis" class="letras">
                <a href="index.html"> <b>Notitas uwu</b> </a>
            </header>
        </div>
        <div class="container">
            <div class="centro errorsito">
                <div class="dentro">
                    <h1 id="titulos">Error</h1>
                </div>
                <div class="dentro letras">
                    <p>El usuario y/o la contraseña no coinciden</p>
                    <a href="Login.html"><button class="btn">Regresar</button></a>
                </div>
            </div>
        </div>
    </body>
</html>


