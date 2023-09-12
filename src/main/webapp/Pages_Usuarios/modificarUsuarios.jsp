<%-- 
    Document   : modificarsuarios
    Created on : 10 sep. 2023, 16:00:03
    Author     : Administrador
--%>

<%@page import="com.proyecto.sistemapenitenciario.logica.usuario.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="JavaScript/Validaciones.js" type="text/javascript"></script>
    </head>
    <body>
        <h1>Modificar Usuario</h1>
        <% Usuario user = (Usuario) request.getSession().getAttribute("usuario");
        %>
         <form id="formularioModificar" action="../SvUsuariosModificar" method="POST">
             <p> <label>Nombre: <input type="text" name="nombre" value="<%=user.getNombre()%>"> </label> </p>
             <p> <label>Contraseña: <input type="password" name="password" value="<%=user.getPassword()%>"> </label> </p>
             <select id="rol" name="rol" value="<%=user.getRolString()%>">
                <option value="2">Director</option>
                <option value="3">Administrativo</option>
                <option value="4">Agente</option>
            </select>
             <button name="guardarModificacion" type="submit">Guardar</button>
             <button type="button" id="botonCancelar" onclick="cancelarModificacion()">Cancelar</button>
        </form>

        
    </body>
</html>
