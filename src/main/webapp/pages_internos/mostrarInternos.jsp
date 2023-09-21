<%-- 
    Document   : mostrarInternos
    Created on : 21 sept 2023, 12:26:16
    Author     : Estéfano
--%>

<%@page import="com.proyecto.sistemapenitenciario.logica.interno.Interno"%>
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
        <h1>LISTADO DE INTERNOS</h1>
        <%
            List<Interno> listaInternos = (List) request.getSession().getAttribute("listaInternos");
            if (listaInternos != null) {
            for (Interno elem : listaInternos) { %>
                    <p>Legajo: <%=elem.getLegajo() %></p>
                    <p>Apellido: <%=elem.getApellido() %></p>
                    <p>Nombre: <%=elem.getNombre() %></p>
                    <p>Apodo: <%=elem.getApodo() %></p>
                    <p>Establecimiento: <%=elem.getIdEstablecimiento().getNombre() %></p>
                    <p>Profesión: <%=elem.getProfesion() %></p>
               <% } %>
               
            <%}%>
    </body>
</html>
