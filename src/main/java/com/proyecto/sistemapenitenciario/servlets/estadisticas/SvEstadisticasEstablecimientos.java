package com.proyecto.sistemapenitenciario.servlets.estadisticas;

import com.proyecto.sistemapenitenciario.logica.establecimiento.ControladoraEstablecimiento;
import com.proyecto.sistemapenitenciario.logica.establecimiento.Establecimiento;
import com.proyecto.sistemapenitenciario.logica.interno.ControladoraInterno;
import com.proyecto.sistemapenitenciario.logica.interno.Interno;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvEstadisticasEstablecimientos", urlPatterns = {"/SvEstadisticasEstablecimientos"})
public class SvEstadisticasEstablecimientos extends HttpServlet {
    
    ControladoraInterno controlInterno = new ControladoraInterno();
    ControladoraEstablecimiento controlEstablecimiento = new ControladoraEstablecimiento();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        List<Interno> listaInternos = controlInterno.traerInternos();
        List<Establecimiento> listaEstablecimiento = controlEstablecimiento.traerEstablecimientos();

        HttpSession misesion = request.getSession();
        misesion.setAttribute("listaInternosEstadisticas", listaInternos);
        misesion.setAttribute("listaEstablecimientosEstadisticas", listaEstablecimiento);

        response.sendRedirect("pages_estadisticas/estadisticasEstablecimientos.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
