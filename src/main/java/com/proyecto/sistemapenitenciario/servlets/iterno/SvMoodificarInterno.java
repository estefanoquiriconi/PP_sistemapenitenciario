package com.proyecto.sistemapenitenciario.servlets.iterno;

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

@WebServlet(name = "SvMoodificarInterno", urlPatterns = {"/SvMoodificarInterno"})
public class SvMoodificarInterno extends HttpServlet {
ControladoraInterno control= new ControladoraInterno();
        ControladoraEstablecimiento controlEstablecimientos = new ControladoraEstablecimiento();
        
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
   
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Establecimiento> est = controlEstablecimientos.traerEstablecimientos();
        int interId = Integer.parseInt(request.getParameter("modificar"));
        Interno inter = control.traerInterno(interId);
        HttpSession misesion = request.getSession();
        misesion.setAttribute("interModificar", inter);
         misesion.setAttribute("listaEstablecimientos",est);
        response.sendRedirect("Pages_Usuarios/modificarInternos.jsp");
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
