<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.proyecto.sistemapenitenciario.logica.interno.Interno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Inforamción Interno</title>
        <link href="../css/styles.css" rel="stylesheet" />
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Información</h3></div>
                                    <div class="card-body" style="align-self: center">
                                        <% Interno interno = (Interno) request.getSession().getAttribute("infoInterno");%>
                                        <div class="form-floating mb-6 ">
                                            <h5><strong>Legajo: </strong><%=interno.getLegajo() %></h5>
                                            <h5><strong>Apellido: </strong><%=interno.getApellido()%></h5>
                                            <h5><strong>Nombre: </strong><%=interno.getNombre() %></h5>
                                            <h5><strong>Apodo: </strong><%=interno.getApodo() %></h5>
                                        </div>
                                        <br>
                                        <div class="form-floating mb-6 mx-auto"">
                                            <h5><strong>Tipo de Documento: </strong><%=interno.getTipoDoc()%></h5>
                                            <h5><strong>Número de Documento: </strong><%=interno.getNumDoc()%></h5>
                                            <h5><strong>Nacionalidad: </strong><%=interno.getNacionalidad() %></h5>
                                            <h5><strong>Domicilio: </strong><%=interno.getDomicilio()%></h5>
                                        </div>
                                        <br>
                                        <div class="form-floating mb-6 mx-auto"">
                                            <%SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                             String fechaNacimiento = sdf.format(interno.getFechaNac());
                                            %>
                                            <h5><strong>Fecha de Nacimiento: </strong><%=fechaNacimiento%></h5>
                                            <h5><strong>Provincia de Nacimiento: </strong><%=interno.getPciaNac()%></h5>
                                            <h5><strong>Departamento de Nacimiento: </strong><%=interno.getDptoNac()%></h5>
                                        </div>
                                        <br>
                                        <div class="form-floating mb-6 mx-auto"">
                                            <h5><strong>Profesión: </strong><%=interno.getProfesion() %></h5>
                                            <h5><strong>Estado Civil: </strong><%=interno.getEstadoCivil() %></h5>
                                            <h5><strong>Sexo: </strong><%=interno.getSexo()%></h5>
                                        </div>
                                        <br>
                                        <div class="form-floating mb-6 mx-auto"">
                                            <h5><strong>Establecimiento: </strong><%=interno.getIdEstablecimiento().getNombre()%></h5>
                                        </div>
                                        <br>
                                        <div class="mt-4 mb-0">
                                            <div class="d-grid">
                                                <form action="../index.jsp" >
                                                    <button class="btn btn-primary btn-user btn-block" type="submit" style="width: 80%">
                                                        Regresar
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