package com.proyecto.sistemapenitenciario.servlets.establecimientos;

import com.proyecto.sistemapenitenciario.logica.establecimiento.ControladoraEstablecimiento;
import com.proyecto.sistemapenitenciario.logica.establecimiento.Establecimiento;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvEliminarEstablecimiento", urlPatterns = {"/SvEliminarEstablecimiento"})
public class SvEliminarEstablecimiento extends HttpServlet {

    ControladoraEstablecimiento control = new ControladoraEstablecimiento();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Establecimiento est = control.traerEstablecimeinto(id);

        HttpSession misesion = request.getSession();
        misesion.setAttribute("estEliminar", est);

        response.sendRedirect("pages_establecimientos/bajaEstablecimientos.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Establecimiento est = (Establecimiento) request.getSession().getAttribute("estEliminar");
        est.setEstado(false);
        
        control.EliminarEstablecimiento(est);
        
        response.sendRedirect("SvEstablecimientos");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
