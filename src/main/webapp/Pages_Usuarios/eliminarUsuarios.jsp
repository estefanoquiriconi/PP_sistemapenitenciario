<%@page import="com.proyecto.sistemapenitenciario.logica.usuario.Usuario"%>
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Eliminar Usuario</h3></div>
                                    <div class="card-body" style="align-self: center">
                                        <% Usuario usuEliminar = (Usuario) request.getSession().getAttribute("usuEliminar");%>
                                        <div class="form-floating mb-6 mx-auto">
                                            <h5><strong>ID: </strong><%=usuEliminar.getId()%></h5>
                                        </div>
                                        <br>
                                        <div class="form-floating mb-6 mx-auto"">
                                            <h5><strong>Nombre: </strong><%=usuEliminar.getNombre() %></h5>
                                        </div>
                                        <br>
                                        <div class="form-floating mb-6 mx-auto"">
                                            <h5><strong>Rol: </strong><%=usuEliminar.getRolString() %></h5>
                                        </div>
                                        <br>
                                       
                                        <div class="mt-4 mb-0">
                                            <div class="d-grid">
                                                <form action="../SvUsuarioEliminar" method="POST">    
                                                    <button class="btn btn-darger btn-user btn-danger" name="confirmarBajaUsuario" value"<%=usuEliminar.getId()%>"type="submit" style="width: 100%">
                                                        Confirmar
                                                    </button>
                                             
                                                </form>
                                            </div>
                                        </div>
                                        <div class="mt-4 mb-0">
                                            <div class="d-grid">
                                                <form action="../SvUsuarios" method="GET">
                                                    <button class="btn btn-dark btn-user btn-block" type="submit" style="width: 100%">
                                                        Cancelar
                                                    </button>
                                                </form>
                                            </div>
                                            <br>
                                        </div>
                                    </div>
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
        <script src="../js/scripts.js"></script>
    </body>
</html>

