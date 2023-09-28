<%@page import="com.proyecto.sistemapenitenciario.logica.establecimiento.Establecimiento"%>
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
        <title>Crear Usuario</title>
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="JavaScript/Validaciones.js" type="text/javascript"></script>
        <link href="css_internos/Styles_Internos.css" rel="stylesheet" type="text/css"/>
        <script src="JavaScript/Js_internos.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
        <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />

    </head>

    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Alta Internos</h3></div>
                                    <div class="card-body" style="text-align: center">
                                        <form id="formularioAlta" action="../SvUsuarios" method="POST" >
                                            <% List<Establecimiento> establecimientos = (List) request.getSession().getAttribute("listaEstablecimientos");
                                            %>
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <input class="form-control" id="nombre" name="nombre" type="text" placeholder="Nombre" />
                                                    <label for="nombre">Nombre:</label>
                                                    <div id="error-messageNombre" class="alert alert-danger" style="display: none;"></div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mx-auto">
                                                <div class="mt-4 mb-0">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="apellido" name="apellido" type="text" placeholder="Apellido" />
                                                        <label for="apellido">Apellido:</label>
                                                        <div id="error-messageApellido" class="alert alert-danger" style="display: none;"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br>

                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="apodo" name="apodo" type="text" placeholder="Apodo" />
                                                        <label for="apodo">Apodo</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="row">
                                                <div class="col-md-6 mx-lg-6">
                                                    <div style="padding-left:30%;">
                                                        <p >Sexo:</p>
                                                        <input class="form-check-input" type="radio" name="sexo" id="checkFemenino" value="femenino">
                                                        <label class="form-check-label" for="checkFemenino">Femenino</label>

                                                        <br>
                                                        <input class="form-check-input" type="radio" name="sexo" id="checkMasculino" value="masculino">
                                                        <label class="form-check-label" for="checkMasculino">Masculino</label>

                                                    </div>
                                                </div>
                                                <div class="col-md-6 mx-lg-6">

                                                    <div class="form-group">
                                                        <p style="padding-right: 60%;padding-top: 2%">Fecha de Ingreso</p>
                                                        <input  type="text" class="form-control" id="datepicker" name="datepicker" width="150">

                                                    </div>
                                                </div>
                                            </div>


                                            <br>
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="provincia" name="provincia" type="text" placeholder="Provincia de Nacimiento" />
                                                        <label for="provincia">Provincia de Nacimiento</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="nacionalidad" name="nacionalidad" type="text" placeholder="Nacionalidad" />
                                                        <label for="nacionalidad">Nacionalidad</label>
                                                    </div>
                                                </div>
                                                <br>
                             
                                                <div class="col-md-6 mx-auto">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <div class="form-floating">
                                                                               <% for (Object est : establecimientos) {

                                                    %>
                                                    <select value=""></select>

                                                            <label for="nacionalidad">Establecimientos</label>
                                                            <select value=""></select>
                                                        </div>
                                                    </div>
                                                    <br>

                                                    <input type="hidden" id="resultadoValidacion" name="resultadoValidacion" value="" />
                                                    <button class="btn btn-primary btn-user" type="submit" style="background-color: red; width: 100%">Guardar</button>
                                                </div>
                                        </form>
                                        <div class="col-md-6 mx-auto">
                                            <div class="mt-4 mb-0">
                                                <form action="../index.jsp method="GET">
                                                    <button class="btn btn-primary btn-user btn-block" type="submit" style="width: 100%">Cancelar</button>
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
            <br>
            <br>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Quiriconi - Dominguez 2023</div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../js/scripts.js"></script>
        <script src="../js/scripts.js"></script>
        <script>
            $('#datepicker').datepicker({
                uiLibrary: 'bootstrap5'
            });
        </script>
    </body>
</html>