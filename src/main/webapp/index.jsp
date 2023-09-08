<%-- 
    Document   : index
    Created on : 8 sep. 2023, 18:39:39
    Author     : tano_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta usuario</title>
    </head>
    <body>
        <h1>Datos del Usuario</h1>
        <form action="SvUsuarios" method="POST">
            <p> <label>Nombre: <input type="text" name="nombre"> </label> </p>
            <p> <label>Contraseña: <input type="password" name="password"> </label> </p>
            <select id="rol" name="rol">
                <option value="1">Director</option>
                <option value="2">Administrativo</option>
                <option value="3">Agente</option>
            </select>
            <button type="submit">Enviar</button>
        </form>

        <h1>Ver lista de usuarios</h1>
        <p>Para ver los datos de los usuarios cargados haga click en el siguiente botón</p>
        <form action="SvUsuarios" method="GET">
            <button type="submit">Mostrar Usuarios</button>
        </form>
    </body>
</html>
