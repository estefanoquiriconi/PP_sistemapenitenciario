<%@page import="java.text.SimpleDateFormat"%>
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
        <title>Editar Condena</title>
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Editar Condena</h3></div>
                                    <div class="card-body" style="text-align: center">
                                        <form action="../SvEditCondena" method="POST" onsubmit="return validarFormulario();">    
                                            <% Condena condena = (Condena) request.getSession().getAttribute("condenaEdit");
                                                SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
                                                String strFechaDetencion = formato.format(condena.getFechaDetencion());
                                                String strFechaInicio = formato.format(condena.getFechaInicio());
                                            %>
                                            <div class="form-floating mb-3 mx-auto">
                                                <h5 style="text-align: center"><strong>ID: </strong><%=condena.getIdCondena()%></h5>
                                                <h5 style="text-align: center"><strong>Código: </strong><%=condena.getCodCondena()%></h5>
                                            </div>
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating">
                                                    <input class="form-control" name="juez" id="juez" type="text"  value="<%=condena.getJuez()%>"/>
                                                    <label for="juez">Juez</label>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating">
                                                    <input class="form-control" value="<%=strFechaDetencion%>" name="fechaDetencion" id="fechaDetencion" type="date">
                                                    <label for="fechaDentencion">Fecha Detención</label>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating">
                                                    <input class="form-control" name="fechaInicio" id="fechaInicio" type="date" value="<%=strFechaInicio%>"/>
                                                    <label for="fechaInicio">Fecha de Inicio</label>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating">
                                                    <input class="form-control" name="cantDias" id="cantDias" type="number" value="<%=condena.getDuracionDias()%>" />
                                                    <label for="cantDias">Duración en días</label>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-md-6 mx-auto">
                                                <div class="form-floating">
                                                    <select id="delito" name="delito"  class="form-select mb-3">
                                                        <option value="1" <% if (condena.getFkDelito().getIdDelito() == 1) {%> selected<%}%>>Robo a mano armada</option>
                                                        <option value="2" <% if (condena.getFkDelito().getIdDelito() == 2) {%> selected<%}%>>Homicidio</option>
                                                        <option value="3" <% if (condena.getFkDelito().getIdDelito() == 3) {%> selected<%}%>>Tráfico de Drogas</option>
                                                        <option value="4" <% if (condena.getFkDelito().getIdDelito() == 4) {%> selected<%}%>>Apropiación Indebida</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div id="mensajeError" class="text-danger mb-3"></div>
                                            <div class="col-md-6 mx-auto" >
                                                <div class="form-check form-switch" style="text-align: initial">
                                                    <% if (condena.getEstado()) { %>
                                                    <input class="form-check-input" type="" id="estadoValido" name="estado" hidden="" checked="true">
                                                    <% } else { %>
                                                    <input class="form-check-input" type="checkbox" id="estadoInvalido" name="estado">
                                                    <label for="estado">Habilitar</label>
                                                    <% }%>
                                                </div>
                                            </div>
                                            <div id="mensajeError" style="color: red;"></div>
                                            <div class="mt-4 mb-0 mx-auto">
                                                <button class="btn btn-dark btn-user" type="submit" style="width: 50%">
                                                    Guardar
                                                </button>
                                                <input type="hidden" name="id" value="<%=condena.getIdCondena()%>">
                                            </div>
                                        </form>
                                        <div class="mt-4 mb-0">
                                            <form action="../SvCondenasList" method="GET">
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
        <script src="js/validacionesCondena.js" type="text/javascript"></script>
    </body>
</html>