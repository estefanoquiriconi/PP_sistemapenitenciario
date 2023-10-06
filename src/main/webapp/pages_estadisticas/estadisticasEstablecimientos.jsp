<%@page import="com.proyecto.sistemapenitenciario.logica.establecimiento.Establecimiento"%>
<%@page import="com.proyecto.sistemapenitenciario.logica.interno.Interno"%>
<%@page import="com.proyecto.sistemapenitenciario.logica.usuario.Usuario"%>
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
        <title>Estadísticas Establecimientos</title>
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
                        List<Interno> listaInternos = (List) request.getSession().getAttribute("listaInternosEstadisticas");
                        List<Establecimiento> listaEstablecimientos = (List) request.getSession().getAttribute("listaEstablecimientosEstadisticas");
                        List<Integer> cantidadInternosPorEstablecimiento = new ArrayList<>();
                        if (listaInternos != null) {
                            for (Establecimiento est : listaEstablecimientos) {
                                int cont = 0;
                                for (Interno interno : listaInternos) {
                                    if (interno.getIdEstablecimiento().getId_establecimiento() == est.getId_establecimiento() && interno.getEstado()) {
                                        cont++;
                                    }
                                }
                                cantidadInternosPorEstablecimiento.add(cont);
                            }
                        }
                        int capacidadMaxima = Integer.MIN_VALUE;
                        List<String> nombresEstablecimientos = new ArrayList<>();
                        for (Establecimiento est : listaEstablecimientos) {
                            nombresEstablecimientos.add(est.getNombre());
                            int capacidadActual = est.getCapacidad();
                            if (capacidadActual > capacidadMaxima) {
                                capacidadMaxima = capacidadActual;
                            }
                        }
                    %>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-chart-bar me-1"></i>
                            Cantidad de Internos por establecimientos
                        </div>
                        <div class="card-body"><canvas id="myBarChart" width="100%" height="50"></canvas></div>
                        <div class="card-footer small text-muted"><p>Actualizado el: <span id="fecha"></span></p></div>
                    </div>
                </main>
                <%@include file="../components/footer.jsp"%>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script>
// Set new default font family and font color to mimic Bootstrap's default styling
            Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
            Chart.defaults.global.defaultFontColor = '#292b2c';
            const internosPorEstablecimiento = <%=cantidadInternosPorEstablecimiento%>;
            const establecimientos = [];
            <% for (Establecimiento est : listaEstablecimientos) {
            %>
            establecimientos.push("<%=est.getNombre()%>" + ": " + <%=est.getCapacidad()%>);
            <%}%>
// Bar Chart Example
            var ctx = document.getElementById("myBarChart");
            var myLineChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: establecimientos,
                    datasets: [{
                            label: "Internos",
                            backgroundColor: "rgba(2,117,216,1)",
                            borderColor: "rgba(2,117,216,1)",
                            data: <%=cantidadInternosPorEstablecimiento%>
                        }]
                },
                options: {
                    scales: {
                        xAxes: [{
                                time: {
                                    unit: 'month'
                                },
                                gridLines: {
                                    display: false
                                },
                                ticks: {
                                    maxTicksLimit: 10
                                }
                            }],
                        yAxes: [{
                                ticks: {
                                    min: 0,
                                    max: <%=capacidadMaxima%>,
                                    maxTicksLimit: 10
                                },
                                gridLines: {
                                    display: true
                                }
                            }]
                    },
                    legend: {
                        display: false
                    }
                }
            });
        </script>
        <script src="js/calcularFechaActual.js" type="text/javascript"></script>
        <% }%> 
    </body>
</html>

