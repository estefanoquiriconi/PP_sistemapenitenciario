<%-- 
    Document   : bajaInternos
    Created on : 23 sept 2023, 14:38:17
    Author     : Estéfano
--%>

<%@page import="com.proyecto.sistemapenitenciario.logica.usuario.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <%
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                Usuario usuario = (Usuario) request.getSession().getAttribute("usuSession");
                if (usuario == null) {
                    response.sendRedirect("../sinLogin.jsp");
                }
            %>
     
    </body>
</html>
