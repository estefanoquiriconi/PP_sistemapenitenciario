<%@page import="com.proyecto.sistemapenitenciario.logica.usuario.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mostrar Usuarios</title>
        <link href="../resources/css/boostrap.css" rel="stylesheet" type="text/css"/>
        <script src="JavaScript/Validaciones.js" type="text/javascript"></script>
    </head>
    <body>

        <div class="container text-left"> <!-- Agrega una clase container para centrar el contenido -->
            <div class="row">
                <div class="col-md-6 offset-md-3"> <!-- Agrega un offset para centrar la lista -->
                    
                        <h1>Lista de Usuarios registrados</h1>
                        <form id="ListaUser" action="eliminarUsuarios.jsp" method="post">
                            
                            <%
                                List<Usuario> listaUsuarios = (List<Usuario>) request.getSession().getAttribute("listaUsuarios");
                                if (listaUsuarios != null) {
                                int i =0;
                                    for (Usuario usu : listaUsuarios) {
                                    
                            %>
                   
                            
                            <div class="list-item">
                                
                                <a href="#" class="list-group-item list-group-item-action" ><%=usu.getNombre()%> <%=usu.getRolString()%> <p id="estado<%= i%>" ><%=usu.getEstadoString()%></p>
                                    <script type="text/javascript"> validarEstado(<%=i%>)</script>     
                                    <form action="../SvUsuarioEliminar" method="POST" style="display: inline;">
                                        <button type="submit" name="eliminar" value="<%=usu.getId()%>" class="btn btn-primary">Eliminar</button>
                                    </form>
                                    <form action="../SvUsuariosModificar" method="GET" style="display: inline;">
                                        <button type="submit" name="modificar" value="<%=usu.getId()%>" class="btn btn-primary">Modificar</button>
                                    </form>
                                 <button onclick="SvInfosuarios" type="submit" name="ver_mas" value="<%=usu.getId()%>" class="btn btn-primary text-right">VER MAS</button></a>


                            </div>

                            <%
                              i++;
                                }
                            } else {
                            %>
                            <p>No hay usuarios registrados.</p>
                            <%
                                }
                            %>
                        </form>
                    
                </div>
            </div>




    </body>
</html>
