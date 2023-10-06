package com.proyecto.sistemapenitenciario.servlets.reducciones;

import com.proyecto.sistemapenitenciario.logica.condenas.ControladoraReduccion;
import com.proyecto.sistemapenitenciario.logica.condenas.ReduccionCondenas;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvReduccionesList", urlPatterns = {"/SvReduccionesList"})
public class SvReduccionesList extends HttpServlet {

    ControladoraReduccion controlReduccion = new ControladoraReduccion();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<ReduccionCondenas> listaReducciones = new ArrayList<>();
        listaReducciones = controlReduccion.traerReducciones();

        HttpSession misesion = request.getSession();
        misesion.setAttribute("listaReducciones", listaReducciones);

        response.sendRedirect("pages_reducciones/mostrarReducciones.jsp");
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
