
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
        <title>Filtrar Fechas</title>
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
        <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="../css/stylesPages.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Inclusive+Sans&family=Montserrat:wght@500&display=swap" rel="stylesheet">
    </head>
    <body class="bg-dark">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Filtrar Fin de Condena</h3></div>
                                    <div class="card-body" style="text-align: center">

                                        <form id="formularioActualizacionPass" name="formularioActualizacionPass" action="../SvFiltraFechas" method="GET"  >  
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating mb-3 mb-md-0">             
                                                </div>
                                            </div>
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-group">
                                                    <p >Fecha Inicio</p>
                                                    <input  type="text" class="form-control" id="fechaIngreso" name="fechaInicio" width="auto">
                                                </div>
                                            </div>

                                            <div class="col-md-6 mx-auto">
                                                <div class="form-group">
                                                    <p >Fecha Fin</p>
                                                    <input  type="text" class="form-control" id="fechaNac" name="fechaFin" width="auto">
                                                </div>
                                            </div>
                                            <br>
                                
                                            <input type="hidden" id="resultadoValidacion" name="resultadoValidacion" value="" />
                                            <div class="col-md-6 mx-auto">
                                                <div class="mt-4 mb-0" >
                                                    <button class="btn btn-dark btn-user" id="cambiarPass" name="cambiarPass"  type="submit" style="width: 100%">
                                                        Listar
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                        <div class="col-md-6 mx-auto">
                                            <div class="mt-4 mb-0" >
                                                <form action="../index.jsp" >
                                                    <button class="btn btn-dark btn-user btn-block"  type="submit" style="width: 100%">
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


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../js/scripts.js"></script>
        <script src="JavaScript/Js_internos.js" type="text/javascript"></script>
    </body>
</html>