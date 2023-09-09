package com.proyecto.sistemapenitenciario.servlets.establecimientos;

import com.proyecto.sistemapenitenciario.logica.usuario.ControladoraUsuario;
import com.proyecto.sistemapenitenciario.logica.establecimiento.ControladoraEstablecimiento;
import com.proyecto.sistemapenitenciario.logica.establecimiento.Establecimiento;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvEstablecimientos", urlPatterns = {"/SvEstablecimientos"})
public class SvEstablecimientos extends HttpServlet {

    ControladoraEstablecimiento control = new ControladoraEstablecimiento();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombre = request.getParameter("nombre");
        String ciudad = request.getParameter("ciudad");
        int capacidad = Integer.parseInt(request.getParameter("capacidad"));
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");


        Establecimiento est = new Establecimiento();
        est.setNombre(nombre);
        est.setCapacidad(capacidad);
        est.setCiudad(ciudad);
        est.setDireccion(direccion);
        est.setTelefono(telefono);
        est.setEstado(true);

        control.crearEstablecimiento(est);
        response.sendRedirect("index.jsp");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
