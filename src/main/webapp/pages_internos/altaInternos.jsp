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
        <title>Registrar Interno</title>
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <link href="css_internos/Styles_Internos.css" rel="stylesheet" type="text/css"/>

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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Registrar Interno</h3></div>
                                    <div class="card-body" style="text-align: center">

                                        <form id="formularioAlta" action="../SvInternos" method="POST" onsubmit="return validarFormulario()" >
                                            <% List<Establecimiento> establecimientos = (List<Establecimiento>) request.getSession().getAttribute("listaEstablecimientos");
                                            %>

                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <select id="tipoDoc" name="tipoDoc"   class="mi-selector form-select "  >
                                                            <option disabled="" selected="">Tipo de Documento</option>
                                                            <option value="DNI">DNI</option>
                                                            <option value="Pasaporte">Pasaporte</option>
                                                        </select>
                                                        <select id="estCivil" name="estCivil"  class="mi-selector form-select "  >
                                                            <option  disabled="" selected="">Estado Civil</option>
                                                            <option value="Soltero">Soltero</option>
                                                            <option value="Casado">Casado</option>
                                                            <option value="Viudo">Viudo</option>
                                                        </select>

                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="dni" name="dni" type="text" placeholder="DNI"  />
                                                        <label for="dni">Numero de Documento</label>

                                                 

                                                  
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="apellido" name="apellido" type="text" placeholder="Apellido" />
                                                        <label for="apellido">Apellido</label>

                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="nombre" name="nombre" type="text" placeholder="Nombre" />
                                                        <label for="nombre">Nombre</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="apodo" name="apodo" type="text" placeholder="Apodo" />
                                                        <label for="apodo">Apodo</label>

                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="domicilio" name="domicilio" type="text" placeholder="Provincia de Nacimiento" />
                                                        <label for="provincia">Domicilio</label>


                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="dpto_nac" name="dpto_nac" type="text" placeholder="Provincia de Nacimiento" />
                                                        <label for="provincia">Departamento de Nacimiento</label>

                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="provincia" name="provincia" type="text" placeholder="Provincia de Nacimiento" />
                                                        <label for="provincia">Provincia de Nacimiento</label>


                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4 ">

                                                    <p>Sexo:</p>
                                                    <input class="form-check-input" type="radio" name="sexo" id="checkFemenino" value="femenino">
                                                    <label class="form-check-label" for="checkFemenino">Femenino</label>

                                                    <br>
                                                    <input class="form-check-input" type="radio" name="sexo" id="checkMasculino" value="masculino">
                                                    <label class="form-check-label" for="checkMasculino">Masculino</label>


                                                </div>
                                                <div class="col-md-4 ">

                                                    <div class="form-group" style="padding-top:2% ;" >
                                                        <p >Fecha Nacim.</p>


                                                        <input  type="text" class="form-control" id="fechaNac" name="fechaNac" width="190">


                                                    </div>
                                                </div>
                                                <div class="col-md-4 "style="padding-top:1%  ;">

                                                    <div class="form-group">
                                                        <p >Fecha Ingreso</p>


                                                        <input  type="text" class="form-control" id="fechaIngreso" name="fechaIngreso" width="190">


                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <select id="profesion" name="profesion"  class="mi-selector form-select "  >
                                                            <option  disabled="" selected="">Seleccione una Profesion</option>
                                                            <option value="Ninguna">Ninguna</option>
                                                            <option value="Médico">Medico</option>
                                                            <option value="Arquitecto">Arquitecto</option>
                                                            <option value="Cocinero">Cocinero</option>
                                                        </select>
                                                        <select id="establecimientos" name="establecimientos"  class="mi-selector form-select "  >

                                                            <option  disabled="" selected="">Selecciona un Establecimiento</option>
                                                            <%     for (Establecimiento est : establecimientos) {%>
                                                            <option value="<%=est.getId_establecimiento()%>"> <%=est.getNombre()%></option>
                                                            <%

                                                                };
                                                            %>
                                                        </select>

                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">


                                                        <input class="form-control" id="nacionalidad" name="nacionalidad" type="text" placeholder="Nacionalidad" />
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