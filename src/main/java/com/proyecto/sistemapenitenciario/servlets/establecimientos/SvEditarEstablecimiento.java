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

@WebServlet(name = "SvEditarEstablecimiento", urlPatterns = {"/SvEditarEstablecimiento"})
public class SvEditarEstablecimiento extends HttpServlet {

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
        misesion.setAttribute("estEditar", est);

        response.sendRedirect("pages_establecimientos/modificarEstablecimientos.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String nombre = request.getParameter("nombre");
        String ciudad = request.getParameter("ciudad");
        String direccion = request.getParameter("direccion");
        int capacidad = Integer.parseInt(request.getParameter("capacidad"));
        String telefono = request.getParameter("telefono");
        String valorCheck = request.getParameter("estado");
        boolean estado = "on".equals(valorCheck);

        Establecimiento est = (Establecimiento) request.getSession().getAttribute("estEditar");

        est.setNombre(nombre);
        est.setCiudad(ciudad);
        est.setDireccion(direccion);
        est.setCapacidad(capacidad);
        est.setTelefono(telefono);
        est.setEstado(estado);
        

        control.editarEstablecimiento(est);

        response.sendRedirect("SvEstablecimientos");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
