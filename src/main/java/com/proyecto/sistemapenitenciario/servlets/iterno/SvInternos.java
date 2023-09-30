package com.proyecto.sistemapenitenciario.servlets.iterno;

import com.proyecto.sistemapenitenciario.logica.interno.ControladoraInterno;
import com.proyecto.sistemapenitenciario.logica.interno.Interno;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvInternos", urlPatterns = {"/SvInternos"})
public class SvInternos extends HttpServlet {

    ControladoraInterno control = new ControladoraInterno();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Interno> listaInternos = new ArrayList<>();
        listaInternos = control.traerInternos();

        HttpSession misesion = request.getSession();
        if(request.getParameter("altaCondena") != null && request.getParameter("altaCondena").equals("1")){
            misesion.setAttribute("cargaCondenaInterno", true);
        }else{
             misesion.setAttribute("cargaCondenaInterno", false);
        }
        misesion.setAttribute("listaInternos", listaInternos);
        response.sendRedirect("pages_internos/mostrarInternos.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
