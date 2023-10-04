<%@page import="com.proyecto.sistemapenitenciario.logica.interno.Interno"%>
<%@page import="java.util.List"%>
<%@page import="com.proyecto.sistemapenitenciario.logica.usuario.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Internos</title>
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
        <% Boolean isCargarCondena = (Boolean) request.getSession().getAttribute("cargaCondenaInterno");%>
        <%@include file="../components/topnav.jsp"%>
        <div id="layoutSidenav">
            <%@include file="../components/sidenav_menu.jsp"%>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Internos</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Listado
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Legajo</th>
                                            <th>Apellido</th>
                                            <th>Nombre</th>
                                            <th>Documento</th>
                                            <th>Establecimiento</th>
                                                <% if (isCargarCondena) {%>
                                            <th>Condena</th>
                                                <% } else { %>
                                            <th>Información</th>
                                                <%if (usuario.getRol() != 4 && usuario.getRol() != 3) {%>
                                            <th>Eliminar</th>
                                            <th>Editar</th>
                                                <% }%>
                                                <% }%>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Legajo</th>
                                            <th>Apellido</th>
                                            <th>Nombre</th>
                                            <th>Documento</th>
                                            <th>Establecimiento</th>
                                                <% if (isCargarCondena) { %>
                                            <th>Condena</th>
                                                <% } else { %>
                                            <th>Información</th>
                                                <%if (usuario.getRol() != 4 && usuario.getRol() != 3) {%>
                                            <th>Eliminar</th>
                                            <th>Editar</th>
                                                <% }%>
                                                <% }%>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <%
                                            List<Interno> listaInternos = (List) request.getSession().getAttribute("listaInternos");
                                            if (listaInternos != null) {
                                                for (Interno interno : listaInternos) {
                                        %>
                                        <tr>
                                            <td><%=interno.getLegajo()%></td>
                                            <td><%=interno.getApellido()%></td>
                                            <td><%=interno.getNombre()%></td>
                                            <td><%=interno.getNumDoc()%></td>
                                            <td><%=interno.getIdEstablecimiento().getNombre()%></td>
                                            <% if (isCargarCondena) {%>
                                            <td>
                                                <form name="info" action="../SvCondenas" method="GET">
                                                    <button type="submit" class="btn btn-dark btn-user btn-block" style="margin-left: 5px; " > 
                                                        <i class="fa-solid fa-file-lines"></i> Cargar 
                                                    </button>
                                                    <input type="hidden" name="id" value="<%=interno.getIdInterno()%>">
                                                </form>
                                            </td>
                                            <% } else {%>
                                            <td>
                                                <form name="info" action="../SvInfoInterno" method="GET">
                                                    <button type="submit" class="btn btn-dark btn-user btn-block" style="margin-left: 5px; " > 
                                                        <i class="fa-regular fa-id-card"></i> Ver más
                                                    </button>
                                                    <input type="hidden" name="id" value="<%=interno.getIdInterno()%>">
                                                </form>
                                            </td>
                                            <%if (usuario.getRol() != 4 && usuario.getRol() != 3) {%>
                                            <td>
                                                <%if (interno.getEstado()) {%>
                                                <form name="eliminar" action="#" method="GET">
                                                    <button type="submit" class="btn btn-danger btn-user btn-block" style="margin-right: 5px; "> 
                                                        <i class="fas fa-trash-alt"></i> Eliminar
                                                    </button>
                                                    <input type="hidden" name="id" value="<%=interno.getIdInterno()%>">
                                                </form>
                                                <% }%>
                                            </td>
                                            <td>
                                                <form name="editar" action="#" method="GET">
                                                    <button type="submit" class="btn btn-primary btn-user btn-block" style="margin-left: 5px; " > 
                                                        <i class="fas fa-pencil-alt"></i> Editar
                                                    </button>
                                                    <input type="hidden" name="id" value="<%=interno.getIdInterno()%>">
                                                </form>
                                            </td>
                                            <% }%>
                                            <% }%>
                                        </tr>
                                        <%
                                            }
                                        } else {
                                        %>
                                    <p>No hay internos registrados.</p>
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
