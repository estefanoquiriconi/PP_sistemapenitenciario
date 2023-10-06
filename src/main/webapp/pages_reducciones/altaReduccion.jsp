<%@page import="com.proyecto.sistemapenitenciario.logica.condenas.Condena"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Registrar Condena</title>
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="../css/stylesPages.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Croissant+One&family=DM+Serif+Display:ital@0;1&family=Inclusive+Sans&family=Montserrat:wght@500&family=Roboto+Slab&display=swap" rel="stylesheet">
    </head>
    <body class="bg-dark">
        <% Condena condenaReduc = (Condena) request.getSession().getAttribute("condenaReduc");%>
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h2 class="text-center font-weight-light my-4">Registrar Reducción</h2></div>
                                    <div class="card-body" style="text-align: center">
                                        <form action="../SvCargarReduccion" method="POST" style="align-items: center" onsubmit="return validarFormulario()">
                                            <div class="form-floating mb-6 mx-auto">
                                                <h5><strong>Condena: </strong><%=condenaReduc.getCodCondena()%></h5>
                                                <h5><strong>Apellido: </strong><%=condenaReduc.getFkInterno().getApellido() %></h5>
                                                <h5><strong>Nombre: </strong><%=condenaReduc.getFkInterno().getNombre()%></h5>
                                            </div>
                                            <br>
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating">
                                                    <select id="motivo" name="motivo"  class="form-select mb-3">
                                                        <option disabled selected>Seleccione el motivo</option>
                                                        <option value="Profesión">Profesión</option>
                                                        <option value="Colaboración con la justicia">Colaboración con la justicia</option>
                                                        <option value="Buen comportamiento">Buen comportamiento</option>
                                                        <option value="Trabajo">Trabajo</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating">
                                                    <input class="form-control" name="fechaReduc" id="fechaReduc" type="date" placeholder="Fecha de Reducción"/>
                                                    <label for="fechaReduc">Fecha de reducción</label>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating">
                                                    <input class="form-control" name="tiempoDias" id="tiempoDias" type="number" placeholder="Tiempo en días" max="<%=condenaReduc.getDuracionDias()%>" />
                                                    <label for="tiempoDias">Tiempo en días</label>
                                                </div>
                                            </div>
                                            <br>
                                            <div id="mensajeError" class="text-danger mb-3"></div>
                                            <input type="text" name="idCondena" hidden="" value="<%=condenaReduc.getIdCondena()%>">
                                            <div class="mt-4 mb-0 mx-auto">
                                                <button class="btn btn-dark btn-user" type="submit" style="width: 50%">
                                                    Guardar
                                                </button>
                                            </div>
                                        </form>
                                        <div class="mt-4 mb-0">
                                            <form action="../index.jsp" method="GET">
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
        </div>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/validarFormulario.js" type="text/javascript"></script>
    </body>
</html>