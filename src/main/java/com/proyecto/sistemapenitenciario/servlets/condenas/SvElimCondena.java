package com.proyecto.sistemapenitenciario.servlets.condenas;

import com.proyecto.sistemapenitenciario.logica.condenas.Condena;
import com.proyecto.sistemapenitenciario.logica.condenas.ControladoraCondena;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvElimCondena", urlPatterns = {"/SvElimCondena"})
public class SvElimCondena extends HttpServlet {
    
    ControladoraCondena controlCondena = new ControladoraCondena();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Condena condena = controlCondena.traerCondena(id);

        HttpSession misesion = request.getSession();
        misesion.setAttribute("condenaElim", condena);

        response.sendRedirect("pages_condenas/eliminarCondena.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Condena condena = (Condena) request.getSession().getAttribute("condenaElim");
        condena.setEstado(false);
        
        controlCondena.DesactivarCondena(condena);
        
        response.sendRedirect("SvCondenasList");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
