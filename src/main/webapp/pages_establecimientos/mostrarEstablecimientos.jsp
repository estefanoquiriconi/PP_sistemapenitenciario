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
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            HttpSession misesion = request.getSession();
            Usuario usuario = (Usuario) request.getSession().getAttribute("usuSession");
            if (usuario == null) {
                response.sendRedirect("../sinLogin.jsp");
            }
        %>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="../index.jsp"><h4><i class="fa-solid fa-house fa-sm"></i></i></i> Home </h4></a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <%
                    if (usuario != null) {
                %>
                <h6 style="color: white"><%=usuario.getNombre()%></h6>
                <% }%>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="../Pages_Usuarios/cambiarPassword.jsp">Cambiar contraseña</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="../SvLogout">Salir</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">
                                <h6 style="text-align:center">Menú</h6>
                            </div>
                            <%
                                if (usuario != null && usuario.getRol() == 1) {
                            %>

                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseUsuarios" aria-expanded="false" aria-controls="collapseUsuarios">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-user"></i></div>
                                Usuarios
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseUsuarios" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="../Pages_Usuarios/altaUsuarios.jsp">Alta</a>
                                    <a class="nav-link" href="../SvUsuarios">Listado</a>
                                </nav>
                            </div>

                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseEstablecimientos" aria-expanded="false" aria-controls="collapseEstablecimientos">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-building-shield"></i></i></div>
                                Establecimientos
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseEstablecimientos" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="../pages_establecimientos/altaEstablecimientos.jsp">Alta</a>
                                    <a class="nav-link" href="../SvEstablecimientos">Listado</a>
                                </nav>
                            </div>
                            <% }%>

                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseInternos" aria-expanded="false" aria-controls="collapseInternos">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-handcuffs"></i></i></div>
                                Internos
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseInternos" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <%
                                        if (usuario != null && (usuario.getRol() != 4)) {
                                    %>
                                    <a class="nav-link" href="#">Alta</a>
                                    <% }%>
                                    <a class="nav-link" href="../SvInternos">Listado</a>
                                </nav>
                            </div>
                            <%
                                if (usuario != null && (usuario.getRol() != 4)) {
                            %>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseCondenas" aria-expanded="false" aria-controls="collapseCondenas">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-box-archive"></i></i></i></div>
                                Condenas
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseCondenas" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#">Alta</a>
                                    <a class="nav-link" href="#">Listado</a>
                                </nav>
                            </div>
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseEstadisticas" aria-expanded="false" aria-controls="collapseEstadisticas">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-chart-simple"></i></div>
                                Estadísticas
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseEstadisticas" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                        <a href="../SvEstadisticasDelitos" class="nav-link">Delitos</a>
                                </nav>
                            </div>
                            <% }%>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Conectado como:</div>
                        <p> <%=request.getSession().getAttribute("usuSession")%> </p>
                    </div>
                </nav>
            </div>
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
    </body>
</html>
