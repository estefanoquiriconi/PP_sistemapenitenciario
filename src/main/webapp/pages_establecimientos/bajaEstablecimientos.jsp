<%@page import="com.proyecto.sistemapenitenciario.logica.establecimiento.Establecimiento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Eliminar Establecimiento</title>
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Eliminar Establecimiento</h3></div>
                                    <div class="card-body">
                                        <% Establecimiento est = (Establecimiento) request.getSession().getAttribute("estEliminar");%>
                                        <div class="form-floating mb-3">
                                            <h5><strong>ID: </strong><%=est.getId_establecimiento() %></h5>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <h5><strong>Nombre: </strong><%=est.getNombre() %></h5>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <h5><strong>Ciudad: </strong><%=est.getCiudad() %></h5>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <h5><strong>Direccion: </strong><%=est.getDireccion()%></h5>
                                        </div>
                                        <div class="mt-4 mb-0">
                                            <div class="d-grid">
                                                <form action="../SvEliminarEstablecimiento" method="POST">    
                                                    <button class="btn btn-primary btn-user btn-block" type="submit" style="background-color: red">
                                                        Confirmar
                                                    </button>
                                                    <input type="hidden" name="id" value="<%=est.getId_establecimiento()%>">
                                                </form>
                                            </div>
                                        </div>
                                        <div class="mt-4 mb-0">
                                            <div class="d-grid">
                                                <form action="../SvEstablecimientos" method="GET">
                                                    <button class="btn btn-primary btn-user btn-block" type="submit">
                                                        Cancelar
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../js/scripts.js"></script>
    </body>
</html>

