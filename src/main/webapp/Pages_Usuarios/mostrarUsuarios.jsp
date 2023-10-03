<%@page import="com.proyecto.sistemapenitenciario.logica.usuario.Usuario"%>
<%@page import="com.proyecto.sistemapenitenciario.logica.establecimiento.Establecimiento"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
    </head>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <title>Establecimientos</title>
            <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
            <link href="../css/styles.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            <script src="JavaScript/Validaciones.js" type="text/javascript"></script>
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="../css/stylesPages.css" rel="stylesheet" type="text/css"/>
            <link href="https://fonts.googleapis.com/css2?family=Inclusive+Sans&family=Montserrat:wght@500&display=swap" rel="stylesheet">
        </head>
        <body class="sb-nav-fixed">
            <%@include file="../components/controlSession.jsp"%>
            <%@include file="../components/topnav.jsp"%>
            <div id="layoutSidenav">
                <%@include file="../components/sidenav_menu.jsp"%>
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">Usuarios</h1>
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table me-1"></i>
                                    Listado
                                </div>
                                <div class="card-body">
                                    <table id="datatablesSimple">
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Nombre</th>
                                                <th>Rol</th>
                                                <th>Estado</th>      
                                                <th>Eliminar</th>
                                                <th>Editar</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Id</th>
                                                <th>Nombre</th>
                                                <th>Rol</th>
                                                <th>Estado</th>
                                                <th>Eliminar</th>
                                                <th>Editar</th>
                                            </tr>
                                        </tfoot>

                                        <%
                                            List<Usuario> listaUsuarios = (List<Usuario>) request.getSession().getAttribute("listaUsuarios");
                                            if (listaUsuarios != null) {
                                                int i = 0;
                                                for (Usuario usu : listaUsuarios) {
                                                    if (usu.getRol() != 1) {


                                        %>


                                        <tr>
                                            <td><%=usu.getId()%></td>
                                            <td><%=usu.getNombre()%></td>
                                            <td><%=usu.getRolString()%></td>
                                            <td  ><p id="estado<%= i%>"><%=usu.getEstadoString()%></p></td>
                                        <script type="text/javascript"> validarEstado(<%=i%>);</script>   
                                        <td>

                                            <%if (usu.isEstado()) {%>
                                            <form  action="../SvUsuarioEliminar" method="GET">
                                                <button type="submit" name="eliminar"  value="<%=usu.getId()%>" class="btn btn-primary btn-user btn-block" style="background-color: red; margin-right: 5px; "> 
                                                    <i class="fas fa-trash-alt"></i> Eliminar
                                                </button>

                                            </form>
                                            <% }%>
                                        </td>
                                        <td>
                                            <form id="modificar" action="../SvUsuariosModificar" method="GET">
                                                <button type="submit" name="modificar"  value="<%=usu.getId()%>" class="btn btn-primary btn-user btn-block" style="margin-left: 5px; " > 
                                                    <i class="fas fa-pencil-alt"></i> Editar

                                                </button>
                                                <input type="hidden" name="userSession" value="<%=usuario.getId()%>">
                                            </form>
                                        </td>
                                        </tr>
                                        <%

                                                }
                                                i++;
                                            }
                                        } else {
                                        %>
                                        <h2>No hay usuarios registrados.</h2>
                                        <%
                                            }
                                        %>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </main>
                    <footer class="py-4 bg-light mt-auto">
                        <div class="container-fluid px-4">
                            <div class="d-flex align-items-center justify-content-between small">
                                <div class="text-muted">Copyright &copy; Quiriconi - Dominguez 2023</div>
                                <div>
                                </div>
                            </div>
                        </div>
                    </footer>
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
            <script src="../js/scripts.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
            <script src="../js/datatables-simple-demo.js"></script>
            <% }%>
        </body>
    </html>
