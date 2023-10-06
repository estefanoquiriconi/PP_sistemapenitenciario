<%@page import="com.proyecto.sistemapenitenciario.logica.usuario.Usuario"%>
<%@page import="com.proyecto.sistemapenitenciario.logica.condenas.Condena"%>
<%@page import="java.util.ArrayList"%>
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
        <title>Estadísticas Delitos</title>
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
                    <%
                        List<Condena> listaCondenas = (List) request.getSession().getAttribute("listCondenasDelitos");
                        int robo = 0;
                        int homicidio = 0;
                        int traficDrog = 0;
                        int apropInd = 0;
                        if (listaCondenas != null) {
                            for (Condena condena : listaCondenas) {
                                switch (condena.getFkDelito().getIdDelito()) {
                                    case 1:
                                        robo++;
                                        break;
                                    case 2:
                                        homicidio++;
                                        break;
                                    case 3:
                                        traficDrog++;
                                        break;
                                    case 4:
                                        apropInd++;
                                        break;
                                    default:
                                        break;
                                }
                            }
                        }
                    %>
                    <%
                        List<Integer> arrayDelitos = new ArrayList<>();
                        arrayDelitos.add(robo);
                        arrayDelitos.add(homicidio);
                        arrayDelitos.add(traficDrog);
                        arrayDelitos.add(apropInd);
                    %>
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-chart-pie me-1"></i>
                            Estadísticas de delitos
                        </div>
                        <div class="card-body"><canvas id="myPieChart" width="100%" height="30"></canvas></div>
                        <div class="card-footer small text-muted"><p>Actualizado el: <span id="fecha"></span></p><script></script></div>
                    </div>
                </main>
                <%@include file="../components/footer.jsp"%>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script>
            Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
            Chart.defaults.global.defaultFontColor = '#292b2c';

            var ctx = document.getElementById("myPieChart");
            var myPieChart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: ["Robo a mano armada", "Homicidio", "Tráfico de drogas", "Apropiación indebida"],
                    datasets: [{
                            data: <%=arrayDelitos%>,
                            backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745'],
                        }],
                },
            });
        </script>
        <script src="js/calcularFechaActual.js" type="text/javascript"></script>
        <% }%> 
    </body>
</html>
