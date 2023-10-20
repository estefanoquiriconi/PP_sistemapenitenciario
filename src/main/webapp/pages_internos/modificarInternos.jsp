<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.proyecto.sistemapenitenciario.logica.establecimiento.Establecimiento"%>
<%@page import="com.proyecto.sistemapenitenciario.logica.interno.Interno"%>

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
        <title>Modificar Internos</title>
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <link href="css_internos/Styles_Internos.css" rel="stylesheet" type="text/css"/>
        <script src="JavaScript/Js_internos.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
        <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />
        <!<!-- select con buscador -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="../css/stylesPages.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Inclusive+Sans&family=Montserrat:wght@500&display=swap" rel="stylesheet">

    </head>

    <body class="bg-dark">
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            Usuario usuario = (Usuario) request.getSession().getAttribute("usuSession");
            if (usuario == null) {
                response.sendRedirect("../sinLogin.jsp");
            }
        %>
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">

                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Modificar Internos</h3></div>
                                    <div class="card-body" style="text-align: center">

                                        <form id="formularioAlta" action="../SvMoodificarInterno" method="POST" onsubmit="return validarFormulario()" >
                                            <% Interno inter = (Interno) request.getSession().getAttribute("interModificar");
                                                List<Establecimiento> establecimientos = (List<Establecimiento>) request.getSession().getAttribute("listaEstablecimientos");
                                            %>

                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <select id="estCivil" name="estCivil"  class="mi-selector form-select "  >
                                                            <option  disabled="" >Estado Civil</option>
                                                            <option value="Soltero" <% if (inter.getEstadoCivil().equals("Soltero")) {%>  selected="" <%}%>>Soltero</option>
                                                            <option value="Casado" <% if (inter.getEstadoCivil().equals("Casado")) {%>  selected="" <%}%>>Casado</option>
                                                            <option value="Viudo"<% if (inter.getEstadoCivil().equals("Viudo")) {%>  selected="" <%}%>>Viudo</option>
                                                        </select>
                                                        <select id="tipoDoc" name="tipoDoc"   class="mi-selector form-select "  >
                                                            <option disabled="" >Tipo de Documento</option>
                                                            <option value="DNI"<% if (inter.getTipoDoc().equals("DNI")) {%>  selected="" <%}%>>DNI</option>
                                                            <option value="Pasaporte"<% if (inter.getTipoDoc().equals("Pasaporte")) {%>  selected="" <%}%>>Pasaporte</option>

                                                        </select>

                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="dni" name="dni" type="text" placeholder="DNI" value="<%=inter.getNumDoc()%>" />
                                                        <label for="dni">Numero Documento</label>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="apellido" name="apellido" type="text" placeholder="Apellido" value="<%=inter.getApellido()%>"  />
                                                        <label for="apellido">Apellido</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="nombre" name="nombre" type="text" placeholder="Nombre" value="<%=inter.getNombre()%>" />
                                                        <label for="nombre">Nombre</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="apodo" name="apodo" type="text" placeholder="Apodo" value="<%=inter.getApodo()%>"  />
                                                        <label for="apodo">Apodo</label>

                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="domicilio" name="domicilio" type="text" placeholder="Domicilio" value="<%=inter.getDomicilio()%>"  />
                                                        <label for="provincia">Domicilio</label>


                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="dpto_nac" name="dpto_nac" type="text" placeholder="Departamento de Nacimiento" value="<%=inter.getDptoNac()%>"  />
                                                        <label for="provincia">Departamento de Nacimiento</label>

                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="provincia" name="provincia" type="text" placeholder="Provincia de Nacimiento" value="<%=inter.getPciaNac()%>"  />
                                                        <label for="provincia">Provincia de Nacimiento</label>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4 ">

                                                    <p >Sexo:</p>
                                                    <input class="form-check-input" type="radio" name="sexo" id="checkFemenino" value="femenino" <% if (inter.getSexo() == 'F') {%> checked=""<%}%>>
                                                    <label class="form-check-label" for="checkFemenino">Femenino</label>

                                                    <br>
                                                    <input class="form-check-input" type="radio" name="sexo" id="checkMasculino" value="masculino" <% if (inter.getSexo() == 'M') {%> checked=""<%}%>>
                                                    <label class="form-check-label" for="checkMasculino">Masculino</label>


                                                </div>
                                                <div class="col-md-4 ">

                                                    <div class="form-group" style="padding-top:2% ;" >
                                                        <p >Fecha Nacim.</p>
                                                        <%SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                                            String fechaNacimiento = sdf.format(inter.getFechaNac());
                                                        %>

                                                        <input  type="text" class="form-control" id="fechaNac" name="fechaNac" width="190" value="<%=fechaNacimiento%>">


                                                    </div>
                                                </div>
                                                <div class="col-md-4 "style="padding-top:1%  ;">

                                                    <div class="form-group">
                                                        <p >Fecha Ingreso</p>
                                                        <%
                                                            String fechaIngreso = sdf.format(inter.getFechaIngreso());
                                                        %>

                                                        <input  type="text" class="form-control" id="fechaIngreso" name="fechaIngreso" width="190" value="<%=fechaIngreso%>">


                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <select id="profesion" name="profesion"  class="mi-selector form-select "  >
                                                            <option  disabled="">Seleccione una Profesion</option>
                                                            <option value="Ninguna" <% if (inter.getProfesion().equals("Ninguna")) {%> selected=""<%}%>>Ninguna</option>
                                                            <option value="Médico"<% if (inter.getProfesion().equals("Médico")) {%> selected=""<%}%>>Médico</option>
                                                            <option value="Arquitecto"<% if (inter.getProfesion().equals("Arquitecto")) {%> selected=""<%}%>>Arquitecto</option>
                                                            <option value="Ingeniero" <% if (inter.getProfesion().equals("Ingeniero")) {%> selected=""<%}%>>Ingeniero</option>
                                                            <option value="Profesor"<% if (inter.getProfesion().equals("Profesor")) {%> selected=""<%}%>>Profesor</option>
                                                            
                                                        </select>
                                                        <select id="establecimientos" name="establecimientos"  class="mi-selector form-select "  >

                                                            <option  disabled="" >Selecciona un Establecimiento</option>
                                                            <%     for (Establecimiento est : establecimientos) {%>
                                                            <option value="<%=est.getId_establecimiento()%>"<% if (inter.getIdEstablecimiento().getId_establecimiento() == est.getId_establecimiento()) {%> selected=""<%}%>> <%=est.getNombre()%></option>
                                                            <%

                                                                };
                                                            %>

                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">




                                                        <input class="form-control" id="nacionalidad" name="nacionalidad" type="text" placeholder="Nacionalidad" value="<%=inter.getNacionalidad()%>"  />
                                                        <label for="nacionalidad">Nacionalidad</label>



                                                    </div>
                                                </div>
                                            </div>
                                       
                                            <div id="error-message" class="alert alert-danger" style="display: none;"></div>
                                            <br>
                                            <br>
                                            <div class="col-md-6 mx-auto">
                                                <input type="hidden" id="resultadoValidacion" name="resultadoValidacion" value="" />
                                                <button class="btn btn-dark btn-user" type="submit" style="width: 100%">Guardar</button>
                                            </div>
                                            <br>
                                        </form>
                                        <div class="col-md-6 mx-auto">

                                            <form action="../index.jsp" >
                                                <button class="btn btn-dark btn-user btn-block" type="submit" style="width: 100%">Cancelar</button>
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
        <script src="../js/scripts.js"></script>
        <script src="JavaScript/Js_internos.js" type="text/javascript"></script>




    </body>
</html>