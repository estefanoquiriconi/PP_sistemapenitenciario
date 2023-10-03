package com.proyecto.sistemapenitenciario.servlets.iterno;

import com.proyecto.sistemapenitenciario.logica.interno.ControladoraInterno;
import com.proyecto.sistemapenitenciario.logica.interno.Interno;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvInfoInterno", urlPatterns = {"/SvInfoInterno"})
public class SvInfoInterno extends HttpServlet {
    
    ControladoraInterno control = new ControladoraInterno();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Interno interno = control.traerInterno(id);

        HttpSession misesion = request.getSession();
        misesion.setAttribute("infoInterno", interno);

        response.sendRedirect("pages_internos/informacionInterno.jsp");
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
