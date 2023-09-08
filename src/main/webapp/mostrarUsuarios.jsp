<%@page import="java.util.List"%>
<%@page import="com.proyecto.sistemapenitenciario.logica.Usuario"%>
<%@page import="com.proyecto.sistemapenitenciario.logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mostrar Usuarios</title>
    </head>
    <body>
        <h1>Lista de Usuarios registrados</h1>
        <%
            List<Usuario> listaUsuarios = (List) request.getSession().getAttribute("listaUsuarios");
            for(Usuario usu : listaUsuarios){
        %>
        <p>ID: <%=usu.getId()%> </p>
        <p>Nombre: <%=usu.getNombre()%> </p>
        <p>Password: <%=usu.getPassword()%> </p>
        <p>Rol: <%=usu.getRolString()%> </p>
        <p>Estado: <%=usu.isEstado() %> </p>
        <p>----------------------------------</p>
        <% } %>
    </body>
</html>
