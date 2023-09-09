<%-- 
    Document   : mostrarEstablecimientos
    Created on : 9 sep. 2023, 18:38:59
    Author     : tano_
--%>

<%@page import="com.proyecto.sistemapenitenciario.logica.establecimiento.Establecimiento"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lista de Usuarios registrados</h1>
        <%
            List<Establecimiento> listaEstablecimientos = (List) request.getSession().getAttribute("listaEstablecimientos");
            for(Establecimiento est : listaEstablecimientos){
        %>
        <p>ID: <%=est.getId_establecimiento() %> </p>
        <p>Nombre: <%=est.getNombre()%> </p>
        <p>Capacidad: <%=est.getCiudad()%> </p>
        <p>Capacidad: <%=est.getCapacidad()%> </p>
        <p>Direccion: <%=est.getDireccion()%> </p>
        <p>Telefono: <%=est.getTelefono() %> </p>
        <p>Estado: <%=est.isEstado() %> </p>
        <p>----------------------------------</p>
        <% } %>
    </body>
</html>
