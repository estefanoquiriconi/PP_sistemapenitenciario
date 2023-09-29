<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.proyecto.sistemapenitenciario.logica.usuario.Usuario"%>
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
        <!-- referencias fonts para el body -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="css/stylesPages.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Dela+Gothic+One&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Croissant+One&family=DM+Serif+Display:ital@0;1&family=Inclusive+Sans&family=Montserrat:wght@500&family=Roboto+Slab&display=swap" rel="stylesheet">
    </head>
    <!-- Validación Sesión -->
    <body class="sb-nav-fixed">
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            HttpSession misesion = request.getSession();
            Usuario usuario = (Usuario) request.getSession().getAttribute("usuSession");
            if (usuario == null) {
                response.sendRedirect("sinLogin.jsp");
            }
        %>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.jsp"><h4><i class="fa-solid fa-house fa-sm"></i></i></i> Home </h4></a>
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
                        <li><a class="dropdown-item" href="Pages_Usuarios/cambiarPassword.jsp">Cambiar contraseña</a></li>
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
                                    <a class="nav-link" href="Pages_Usuarios/altaUsuarios.jsp">Alta</a>
                                    <a class="nav-link" href="SvUsuarios">Listado</a>
                                </nav>
                            </div>

                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseEstablecimientos" aria-expanded="false" aria-controls="collapseEstablecimientos">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-building-shield"></i></i></div>
                                Establecimientos
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseEstablecimientos" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="pages_establecimientos/altaEstablecimientos.jsp">Alta</a>
                                    
                                    <a href="SvEstablecimientos" class="nav-link" >Listado</a>
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
                                    <form action="SvEstablecimientos" method="get" id="formAltaInternos">
                                        <input type="hidden" id="altaInternos" name="altaInternos" value="1">
                                    </form>

                                    <a href="#" class="nav-link" onclick="document.getElementById('formAltaInternos').submit(); return false;">Alta</a>
                                    <% }%>
                                    <a class="nav-link" href="SvInternos">Listado</a>
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
                                    <a class="nav-link" href="#ientos">Listado</a>
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
            <div id="layoutSidenav_content" class="paginaprincial">
                <main class="indexContent">
                    <center>
                        <img src="./css/logo.png" alt="alt"/>
                        <h1 style="text-align: center; color: white">SERVICIO PENITENCIARIO</h1>
                        <h1 style="text-align: center;">SANTIAGO DEL ESTERO</h1>
                        <h5 style="text-align: center">Trabajamos para propiciar la inclusión social de las personas privadas de la libertad.</h5>
                    </center>
                </main>
                <%@include file="components/footer.jsp"%>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>