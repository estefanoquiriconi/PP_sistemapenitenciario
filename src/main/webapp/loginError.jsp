<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Login Error</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="JavaScript/Validaciones.js" type="text/javascript"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="css/stylesPages.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Croissant+One&family=DM+Serif+Display:ital@0;1&family=Inclusive+Sans&family=Montserrat:wght@500&family=Roboto+Slab&display=swap" rel="stylesheet">
    </head>
    <body class="bg-dark">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h2 class="text-center font-weight-light my-4">Servicio Penitenciario</h2></div>
                                    <div class="card-body">
                                        <form action="login.jsp">
                                            <br>
                                            <% boolean estadoUsuario = (boolean) request.getSession().getAttribute("estado");
                                                if (estadoUsuario) {
                                            %>
                                            <h5 style="text-align: center">Nombre de usuario o contraseña incorrecto</h5>
                                            <%} else {%>
                                            <h5 style="text-align: center">Usuario Inactivo</h5>
                                            <%}%>
                                            <br>
                                            <br>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <p></p>
                                                <button class="btn btn-dark btn-user btn-block" type="submit">
                                                    Volver al login
                                                </button>
                                            </div>
                                            <br>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <br>
                        </main>
                    </div>
                    <div id="layoutAuthentication_footer">
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
            <script src="js/scripts.js"></script>
    </body>
</html>