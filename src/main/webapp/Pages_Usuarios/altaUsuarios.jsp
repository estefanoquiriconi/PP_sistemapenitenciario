<%-- 
    Document   : index
    Created on : 8 sep. 2023, 18:39:39
    Author     : tano_
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Registrar usuarios</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="JavaScript/Validaciones.js" type="text/javascript"></script>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Crear Usuario</h3></div>
                                    <div class="card-body">
                                        <form id="formularioAlta" action="../SvUsuarios" method="POST" style="text-align: center" onsubmit="return validarUsuario()">
                                            <div class="row mb-3">
                                                 <div class="col-md-6 mx-auto">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="nombre" name="nombre" type="text" placeholder="Usuario" />
                                                        <label for="usuario">Nombre de Usuario</label><div id="error-messageUser" class="alert alert-danger" style="display: none;"></div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="row mb-3">
                                                 <div class="col-md-6 mx-auto">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control"  id="password" name="password" type="password" placeholder="password" />
                                                        <label for="password">Contraseña</label><div id="error-messagePass" class="alert alert-danger" style="display: none;"></div>
                                                    </div>
                                                </div>
                                             
                                            </div>
                                             <div class="row mb-3">
                                             <div class="col-md-6 mx-auto">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control"  id="passwordConfirm" name="passwordConfirm" type="password" placeholder="Confirm password" />
                                                        <label for="PasswordConfirm">Confirmar Contraseña</label><div id="error-messagePassConfirm" class="alert alert-danger" style="display: none;">
                                                    </div>
                                                </div>
                                                 </div>
                                                 </div>
                                                  <div class="row mb-3">
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating mb-3 mb-md-0">
                                            <select id="rol" name="rol" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                                <option value="2">Director</option>
                                                <option value="3">Administrativo</option>
                                                <option value="4">Agente</option>
                                            </select>
                                            </div>
                                                </div>
                                                  </div>
                                            <input type="hidden" id="resultadoValidacion" name="resultadoValidacion" value="" />
                                            <div class="mt-4 mb-0">
                                                 <div class="col-md-6 mx-auto">
                                                <div class="form-floating mb-3 mb-md-0">
                                                <div class="d-grid"><button type="submit"   class="btn btn-primary btn-block">Crear Usuario</button></div>
                                            </div>
                                            </div>
                                                </div>
                                        </form>
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
