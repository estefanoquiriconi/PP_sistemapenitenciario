
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
        <title>Editar Establecimiento</title>
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="JavaScript/Validaciones.js" type="text/javascript"></script>
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Cambiar Contraseña</h3></div>
                                    <div class="card-body" style="text-align: center">
                                        <%
                                            Usuario usuario = (Usuario) request.getSession().getAttribute("usuSession");
                                        %>
                                        <form id="formularioActualizacionPass" name="formularioActualizacionPass" action="../SvActualizarPass" method="POST"  onsubmit="return validarUsuario('formularioActualizacionPass');">  


                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating mb-3 mb-md-0">             
                                                    <h5 id="usuario"> <strong><%=usuario.getNombre()%></strong> <h5> 
                                                            </div>
                                                            </div>
                                                            <br>
                                                            <div class="col-md-6 mx-auto">
                                                                <div class="form-floating mb-3 mb-md-0">
                                                                    <input class="form-control"  id="password" name="password" type="password" value="<%=usuario.getPassword()%>" placeholder="password" />
                                                                    <label for="password">Contraseña</label><div id="error-messagePass" class="alert alert-danger" style="display: none;"></div>
                                                                </div>
                                                            </div>

                                                            <br>
                                                            <div class="col-md-6 mx-auto">
                                                                <div class="form-floating mb-3 mb-md-0">
                                                                    <div class="form-floating">
                                                                        <input class="form-control"  id="passwordConfirm" name="passwordConfirm" type="password" value="<%=usuario.getPassword()%>" placeholder="Confirm password" />
                                                                        <label for="PasswordConfirm">Confirmar contraseña</label><div id="error-messagePassConfirm" class="alert alert-danger" style="display: none;">
                                                                        </div>
                                                                    </div>
                                                                    <input type="hidden" id="resultadoValidacion" name="resultadoValidacion" value="" />
                                                                    <div class="mt-4 mb-0" >


                                                                        <button class="btn btn-dark btn-user" id="cambiarPass" name="cambiarPass"  type="submit" style="width: 100%">
                                                                            Cambiar Contraseña
                                                                        </button>
                                                                    </div>
                                                                    </form>
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