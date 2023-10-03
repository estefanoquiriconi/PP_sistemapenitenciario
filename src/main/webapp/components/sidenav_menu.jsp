<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading">
                    <h6 style="text-align:center">Menú</h6>
                </div>
                <%
                    if (usuario != null && usuario.getRol() == 1) {
                %>

                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseUsuarios" aria-expanded="false" aria-controls="collapseUsuarios">
                    <div class="sb-nav-link-icon"><i class="fa-solid fa-user"></i></div>
                    Usuarios
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseUsuarios" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="../Pages_Usuarios/altaUsuarios.jsp">Alta</a>
                        <a class="nav-link" href="../SvUsuarios">Listado</a>
                    </nav>
                </div>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseEstablecimientos" aria-expanded="false" aria-controls="collapseEstablecimientos">
                    <div class="sb-nav-link-icon"><i class="fa-solid fa-building-shield"></i></i></div>
                    Establecimientos
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseEstablecimientos" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="../pages_establecimientos/altaEstablecimientos.jsp">Alta</a>
                        <a class="nav-link" href="../SvEstablecimientos">Listado</a>
                    </nav>
                </div>
                <% }%>

                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseInternos" aria-expanded="false" aria-controls="collapseInternos">
                    <div class="sb-nav-link-icon"><i class="fa-solid fa-handcuffs"></i></i></div>
                    Internos
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseInternos" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <%
                            if (usuario != null && (usuario.getRol() != 4)) {
                        %>
                        <form action="../SvEstablecimientos" method="get" id="formAltaInternos">
                            <input type="hidden" id="altaInternos" name="altaInternos" value="1">
                        </form>

                        <a href="#" class="nav-link" onclick="document.getElementById('formAltaInternos').submit(); return false;">Alta</a>
                        <% }%>
                        <a class="nav-link" href="../SvInternos">Listado</a>
                    </nav>
                </div>
                <%
                    if (usuario != null && (usuario.getRol() != 4)) {
                %>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseCondenas" aria-expanded="false" aria-controls="collapseCondenas">
                    <div class="sb-nav-link-icon"><i class="fa-solid fa-box-archive"></i></i></i></div>
                    Condenas
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseCondenas" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <form action="../SvInternos" method="GET" id="formAltaCondena">
                            <input type="hidden" id="altaCondena" name="altaCondena" value="1">
                        </form>
                        <a href="#" class="nav-link" onclick="document.getElementById('formAltaCondena').submit(); return false;">Cargar</a>
                        <a class="nav-link" href="../SvCondenasList">Listado</a>
                    </nav>
                </div>

                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseEstadisticas" aria-expanded="false" aria-controls="collapseEstadisticas">
                    <div class="sb-nav-link-icon"><i class="fa-solid fa-chart-simple"></i></div>
                    Estadísticas
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseEstadisticas" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a href="../SvEstadisticasDelitos" class="nav-link">Delitos</a>
                    </nav>
                </div>
                <% }%>
            </div>
        </div>
        <div class="sb-sidenav-footer">
            <div class="small">Conectado como:</div>
            <p> <%=request.getSession().getAttribute("usuSession")%> </p>
        </div>
    </nav>
</div>
