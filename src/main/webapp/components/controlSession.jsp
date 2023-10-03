<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    Usuario usuario = (Usuario) request.getSession().getAttribute("usuSession");
    if (usuario == null) {
        response.sendRedirect("../sinLogin.jsp");
    }
%>
<% if (usuario != null) {%>
