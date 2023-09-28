<%@page import="com.proyecto.sistemapenitenciario.logica.establecimiento.Establecimiento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Editar Establecimiento</title>
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="js/validaciones.js" type="text/javascript"></script>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="../css/stylesPages.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Croissant+One&family=DM+Serif+Display:ital@0;1&family=Inclusive+Sans&family=Montserrat:wght@500&family=Roboto+Slab&display=swap" rel="stylesheet">
    </head>
    <body class="bg-dark">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Editar Establecimiento</h3></div>
                                    <div class="card-body" style="text-align: center">
                                        <form action="../SvEditarEstablecimiento" method="POST" onsubmit="return validarEstablecimiento()">    
                                            <% Establecimiento est = (Establecimiento) request.getSession().getAttribute("estEditar");%>
                                            <div class="form-floating mb-3 mx-auto">
                                                <h5 style="text-align: center"><strong>ID: </strong><%=est.getId_establecimiento()%></h5>
                                            </div>
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating">
                                                    <input class="form-control" autofocus="" name="nombre" id="nombre" type="text" value="<%=est.getNombre()%>" />
                                                    <label for="nombre">Nombre</label>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating">
                                                    <input class="form-control" name="ciudad" id="ciudad" type="text" value="<%=est.getCiudad()%>" />
                                                    <label for="ciudad">Ciudad</label>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating">
                                                    <input class="form-control" name="direccion" id="direccion" type="text" value="<%=est.getDireccion()%>" />
                                                    <label for="direccion">Dirección</label>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating">
                                                    <input class="form-control" name="capacidad" id="capacidad" type="text" value="<%=est.getCapacidad()%>" />
                                                    <label for="capacidad">Capacidad</label>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating">
                                                    <input class="form-control" name="telefono" id="telefono" type="text" value="<%=est.getTelefono()%>" />
                                                    <label for="telefono">Telefono</label>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-md-6 mx-auto" >
                                                <div class="form-check form-switch" style="text-align: initial">
                                                    <% if (est.isEstado()) { %>
                                                    <label for="estado">Habilitar</label>
                                                    <input class="form-check-input" type="checkbox" id="estado" name="estado" checked="" disabled="">
                                                    <% } else { %>
                                                    <input class="form-check-input" type="checkbox" id="estado" name="estado">
                                                    <label for="estado">Habilitar</label>
                                                    <% }%>
                                                </div>
                                            </div>
                                            <div id="mensajeError" style="color: red;"></div>
                                            <div class="mt-4 mb-0 mx-auto">
                                                <button class="btn btn-dark btn-user" type="submit" style="width: 50%">
                                                    Guardar
                                                </button>
                                                <input type="hidden" name="id" value="<%=est.getId_establecimiento()%>">
                                            </div>
                                        </form>
                                        <div class="mt-4 mb-0">
                                            <form action="../SvEstablecimientos" method="GET">
                                                <button class="btn btn-dark btn-user btn-block" type="submit" style="width: 50%">
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
            <br>
            <br>
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
        <script src="../js/scripts.js"></script>
    </body>
</html>