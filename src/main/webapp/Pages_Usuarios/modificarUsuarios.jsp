
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
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Editar Usuario</h3></div>
                                    <div class="card-body" style="text-align: center">
                                        <form id="formularioModificar"action="../SvUsuariosModificar" method="POST" onsubmit="return validarUsuario('formularioModificar')">    
                                            <% Usuario user = (Usuario) request.getSession().getAttribute("usuModificar");
                                            %>
                                            <div class="form-floating mb-3 mx-auto">
                                                <h5 style="text-align: center"><strong>ID: </strong><%=user.getId()%></h5>
                                            </div>
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating">
                                                    <input class="form-control" autofocus="" name="nombre" id="nombre" type="text" value="<%=user.getNombre()%>" />
                                                    <label for="nombre">Nombre:</label><div id="error-messageUser" class="alert alert-danger" style="display: none;"></div>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating">
                                                    <input class="form-control" name="password" id="password" type="password" value="<%=user.getPassword()%>" />
                                                    <label for="password">Contraseña:</label><div id="error-messagePass" class="alert alert-danger" style="display: none;"></div>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <div class="form-floating">
                                                        <input class="form-control"  id="passwordConfirm" name="passwordConfirm" type="password" placeholder="Confirm password" />
                                                        <label for="PasswordConfirm">Confirmar contraseña</label><div id="error-messagePassConfirm" class="alert alert-danger" style="display: none;">
                                                        </div>
                                                    </div>
                                                    <br>
                                                  
                                                        <div class="form-floating mb-3 mb-md-0">
                                                            <select id="rol" name="rol" value="<%=user.getRolString()%>" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" style="height:20% ;width: 80%">
                                                                <option value="2">Director</option>
                                                                <option value="3">Administrativo</option>
                                                                <option value="4">Agente</option>
                                                            </select>
                                                        </div>
                                                    
                                                    <br>
                                                    <div class="col-md-6 mx-auto" >
                                                        <div class="form-check form-switch" style="text-align: initial">
                                                            <% if (user.isEstado()) { %>
                                                            <label for="estado">Desactivar</label>    
                                                            <input class="form-check-input" type="checkbox" id="estadoInvalido" name="estado" checked="">
                                                            <% } else { %>
                                                            <input class="form-check-input" type="checkbox" id="estadoValido" name="estado">
                                                            <label for="estado">Habilitar</label>
                                                            <% }%>
                                                        </div>
                                                    </div>

                                                    <div class="mt-4 mb-0 mx-auto">
                                                        <button class="btn btn-primary btn-user" type="submit" style="background-color: red; width: 100%">
                                                            Guardar
                                                        </button>

                                                    </div>
                                                    <input type="hidden" id="resultadoValidacion" name="resultadoValidacion" value="" />
                                                    </form>
                                                    <div class="mt-4 mb-0">
                                                        <form action="../SvUsuarios" method="GET">
                                                            <button class="btn btn-primary btn-user btn-block" type="submit" style="width: 100%">
                                                                Regresar
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