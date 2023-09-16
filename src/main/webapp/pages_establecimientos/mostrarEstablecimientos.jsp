<%@page import="com.proyecto.sistemapenitenciario.logica.usuario.Usuario"%>
<%@page import="com.proyecto.sistemapenitenciario.logica.establecimiento.Establecimiento"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Establecimientos</title>
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
        </head>
        <body class="sb-nav-fixed">
            <%
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                HttpSession misesion = request.getSession();
                Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
                if (usuario == null) {
                    response.sendRedirect("../sinLogin.jsp");
                }
            %>
            <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
                <!-- Navbar Brand-->
                <a class="navbar-brand ps-3" href="../index.jsp">Servicio Penitenciario</a>
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
                            <li><a class="dropdown-item" href="#!">Cambiar contraseña</a></li>
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
                                <div class="sb-sidenav-menu-heading">Menú</div>
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                    <div class="sb-nav-link-icon"><i class="fa-solid fa-user"></i></div>
                                    Usuarios
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="collapsePages" aria-labelledby="headingOne" data-bs-parent="#collapsePages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="../Pages_Usuarios/altaUsuarios.jsp">Alta</a>
                                        <a class="nav-link" href="../SvUsuarios">Listado</a>
                                    </nav>
                                </div>
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                    <i class="fa-solid fa-building-shield"></i>
                                    Establecimientos
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="altaEstablecimientos.jsp">Alta</a>
                                        <a class="nav-link" href="../SvEstablecimientos">Listado</a>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        <div class="sb-sidenav-footer">
                            <div class="small">Conectado como:</div>
                            <p> <%=request.getSession().getAttribute("usuario")%> </p>
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
