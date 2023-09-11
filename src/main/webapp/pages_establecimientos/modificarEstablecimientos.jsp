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
        <title>Editar Establecimiento</title>
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Editar Establecimiento</h3></div>
                                    <div class="card-body">
                                        <form action="../SvEditarEstablecimiento" method="POST">    
                                            <% Establecimiento est = (Establecimiento) request.getSession().getAttribute("estEditar");%>
                                            <div class="form-floating mb-3">
                                                <h5><strong>ID: </strong><%=est.getId_establecimiento()%></h5>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-floating">
                                                    <input class="form-control" name="nombre" id="nombre" type="text" value="<%=est.getNombre()%>" />
                                                    <label for="nombre">Nombre</label>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-md-6">
                                                <div class="form-floating">
                                                    <input class="form-control" name="ciudad" id="ciudad" type="text" value="<%=est.getCiudad()%>" />
                                                    <label for="ciudad">Ciudad</label>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-md-6">
                                                <div class="form-floating">
                                                    <input class="form-control" name="direccion" id="direccion" type="text" value="<%=est.getDireccion()%>" />
                                                    <label for="ciudad">Dirección</label>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-md-6">
                                                <div class="form-floating">
                                                    <input class="form-control" name="capacidad" id="capacidad" type="text" value="<%=est.getCapacidad()%>" />
                                                    <label for="capacidad">Capacidad</label>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-md-6">
                                                <div class="form-floating">
                                                    <input class="form-control" name="telefono" id="telefono" type="text" value="<%=est.getTelefono()%>" />
                                                    <label for="ciudad">Telefono</label>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-md-6">
                                                <div class="form-check form-switch">
                                                    <% if (est.isEstado()) { %>
                                                    <input class="form-check-input" type="checkbox" id="estado" name="estado" checked="">
                                                    <% }else { %>
                                                    <input class="form-check-input" type="checkbox" id="estado" name="estado">
                                                    <% }%>
                                                    <label class="form-check-label" for="estado">Activar</label>
                                                </div>
                                            </div>
                                            <div class="mt-4 mb-0">
                                                <button class="btn btn-primary btn-user" type="submit" style="background-color: red">
                                                    Guardar
                                                </button>
                                                <input type="hidden" name="id" value="<%=est.getId_establecimiento()%>">

                                            </div>
                                        </form>
                                        <div class="mt-4 mb-0">
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