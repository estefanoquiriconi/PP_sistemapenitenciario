<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.proyecto.sistemapenitenciario.logica.usuario.Usuario"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Servicio Penitenciario</title>
    </head>
    <!DOCTYPE html>
    <html lang="es">
        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <title>Servicio Penitenciario</title>
            <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
            <link href="css/styles.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        </head>
        <!-- Validación Sesión -->

        <body class="sb-nav-fixed">
            <%
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                HttpSession misesion = request.getSession();
                Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
                if (usuario == null) {
                    response.sendRedirect("sinLogin.jsp");
                }else if(usuario.getRolString().equals("Agente")){
                    response.sendRedirect("agente.jsp");
                }
            %>
            <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
                <!-- Navbar Brand-->
                <a class="navbar-brand ps-3" href="index.jsp">Servicio Penitenciario</a>
                <!-- Sidebar Toggle-->
                <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
                <!-- Navbar Search-->
                <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                </form>
                <!-- Navbar-->
                <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#!">Cambiar contraseña</a></li>
                            <li><hr class="dropdown-divider" /></li>
                            <li><a class="dropdown-item" href="SvLogout">Salir</a></li>
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
                                        <a class="nav-link" href="Pages_Usuarios/altaUsuarios.jsp">Alta</a>
                                        <a class="nav-link" href="SvUsuarios">Listado</a>
                                    </nav>
                                </div>
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                    <i class="fa-solid fa-building-shield"></i>
                                    Establecimientos
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="pages_establecimientos/altaEstablecimientos.jsp">Alta</a>
                                        <a class="nav-link" href="SvEstablecimientos">Listado</a>
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

                        <h1 style="text-align: center; padding: 20px">Página principal</h1>

                    </main>
                    <footer class="py-4 bg-light mt-auto">
                        <div class="container-fluid px-4">
                            <div class="d-flex align-items-center justify-content-between small">
                                <div class="text-muted">Copyright &copy; Quiriconi-Dominguez 2023</div>
                            </div>
                        </div>
                    </footer>
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
            <script src="js/scripts.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
            <script src="js/datatables-simple-demo.js"></script>
        </body>
        
    </html>