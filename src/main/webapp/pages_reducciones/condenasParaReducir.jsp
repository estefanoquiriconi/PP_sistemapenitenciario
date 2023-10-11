<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.proyecto.sistemapenitenciario.logica.condenas.Condena"%>
<%@page import="com.proyecto.sistemapenitenciario.logica.usuario.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Condenas</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="../css/stylesPages.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Inclusive+Sans&family=Montserrat:wght@500&display=swap" rel="stylesheet">
    </head>
    <body class="sb-nav-fixed">
        <%@include file="../components/controlSession.jsp"%>
        <%@include file="../components/topnav.jsp"%>
        <div id="layoutSidenav">
            <%@include file="../components/sidenav_menu.jsp"%>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Condenas</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Listado
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Condena</th>
                                            <th>Nombre completo</th>
                                            <th>Documento</th>
                                            <th>Delito</th>
                                            <th>Juez</th>
                                            <th>Detención</th>
                                            <th>Inicio</th>
                                            <th>Duración</th>
                                            <th>Fin</th>
                                            <th>Estado</th>
                                            <th>Acción</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Condena</th>
                                            <th>Nombre completo</th>
                                            <th>Documento</th>
                                            <th>Delito</th>
                                            <th>Juez</th>
                                            <th>Detención</th>
                                            <th>Inicio</th>
                                            <th>Duración</th>
                                            <th>Fin</th>
                                            <th>Estado</th>
                                            <th>Acción</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <%
                                            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                            List<Condena> listaCondenas = (List) request.getSession().getAttribute("listaCondenas");
                                            if (listaCondenas != null) {
                                                for (Condena condena : listaCondenas) {
                                                    if (condena.getEstado() && condena.getDuracionDias() > 0) {
                                        %>
                                        <tr>
                                            <td><%=condena.getIdCondena() + "-" + condena.getCodCondena()%></td>
                                            <td><%=condena.getFkInterno().getApellido() + " " + condena.getFkInterno().getNombre()%></td>
                                            <td><%=condena.getFkInterno().getNumDoc()%></td>
                                            <td><%=condena.getFkDelito().getDescripcion()%></td>
                                            <td><%=condena.getJuez()%></td>
                                            <td><%=sdf.format(condena.getFechaDetencion())%></td>
                                            <td><%=sdf.format(condena.getFechaInicio())%></td>
                                            <td><%=condena.getDuracionDias()%></td>
                                            <td><%=sdf.format(condena.getFechaFin())%></td>
                                            <%if (condena.getEstado()) { %>
                                            <td><p style="color: blue">Activo</p></td>
                                            <% } else { %>
                                            <td><p style="color: red">Inactivo</p></td>
                                            <%}%>
                                            <td>

                                                <form name="reducir" action="../SvReducciones" method="POST">
                                                    <button type="submit" class="btn btn-dark btn-user btn-block" style="margin-right: 5px; "> 
                                                        <i class="fa-solid fa-award"></i> Reducir 
                                                    </button>
                                                    <input type="hidden" name="id" value="<%=condena.getIdCondena()%>">
                                                </form>
                                            </td>
                                        </tr>
                                        <% }%>
                                        <%
                                            }
                                        } else {
                                        %>
                                    <p>No hay condenas registradas!</p>
                                    <%
                                        }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <%@include file="../components/footer.jsp"%>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../js/datatables-simple-demo.js"></script>
        <% }%>
    </body>
</html>
