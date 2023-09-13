<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Alta Establecimiento</title>
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="js/validaciones.js" type="text/javascript"></script>
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Alta Establecimiento</h3></div>
                                    <div class="card-body" style="text-align: center">
                                        <form action="../SvEstablecimientos" method="POST" onsubmit="return validarEstablecimiento()" style="align-items: center"> 
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating">
                                                    <input class="form-control" name="nombre" id="nombre" type="text" placeholder="Nombre" autofocus=""/>
                                                    <label for="nombre">Nombre</label>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating">
                                                    <input class="form-control" name="ciudad" id="ciudad" type="text"  placeholder="Ciudad"/>
                                                    <label for="ciudad">Ciudad</label>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating">
                                                    <input class="form-control" name="direccion" id="direccion" type="text" placeholder="Ciudad" />
                                                    <label for="direccion">Dirección</label>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating">
                                                    <input class="form-control" name="capacidad" id="capacidad" type="text" placeholder="Capacidad"/>
                                                    <label for="capacidad">Capacidad</label>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating">
                                                    <input class="form-control" name="telefono" id="telefono" type="text" placeholder="Telefono" />
                                                    <label for="ciudad">Teléfono</label>
                                                </div>
                                                <div id="mensajeErrorTelefono" style="color: red;"></div>
                                            </div>
                                            <br>
                                            <div id="mensajeError" style="color: red;"></div>
                                            <br>
                                            <div class="mt-4 mb-0 mx-auto">
                                                <button class="btn btn-primary btn-user" type="submit" style="background-color: red; width: 50%">
                                                    Guardar
                                                </button>
                                            </div>
                                        </form>
                                        <div class="mt-4 mb-0">
                                            <form action="../index.jsp" method="GET">
                                                <button class="btn btn-primary btn-user btn-block" type="submit" style="width: 50%">
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
                            <div class="text-muted">Copyright &copy; Quiriconi-Dominguez 2023</div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../js/scripts.js"></script>
    </body>
</html>