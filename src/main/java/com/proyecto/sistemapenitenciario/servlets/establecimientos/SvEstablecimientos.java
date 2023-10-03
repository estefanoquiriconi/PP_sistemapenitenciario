package com.proyecto.sistemapenitenciario.servlets.establecimientos;

import com.proyecto.sistemapenitenciario.logica.establecimiento.ControladoraEstablecimiento;
import com.proyecto.sistemapenitenciario.logica.establecimiento.Establecimiento;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvEstablecimientos", urlPatterns = {"/SvEstablecimientos"})
public class SvEstablecimientos extends HttpServlet {

    ControladoraEstablecimiento control = new ControladoraEstablecimiento();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Establecimiento> listaEstablecimientos = new ArrayList<>();
        listaEstablecimientos = control.traerEstablecimientos();


        HttpSession misesion = request.getSession();
        misesion.setAttribute("listaEstablecimientos", listaEstablecimientos);

        if (!(request.getParameter("altaInternos") == null)) {
            if (request.getParameter("altaInternos").equals("1")) {
                response.sendRedirect("pages_internos/altaInternos.jsp");
            }
        } else {
            response.sendRedirect("pages_establecimientos/mostrarEstablecimientos.jsp");
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String nombre = request.getParameter("nombre");
        String ciudad = request.getParameter("ciudad");
        int capacidad = Integer.parseInt(request.getParameter("capacidad"));
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");

        System.out.println(request.getParameter("nombre"));
        System.out.println(request.getParameter("ciudad"));
        System.out.println(request.getParameter("direccion"));

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
