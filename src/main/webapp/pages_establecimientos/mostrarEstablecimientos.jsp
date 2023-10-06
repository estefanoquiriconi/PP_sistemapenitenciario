<%@page import="com.proyecto.sistemapenitenciario.logica.usuario.Usuario"%>
<%@page import="com.proyecto.sistemapenitenciario.logica.establecimiento.Establecimiento"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
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
                        <h1 class="mt-4">Establecimientos</h1>
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
                                            <th>Ciudad</th>
                                            <th>Capacidad</th>
                                            <th>Dirección</th>
                                            <th>Telefono</th>
                                            <th>Estado</th>
                                            <th>Eliminar</th>
                                            <th>Editar</th>
                                        </tr>

                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Nombre</th>
                                            <th>Ciudad</th>
                                            <th>Capacidad</th>
                                            <th>Dirección</th>
                                            <th>Telefono</th>
                                            <th>Estado</th>
                                            <th>Eliminar</th>
                                            <th>Editar</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <%
                                            List<Establecimiento> listaEstablecimientos = (List) request.getSession().getAttribute("listaEstablecimientos");
                                            if (listaEstablecimientos != null) {
                                                for (Establecimiento est : listaEstablecimientos) {
                                        %>
                                        <tr>
                                            <td><%=est.getId_establecimiento()%></td>
                                            <td><%=est.getNombre()%></td>
                                            <td><%=est.getCiudad()%></td>
                                            <td><%=est.getCapacidad()%></td>
                                            <td><%=est.getDireccion()%></td>
                                            <td><%=est.getTelefono()%></td>
                                            <%if (est.isEstado()) { %>
                                            <td><p style="color: blue">Activo</p></td>
                                            <% } else { %>
                                            <td><p style="color: red">Inactivo</p></td>
                                            <%}%>
                                            <td>
                                                <%if (est.isEstado()) {%>
                                                <form name="eliminar" action="../SvEliminarEstablecimiento" method="GET">

                                                    <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color: red; margin-right: 5px; "> 
                                                        <i class="fas fa-trash-alt"></i> Eliminar
                                                    </button>
                                                    <input type="hidden" name="id" value="<%=est.getId_establecimiento()%>">
                                                </form>
                                                <% }%>
                                            </td>
                                            <td>
                                                <form name="editar" action="../SvEditarEstablecimiento" method="GET">
                                                    <button type="submit" class="btn btn-primary btn-user btn-block" style="margin-left: 5px; " > 
                                                        <i class="fas fa-pencil-alt"></i> Editar
                                                    </button>
                                                    <input type="hidden" name="id" value="<%=est.getId_establecimiento()%>">
                                                </form>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        } else {
                                        %>
                                    <p>No hay establecimientos registrados.</p>
                                    <%
                                        }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <%@include file="../components/footer.jsp"%>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../js/datatables-simple-demo.js"></script>
        <% } %>
    </body>
</html>
